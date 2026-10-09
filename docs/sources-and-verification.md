# Sources and verification

Research and repository setup: 2026-10-09.

## Evidence hierarchy

1. The supplied 0.4.15 archive establishes the actual declarations, quantities, assets, and comments in this release.
2. The author's Mod Portal description and forum posts establish historical intent and the obsolete/broken designation.
3. Current official Factorio API documentation establishes the modern schema.
4. Existing local snapshots support the initial name comparison; the later [content evaluation](content-evaluation.md) uses fresh pinned parent sources and an isolated Factorio 2.1.21 parent-only data dump for ownership analysis.
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

The commands in the historical inventory/evaluation sections below apply to discovery commit `de56798e400c9a2a855ebd8ab428c93135fe0448`, before implementation. Run them in a checkout of that revision to reproduce the original records. For the current port, use the [Phase 1 checks](phase-1.md).

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

On the current implementation branch, use `python3 docs/tools/verify_original.py --archive-only` to verify the immutable original import. The strict working-tree command below is for the historical discovery checkout; source changes in the port are intentional.

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

The initial discovery did not launch the game. The later ownership evaluation successfully launched a fresh parent-only Factorio 2.1.21 data-stage baseline as described below. Those discovery results did not include a PFW load, historical playtest, port implementation, economy simulation or migration test. Subsequent implementation results are recorded separately in [Phase 1](phase-1.md).


## Reproduce the content ownership evidence

Use clean parent checkouts at the commits recorded in [content-evaluation.json](data/content-evaluation.json). Prepare an isolated mod directory with the two parent directories and this `mod-list.json`:

```json
{"mods":[{"name":"base","enabled":true},{"name":"Yuoki","enabled":true},{"name":"yi_engines","enabled":true},{"name":"space-age","enabled":false},{"name":"quality","enabled":false},{"name":"elevated-rails","enabled":false},{"name":"recycler","enabled":false}]}
```

Use a separate configuration whose `[path]` section sets `read-data` to the Factorio 2.1.21 data directory and `write-data` to an empty isolated output directory. Do not include PFW or an existing `mod-settings.dat`. Generate the final parent prototype dump:

```sh
/path/to/factorio --config /path/to/isolated/config.ini --mod-directory /path/to/isolated/mods --dump-data
```

Then, from the PFW repository root:

```sh
python3 docs/tools/evaluate_content.py --yuoki /path/to/Yuoki --engines /path/to/yi_engines --dump /path/to/isolated/output/script-output/data-raw-dump.json
python3 docs/tools/verify_original.py
```

The evaluator writes only documentation data. It verifies the original active type counts against the existing inventory, inventories commented literal declarations, compares typed recipe material signatures, records possible parent reference changes and same-product recipe candidates, and snapshots selected final parent prototypes. It refuses dirty parent checkouts. It does not execute original PFW Lua. Its reference-remapping scenario includes unresolved candidates for comparison and must not be used as an implementation mapping.

The successful baseline loaded only core/base, Yuoki and Engines. [Selected load evidence](data/parent-baseline-load.txt) records engine/mod versions and checksums; [evaluation provenance](data/content-evaluation.json) records source commits and the dump SHA-256. A full dump can be regenerated with the commands above; the selected prototype evidence is committed for convenient review.

Validation for this evaluation: successful parent data-stage initialization; exact agreement of the 105 active recipe records with the earlier original-source inventory; coverage of 35 commented recipes and 149 other active/commented declarations; deterministic regeneration of all new evidence files; local Markdown/source-link checks; and unchanged original-file verification. Material matching found no active matches and one commented match after scenario remapping. These checks validate discovery records, not future gameplay behavior.
