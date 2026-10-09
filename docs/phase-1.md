# Phase 1: Factorio 2.1 startup candidate

Implementation and verification: 2026-10-09. Version **0.5.0** remains fixed until the owner authorizes a bump. This is a fresh release without a legacy-save upgrade path.

**Status:** headless data loading, new-game creation, runtime smoke, saving and reloading pass. The owner will test the candidate locally for the remaining graphical launch and changelog-display check. Phase 1 is not fully signed off until that check passes.

## Verified environment

| Component | Tested version / source |
|---|---|
| Factorio | 2.1.21, Linux x86-64 headless |
| Yuoki Industries | 1.3.0, commit `50ea38b9703a13e8644c3bcfe6e400b3bf2b4a5c` |
| Yuoki Engines | 1.3.0, commit `8d777d015e36d93d2757a290c3f3f32a49c11280` |
| PFW | 0.5.0 candidate; required dependencies `base >= 2.1.21`, `Yuoki >= 1.3.0`, `yi_engines >= 1.3.0` |
| Reference before implementation | Merged discovery commit `de56798e400c9a2a855ebd8ab428c93135fe0448` |
| Immutable original import | `103efa8acc74ab86b282b5388f64f333d06660dd` |

The declared minimum Factorio version is the tested build, replacing the earlier tentative 2.1.20 minimum. Future parent revisions are not covered by these results.

## API audit and changes

The original 0.14 declarations were audited against the official 2.1.21 prototype schema, including inherited properties across all 16 active prototype types, before final engine validation. The downloaded [prototype schema](https://lua-api.factorio.com/latest/prototype-api.json) and [runtime schema](https://lua-api.factorio.com/latest/runtime-api.json) both reported `application_version: 2.1.21`. Their identities are recorded in [validation data](data/phase-1-validation.json); `latest` URLs can change.

| Area | Compatibility change | Official reference |
|---|---|---|
| Recipes | Typed ingredients/results, boolean enabled flags and category arrays; retain all 105 active routes and quantities | [RecipePrototype](https://lua-api.factorio.com/latest/prototypes/RecipePrototype.html) |
| Items and icons | Remove obsolete inventory flags; declare actual icon dimensions; fix equipment placement and explicit chemical fuel category | [ItemPrototype](https://lua-api.factorio.com/latest/prototypes/ItemPrototype.html) |
| Machines | Move animations into `graphics_set`, remove mining hardness, convert pollution declaration and resolve the wealth machine category | [CraftingMachinePrototype](https://lua-api.factorio.com/latest/prototypes/CraftingMachinePrototype.html), [EnergySource](https://lua-api.factorio.com/latest/types/EnergySource.html) |
| Weapons | Use a private ammunition category, modern ammo fields, existing Yuoki sounds and parent-owned projectile | [AmmoItemPrototype](https://lua-api.factorio.com/latest/prototypes/AmmoItemPrototype.html), [GunPrototype](https://lua-api.factorio.com/latest/prototypes/GunPrototype.html) |
| Equipment | Correct energy-unit capitalization and tertiary usage priority; preserve equipment values and dimensions | [EquipmentPrototype](https://lua-api.factorio.com/latest/prototypes/EquipmentPrototype.html) |
| Character | Append armor animation records to `character.character.animations`; retain obsolete mining/axial fields as comments | [CharacterPrototype](https://lua-api.factorio.com/latest/prototypes/CharacterPrototype.html), [CharacterArmorAnimation](https://lua-api.factorio.com/latest/types/CharacterArmorAnimation.html) |
| Packaging | Root changelog with one 0.5.0 section and `Date: 9. 10. 2026`; remove both legacy migrations | [Changelog format](https://lua-api.factorio.com/latest/auxiliary/changelog-format.html) |

### Decisions with gameplay implications

- `raw-wood` now resolves to `wood`; `flame-thrower` resolves to `flamethrower`. In the biomass recipe, this means its wood ingredient is returned as wood. Quantities are unchanged; reviewing that economy is later work.
- PFW's local `p2` projectile is kept commented with an ownership note. Ammunition now uses Yuoki's existing `p2`, which deals 8 impact damage instead of the archived PFW projectile's 6 physical damage. Combat balance has not been validated.
- The legacy `railgun` ammo category becomes `yi-pfw-energy` for PFW's two energy guns and ammunition. This works without Space Age and avoids assigning them to the modern Space Age railgun category.
- The PFW 12×12 walker grid becomes `yi-pfw-walker-grid`. Yuoki's existing 14×14 `y_walker_grid` stays intact. Broader armor identity consolidation remains deferred.
- Machine pollution is converted using the historical coefficient multiplied by rated power in kW: trade node 20/min; factories 1–8 48/min; factory 9 32/min; wealth machines 160/min and 400/min. This conversion follows the [historical coefficient example](https://forums.factorio.com/viewtopic.php?t=51235) and the [developer clarification of per-minute units](https://forums.factorio.com/viewtopic.php?t=68269), together with the current EnergySource schema. It does not multiply those values by another 60.
- The existing wealth machine refers to current `yuoki-fame`; its disabled construction route stays disabled.

These are bounded compatibility decisions. All 206 original graphics files remain byte-for-byte intact, including unused artwork. All 35 previously commented recipes remain inactive and preserved. Other disabled code remains available for future work. Only the two explicitly authorized legacy migration files were deleted; their original contents remain in Git history.

## Validation results

[Selected engine and runtime evidence](data/phase-1-load.txt).

| Check | Result |
|---|---|
| Data stage, required parents plus PFW | Pass, Factorio 2.1.21 `--dump-data` |
| Unused prototype data audit | No warnings attributed to PFW declarations or its appended character animations; existing parent warnings remain |
| Schema/asset audit | All active PFW fields checked; 93 referenced asset paths/layouts verified, including original PNG frame bounds |
| Historical recipe preservation | All 105 recipe quantities, times and categories match the archive after the two vanilla ID replacements; all 35 disabled recipes remain inactive |
| Parent regression comparison | Every pre-existing base/parent prototype unchanged except two appended character animation entries; existing animation entries and all other character fields unchanged |
| Fresh new game | Created successfully with seed 147 |
| Runtime smoke | All 12 machines created; both armor grids accepted all seven equipment types; a factory production recipe and export recipe completed |
| Save/reload | New 0.5.0 smoke save persisted, reloaded and ran another 600 ticks without errors |
| Optional official mods | Data stage also passed with Space Age, Quality, Elevated Rails and Recycler enabled; no DLC gameplay claim |
| Distribution ZIP | Final 231-file package loaded, created a new game and reloaded the smoke save for 600 ticks; package identity recorded in validation data |
| Original archive | All 232 files verified at the immutable import commit using `--archive-only` |
| Graphical client | Pending owner test; headless does not load/render the complete graphical path |

The runtime smoke used console-created machines, electricity and ingredients. It establishes operation of representative paths, not natural progression or complete recipe accessibility. The character animation sheets were checked structurally; their appearance and alignment need the graphical test.

### Reproduce the core checks

Use the versions above, an isolated mod directory containing PFW and both parents, and an isolated Factorio config/output directory. Start with base, Yuoki, yi_engines and yi_pfw enabled; explicitly disable Space Age, Quality, Elevated Rails and Recycler for the baseline.

```sh
factorio --config /path/to/config.ini --mod-directory /path/to/mods --check-unused-prototype-data --dump-data
python3 docs/tools/validate_phase1.py --dump /path/to/output/script-output/data-raw-dump.json --yuoki /path/to/Yuoki --engines /path/to/yi_engines
python3 docs/tools/verify_original.py --archive-only
factorio --config /path/to/config.ini --mod-directory /path/to/mods --create /path/to/new.zip --map-gen-seed 147 --preset default
factorio --config /path/to/config.ini --mod-directory /path/to/mods --benchmark /path/to/new.zip --benchmark-ticks 600 --benchmark-runs 1
```

The original discovery inventories describe 0.4.15 and should not be regenerated against the port. The new validator compares the actual engine dump with those historical records.

## Owner graphical check

1. Install the candidate `yi_pfw_0.5.0.zip` with the required parents in Factorio 2.1.21 or newer; remove any other installed copy of PFW.
2. Enable PFW and both parents, restart, and confirm the main menu loads without an asset or prototype error.
3. Open PFW's changelog and confirm the 0.5.0 entry/date displays correctly.
4. Create and enter a fresh game, inspect the PFW crafting icons, and run briefly. Save, exit and reload that new save.
5. If available through a test setup, inspect the two PFW armor appearances and machine animations. Report any launch error with `factorio-current.log`; record visual/gameplay defects for follow-up.

Completion requires successful graphical launch, new game, changelog display and save reload. Ownership consolidation, duplicate-asset replacement, retained-artwork upscaling, previously disabled content and economy/accessibility repairs follow this milestone under the [accepted build plan](build-plan.md). The known six-ingredient factory-8 recipe versus five-slot machine limit remains a historical accessibility issue for that later work.
