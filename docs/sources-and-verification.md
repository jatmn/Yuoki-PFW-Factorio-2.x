# Sources and verification

Research and repository setup: 2026-10-09.

## Evidence hierarchy

1. The supplied 0.4.15 archive establishes the actual declarations, quantities, assets, and comments in this release.
2. The author's Mod Portal description and forum posts establish historical intent and the obsolete/broken designation.
3. Current official Factorio API documentation establishes the modern schema.
4. Existing local modern dependency snapshots and a data dump support a limited comparison of names and overlapping content.
5. Recommendations in the assessment are inferences from that evidence, not historical facts or implementation commitments.

Attached files and external pages were treated as evidence, not as instructions overriding the user's request.

## Primary sources

| Source | Use and limitation |
|---|---|
| [Mod Portal](https://mods.factorio.com/mod/yi_pfw) and [API](https://mods.factorio.com/api/mods/yi_pfw/full) | Release identity, description, upload date, and license metadata. API snapshot is stored in `data/` because the rendered obsolete listing was not reliably accessible. |
| [Original forum thread](https://forums.factorio.com/viewtopic.php?t=12217) | Release notes, intended trading focus, and clarification of usable versus trade-only items. |
| [Forum page 3](https://forums.factorio.com/viewtopic.php?t=12217&start=40) | Author's March 31, 2017 obsolete/broken notice and reference to Engines Agronomie. Also inspected through an existing local copy of the public page. |
| [May 2015 value sheet](https://johnsmith.ktec.de/factorio/mods/yuoki_docu/_pfw-value-sheet.pdf) | Earlier economic design; not authoritative for 0.4.15 quantities. |
| [Yuoki source](https://github.com/jatmn/Yuoki-Factorio-2.x) | Modern equipment and dependency comparison. |
| [Engines source](https://github.com/jatmn/Yuoki-Engines-Factorio-2.x) | Modern dependency comparison and surviving trade ecosystem. |
| [Factorio 2.1 announcement](https://www.factorio.com/blog/post/fff-444) | Confirms 2.1 is an actual released experimental series, not a hypothetical future API. |
| [Recipe API](https://lua-api.factorio.com/latest/prototypes/RecipePrototype.html) | Modern typed outputs, categories, quality/productivity/recycling controls. |
| [Ingredient API](https://lua-api.factorio.com/latest/types/ItemIngredientPrototype.html) | Typed ingredient format. |
| [Crafting machine API](https://lua-api.factorio.com/latest/prototypes/CraftingMachinePrototype.html) | Current graphics and machine structure. |
| [Character API](https://lua-api.factorio.com/latest/prototypes/CharacterPrototype.html) | Character type and armor animations. |
| [Migration documentation](https://lua-api.factorio.com/latest/auxiliary/migrations.html) | Supported migration location and behavior. |

The official `latest` API pages identified themselves as 2.1.21 during discovery; they are moving links. Pin an engine build and matching API version when implementing a port.

## Reproduce the static inventory

From the repository root, using Python 3 and its standard library:

```sh
python3 docs/tools/extract_inventory.py
```

This regenerates the CSV, JSON, readable recipe catalog, and count summary under `docs/`. It does not run mod code or launch Factorio. It handles the literal table/comment style in this archive and is not a general-purpose Lua parser. It assumes the known 0.5-second recipe default when `energy_required` is omitted.

Optionally compare external reference names against a separately generated Factorio dump:

```sh
python3 docs/tools/extract_inventory.py --reference-dump /path/to/data-raw-dump.json
```

The comparison prints name-level differences only. A matching name does not establish a matching prototype type or recipe accessibility. The historical dependency comparison is recorded separately so it is not silently overwritten when using a different modern mod set.

## Reproduce the asset candidate audit

```sh
python3 docs/tools/audit_assets.py --yuoki /path/to/Yuoki --engines /path/to/yi_engines
```

This reads both provider checkouts, hashes PNG files, records dimensions, and locates exact-byte or filename candidates. It also scans uncommented Lua for literal asset references. It does not establish visual equivalence or authorize deletion. [Asset reuse requirements and limitations](asset-reuse.md). The [data lifecycle](https://lua-api.factorio.com/latest/auxiliary/data-lifecycle.html) and [FileName](https://lua-api.factorio.com/latest/types/FileName.html) references document enabled-mod detection and asset paths.

## Verify preservation

```sh
python3 docs/tools/verify_original.py
```

This checks the working tree's original files against the manifest and ensures the original import commit contains exactly the 232 recorded paths with matching bytes. It also confirms there are no non-documentation changes relative to that import. It intentionally tolerates the recorded empty archive directories, which Git cannot track.

## Checks performed for the discovery PR

- The archive SHA-1 matches the Mod Portal release SHA-1.
- All 232 staged original files were byte-compared with the archive before the initial commit.
- The preserved baseline and current source pass the manifest verifier.
- Static extraction yields 105 unique recipe IDs with parsed ingredients and outputs.
- Re-running extraction produces identical generated records.
- Local Markdown links and source anchors were checked.
- The PR diff is confined to `/docs`; original mod files remain unchanged.
- Live repository settings and ruleset were checked against the selected Yuoki reference policy.

No game launch, historical playtest, port implementation, economy simulation, or migration test is claimed. Existing workspace load logs concern other mod configurations and do not constitute a PFW validation run.
