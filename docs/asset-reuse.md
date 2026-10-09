# Parent-mod asset reuse and duplicate removal

## Accepted restoration requirement

On 2026-10-09, the owner added the requirement that the Factorio 2.1 restoration detect Yuoki Industries and Yuoki Engines, reuse the assets those mods now provide, and remove redundant PFW copies so the addon does not carry artwork already supplied by those two mods. Reuse and removal of duplicate assets are the objective. This extends the earlier recommendation to reuse parent-owned equipment into an explicit graphics/asset requirement.

The [accepted build plan](build-plan.md) puts a crash-free launch first. Comprehensive asset ownership, replacement/removal and upscaling follow Phase 1; mapping still precedes deletion. Phase 1 may correct asset paths and metadata as needed for startup. The original import remains the historical record; subsequent implementation commits can remove replaced files without losing that record. This discovery PR records the requirement and audit, and makes no original-source or asset changes.

## Current implementation status

The [0.5.1 replacement mapping](data/asset-reuse-0.5.1.json) implemented 39 visually confirmed replacements, initially retaining 167 original files unchanged. The subsequent [AI-artwork decision](decisions/ai-artwork.md) applies four reviewed redraws; 163 other local files remain unchanged. The latest [arrow-overlay pass](decisions/trade-arrow-overlays.md) removes 49 more variants and leaves 118 local images (four AI redraws and 114 originals). The [second AI batch](ai-artwork-batch-2.md) then redraws eight bases; that batch retained 118 local images (12 AI icons, 106 originals). The [third batch](artwork-batch-3.md) reuses the shared-factory icon from Engines and redraws seven building icons, leaving 117 local images (19 AI icons, 98 originals) and 40 parent replacements. The inventory and candidate tables below remain historical discovery evidence.

## Preserve unused assets and disabled code

The owner explicitly requires keeping unused assets and disabled/commented-out code for future reuse. Preserve them in the maintained source tree; having the originals in Git history is not a substitute for this requirement. Disabled code remains disabled until its behavior is deliberately revisited.

Asset removal is limited to confirmed duplicates supplied by supported Yuoki or Engines versions, with a recorded replacement mapping. Never delete an asset merely because it has no current consumer, is unreferenced by the scanner, or belongs to unfinished content. An unused asset that is also a confirmed parent-owned duplicate may follow the same replacement process; preserve its intended use through the mapping and retained code.

When replacing an asset used by inactive code, retain that code and update its reference or document the provider mapping needed for restoration without enabling the feature. Account for active, conditional, and disabled consumers before removing a duplicate. No dead-code or unused-asset pruning is part of this port.

## Retained artwork resolution requirement

The owner also confirmed that retained PFW-owned artwork should be brought up to suitable modern resolution, consistent with the assets already upgraded in the parent mods. Reuse the parent versions first; upscale retained low-resolution assets after ownership and retention are decided. This requirement does not mean scaling parent-provided files again.

- Inventory retained images by role: GUI/item icons, equipment sprites, entity sheets, and character animation sheets. Record source dimensions, per-frame dimensions, intended display size, and the chosen target.
- Bring retained legacy 32×32 item icons to a reviewed 64×64 target where appropriate, setting `icon_size` to the actual new dimensions. Do not infer image dimensions from filenames such as `*_32.png`.
- Choose sprite and animation targets per asset rather than applying a blanket multiplier. When increasing frame resolution, update frame dimensions and layout metadata together and compensate sprite scale to preserve the intended in-world footprint. Check shifts, layers, shadows, and every animation direction/state.
- Preserve the existing artwork, transparency, silhouettes, and consistent appearance across animation frames. Select the resampling/enhancement method through representative visual comparisons; upscaling cannot recover missing original detail automatically.
- Keep the original artwork recoverable through the baseline commit; avoid shipping old and upscaled copies together when only one is used.

Validate the updated artwork in-game at representative zoom levels. Review icon clarity, transparency, animation alignment, and intended world size, and correct use of parent-provided assets.

## Dependency and selection policy

Both `Yuoki` and `yi_engines` are already required dependencies in the original [info.json](../info.json). Keep them required for the initial restoration and select supported minimum versions once replacements are verified. No standalone mode or bundled duplicate fallback has been requested.

At the data stage, inspect `mods["Yuoki"]` and `mods["yi_engines"]` for the enabled provider versions. Dependency declarations establish availability/load order; data-stage checks select the supported integration. Reference providers through `__Yuoki__/...` and `__yi_engines__/...` paths, rather than copying their images back into the PFW package. Asset choice belongs at prototype construction time, not a runtime tick handler. [Factorio data lifecycle](https://lua-api.factorio.com/latest/auxiliary/data-lifecycle.html), [asset path syntax](https://lua-api.factorio.com/latest/types/FileName.html).

Use a centralized mapping of PFW visuals to parent-owned files or visual definitions. Where appropriate, copy a parent prototype's icon or graphics definition into PFW's own definition without mutating the parent. This helps retain correct metadata for layered or resized artwork. Sharing an image does not establish content equivalence. Apply the separate [content-ownership audit](content-ownership.md) to reuse confirmed parent-owned machines, items, guns, and recipes while retaining unique PFW recipes and preserving redundant local definitions as commented-out code.

## Initial inventory

The audit compares the original archive against the same clean Yuoki and Engines 1.3.0 snapshots used during discovery. Exact provider commits, PNG dimensions, file hashes, and source references are preserved in [asset-audit.json](data/asset-audit.json). The compact [candidate CSV](data/asset-reuse-candidates.csv) lists possible replacements.

| Measurement | Result |
|---|---:|
| PFW PNG files | 206 |
| PFW files with byte-identical matches anywhere in either parent snapshot | 0 |
| PFW files with same-basename candidates in the parents | 39 |
| Candidates with active literal references in PFW Lua | 24 |
| All PFW PNGs with no active literal reference found | 115 |

Parents have changed images over time, so differing hashes do not disprove shared artwork. Treat scaled, recompressed, or renamed versions of the same artwork as reuse candidates too; byte equality is not a prerequisite for replacing the local copy. Conversely, matching names or dimensions do not establish identical visuals or compatible sprite layouts. This first pass does not find all renamed or resized equivalents.

Literal reference scanning excludes Lua comments. An absent literal reference is an inventory observation, not a deletion candidate: generated paths, dependency interactions, optional integration, and intended restoration of currently disabled content still need review. Some parent candidates also live in obsolete directories or lack literal references; their mere presence is insufficient reason to make them a supported dependency contract.

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
| `graphics/entity/gearbox-icon.png` | Engines same-named icon | Preserve future use; remove the local copy only after confirming the parent replacement and recording its mapping |

These are candidates, not approved deletion instructions. The audit also records more minor icons in both providers. The full CSV distinguishes dimensions, hashes, and source references for every match.

## Implementation and deletion order

1. Expand the mapping beyond shared filenames using current prototype ownership, renamed files, and visual comparison. Select one supported provider for each replacement.
2. Record the provider version/path and the complete required metadata: icon size, layers, frames, directions, line length, shifts, scale, and applicable animation fields.
3. Update the modernized PFW prototypes to use those provider assets. Reusing modern item/equipment prototypes and merely sharing their visuals must remain distinguishable.
4. Resolve every PFW reference to each selected local file, including conditional and currently disabled/commented-out code paths. Keep the inactive code and preserve all artwork without an approved parent replacement, including unused files.
5. Remove only confirmed parent-owned duplicates after active references are switched and inactive/future-use mappings are preserved. Do not reintroduce bundled copies as implicit missing-provider fallbacks; unsupported/missing required dependencies should fail clearly.
6. Modernize the retained low-resolution PFW artwork under the resolution requirement above, updating associated prototype metadata and verifying appearance.
7. Check the built distribution itself: approved shared assets must resolve to Yuoki or Engines, with no redundant PFW copies included.

## Acceptance checks for the future port

- The supported Yuoki/Engines version combination is detected at the data stage and PFW uses the chosen provider paths/definitions.
- Missing required providers are handled by dependency validation; unsupported versions do not select nonexistent files.
- Every referenced provider file exists in each supported dependency version.
- No loaded PFW prototype references a removed `__yi_pfw__` asset; retained inactive code has an updated reference or documented replacement mapping.
- Unused assets without confirmed parent replacements and all disabled/commented-out code remain in the maintained source tree. Reference-scan results never trigger automatic deletion.
- Normal graphical Factorio startup and in-game visual inspection confirm icons, machines, equipment, and every retained armor animation. A headless prototype dump alone does not verify appearance.
- The distribution contains no local copies of the approved replaced assets, and unique retained assets still work.
- Retained low-resolution artwork has a documented target and reviewed upscale where needed; icons remain clear and animated assets preserve frame alignment, alpha edges, and intended world size.
- The release archive is checked for redundant artwork as well as broken references; success means using the parent-owned assets and preserving all unique PFW artwork, including unused assets reserved for future work.

Reproduce the initial audit with Python 3:

```sh
python3 docs/tools/audit_assets.py --yuoki /path/to/Yuoki --engines /path/to/yi_engines
```

The tool requires local Git checkouts of both providers to record exact revision identities. It reads PNG headers and hashes bytes; it does not decode images, compare visual similarity, approve replacements, modify the source, or delete any file.
