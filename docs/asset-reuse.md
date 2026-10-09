# Parent-mod asset reuse and package reduction

## Accepted restoration requirement

On 2026-10-09, the owner added the requirement that the Factorio 2.1 restoration detect Yuoki Industries and Yuoki Engines, reuse the assets those mods now provide, and remove redundant PFW copies to reduce the distributed package size. This extends the earlier recommendation to reuse parent-owned equipment into an explicit graphics/asset requirement.

Asset ownership and mapping should happen before the prototype port and before deleting artwork. The original import remains the historical record; subsequent implementation commits can remove replaced files without losing that record. This discovery PR records the requirement and audit, and makes no original-source or asset changes.

## Dependency and selection policy

Both `Yuoki` and `yi_engines` are already required dependencies in the original [info.json](../info.json). Keep them required for the initial restoration and select supported minimum versions once replacements are verified. No standalone mode or bundled duplicate fallback has been requested.

At the data stage, inspect `mods["Yuoki"]` and `mods["yi_engines"]` for the enabled provider versions. Dependency declarations establish availability/load order; data-stage checks select the supported integration. Reference providers through `__Yuoki__/...` and `__yi_engines__/...` paths, rather than copying their images back into the PFW package. Asset choice belongs at prototype construction time, not a runtime tick handler. [Factorio data lifecycle](https://lua-api.factorio.com/latest/auxiliary/data-lifecycle.html), [asset path syntax](https://lua-api.factorio.com/latest/types/FileName.html).

Use a centralized mapping of PFW visuals to parent-owned files or visual definitions. Where appropriate, copy a parent prototype's icon or graphics definition into PFW's own definition without mutating the parent. This helps retain correct metadata for layered or resized artwork. Sharing an image does not automatically authorize changing the item's identity, recipe cost, or behavior; those remain separate integration decisions.

## Initial inventory

The audit compares the original archive against the same clean Yuoki and Engines 1.3.0 snapshots used during discovery. Exact provider commits, PNG dimensions, file hashes, and source references are preserved in [asset-audit.json](data/asset-audit.json). The compact [candidate CSV](data/asset-reuse-candidates.csv) lists possible replacements.

| Measurement | Result |
|---|---:|
| PFW PNG files | 206 |
| PFW PNG file bytes | 11,110,505 |
| PFW files with byte-identical matches anywhere in either parent snapshot | 0 |
| PFW files with same-basename candidates in the parents | 39 |
| Bytes occupied by those 39 PFW candidates | 7,900,540 |
| Candidates with active literal references in PFW Lua | 24 |
| All PFW PNGs with no active literal reference found | 115 |

The 7.9 MB figure is the uncompressed size of candidate local files, not achieved savings, a deletion-approved total, or a ZIP-size estimate. Parents have changed images over time, so differing hashes do not disprove shared artwork. Conversely, matching names or dimensions do not establish identical visuals or compatible sprite layouts. This first pass does not find all renamed or resized equivalents.

Literal reference scanning excludes Lua comments. An absent literal reference is a cleanup lead, not proof of unused content: generated paths, dependency interactions, optional integration, and intended restoration of currently disabled content still need review. Some parent candidates also live in obsolete directories or lack literal references; their mere presence is insufficient reason to make them a supported dependency contract.

## Concrete candidates

| PFW assets | Parent candidates | What to verify |
|---|---|---|
| `graphics/armor/robo1_*` | Yuoki `graphics/armor/robo1_*` | Used by modern character-style source; check all animation states, frame layout, direction count, shifts, and scale |
| `graphics/armor/armor2_*` and `cb3_*` | Yuoki same-named armor assets | Some are referenced in modern styles, others only present; review actual selected armor visuals |
| `graphics/fab2/lasergun.png`, `minigun.png` | Yuoki `graphics/armor/` icons | Confirm current icon metadata and whether PFW reuses the parent gun or retains distinct trade goods |
| `graphics/equip/panz_4-96be.png`, `panz_5-96be.png` | Yuoki `graphics/armor/` shield artwork | Parent equipment uses these sheets; verify the desired equipment identity separately |
| `graphics/equip/energy-128e.png`, `exo1_upgrade_e.png` | Yuoki generator/movement artwork | Reuse full visual metadata where practical |
| `graphics/fab3/neron_u3_32.png` | Yuoki `graphics/armor/neron_u3_32.png` | PFW is 32×32; provider is 64×64 despite retaining the old filename |
| `graphics/imports/trader_sign.png` | Yuoki `graphics/icons/trader_sign.png` | Prefer supported current artwork over the additional `icons/obs/` candidate |
| `graphics/fab3/brain-parasite-1.png` | Engines `graphics/icons/brain-parasite-1.png` | Check modern resolution and the intended PFW visual |
| `graphics/entity/gearbox-icon.png` | Engines same-named icon | Determine whether the local file is needed at all before adding a reference |

These are candidates, not approved deletion instructions. The audit also records more minor icons in both providers. The full CSV distinguishes dimensions, hashes, and source references for every match.

## Implementation and deletion order

1. Expand the mapping beyond shared filenames using current prototype ownership, renamed files, and visual comparison. Select one supported provider for each replacement.
2. Record the provider version/path and the complete required metadata: icon size, layers, frames, directions, line length, shifts, scale, and applicable animation fields.
3. Update the modernized PFW prototypes to use those provider assets. Reusing modern item/equipment prototypes and merely sharing their visuals must remain distinguishable.
4. Resolve every PFW reference to each selected local file, including restored/conditional code paths. Retain unique PFW artwork that has no approved parent replacement.
5. Remove each redundant local file after its consumers have switched. Do not reintroduce bundled copies as implicit missing-provider fallbacks; unsupported/missing required dependencies should fail clearly.
6. Build the actual distribution ZIP and report both file-count and compressed/uncompressed size changes against the original. Do not ship discovery data as game assets merely because `/docs` is in the repository; define packaging scope explicitly when release tooling is added.

## Acceptance checks for the future port

- The supported Yuoki/Engines version combination is detected at the data stage and PFW uses the chosen provider paths/definitions.
- Missing required providers are handled by dependency validation; unsupported versions do not select nonexistent files.
- Every referenced provider file exists in each supported dependency version.
- No loaded PFW prototype references a removed `__yi_pfw__` asset.
- Normal graphical Factorio startup and in-game visual inspection confirm icons, machines, equipment, and every retained armor animation. A headless prototype dump alone does not verify appearance.
- The distribution contains no local copies of the approved replaced assets, and unique retained assets still work.
- Package-size measurements describe the actual release archive, with no assumption that filename-match totals equal savings.

Reproduce the initial audit with Python 3:

```sh
python3 docs/tools/audit_assets.py --yuoki /path/to/Yuoki --engines /path/to/yi_engines
```

The tool requires local Git checkouts of both providers to record exact revision identities. It reads PNG headers and hashes bytes; it does not decode images, compare visual similarity, approve replacements, modify the source, or delete any file.
