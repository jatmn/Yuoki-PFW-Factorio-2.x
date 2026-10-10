# 0.5.1: confirmed parent-content consolidation

The owner confirmed the 0.5.0 candidate appears to work, merged PR #5, and explicitly authorized **0.5.1**. This pass consolidates confirmed successors. The owner subsequently approved the historical gun/shield mappings, restoration of the original Mk.1 component recipe, and retaining every export contract for later balancing. **All migrations wait until a formal release**. Test this development version with a fresh game; no upgrade path is supplied.

## Ownership changes

The central [mapping record](data/parent-content-0.5.1.json) identifies every suppressed declaration, its source file, parent and replacement ID. All 22 redundant declarations remain in source inside annotated Lua comments. The first walker's redundant character animation is also retained commented. The subsequent [asset mapping](data/asset-reuse-0.5.1.json) replaces 39 confirmed duplicate files; 167 local images remain. The subsequent [AI redraw batch](decisions/ai-artwork.md) changes four of those. The [arrow-overlay pass](decisions/trade-arrow-overlays.md) then removes 49 redundant variants, leaving 118 local images. The [second AI batch](ai-artwork-batch-2.md) brings that set to 12 AI icons and 106 originals. The [third batch](artwork-batch-3.md) adds seven sprite-referenced building redraws and one more parent-icon reuse, leaving 19 AI icons and 98 originals. The [fourth batch](artwork-batch-4.md) adds five component redraws, bringing the count to 24 AI icons and 93 originals. The [fifth batch](artwork-batch-5.md) brings the count to 28 AI icons and 89 originals. The [sixth batch](artwork-batch-6.md) brings the count to 30 AI icons and 87 originals. The [seventh batch](artwork-batch-7.md) adds a group icon and equipment sprite, bringing the count to 32 AI artwork assets and 85 originals. The [eighth batch](artwork-batch-8.md) adds two static world sprites, bringing the count to 34 AI artwork assets and 83 originals. After the requested superseded-sheet cleanup, current totals are 41 parent replacements, 34 AI artwork assets, 75 retained originals and seven additional removed animation sheets (originals remain in Git history).

| Former PFW ID | Active parent owner / ID | Preserved behavior and differences |
|---|---|---|
| `y-retrader-1` entity and item | Engines `ye_trade_node` | Add `yrcat-retrade` alongside the parent's existing categories. Retain all 56 PFW trades and the distinct ten-node construction recipe. Parent speed stays 0.5 and power stays 7.5 MW: unchanged recipe times make PFW trades four times slower than the former speed-2 node. |
| `y-sm-5` gun | Yuoki `yi_minigun` | PFW's export and cyborg recipes now consume the parent minigun. Parent gun statistics remain unchanged. Disabled local manufacture remains available as an annotated future alternate route. |
| `y-mun-2` ammunition | Yuoki `yi_ammo_energie` | Retain the seven-magazine export contract. The parent magazine contains 25 rounds versus the former 10, with the parent's existing projectile/delivery behavior. |
| `y-equ-6` item/equipment | Yuoki `yi_equip_generator_a` | Preserve the export contract; use the existing 4×4 parent generator, including its 1.6 MW output versus PFW's former 15 MW. |
| `y-equ-9` item/equipment | Yuoki `yi_equip_legs_a` | Use the parent's 2×3 equipment, 0.275 movement bonus and 250 kW demand versus the former 18 kW. Local manufacture/export stays disabled. |
| `y-cyb-8u` armor and `yi-pfw-walker-grid` | Yuoki `yi_walker_a` and `y_walker_grid` | Use the parent's armor, 14×14 grid and animation. Preserve the disabled cyborg-to-walker conversion. The PFW cyborg commodity `y-cyb-8` remains distinct and active. |
| `yi-pfw-energy` ammunition category | Yuoki `plasma` | The superseded PFW guns remain commented; the parent gun uses its existing ammunition and statistics. |
| `y-sm-1`, `y-sm-2` guns | Yuoki `yi_lasergun` | Both manufacturing consumers and both exports consume the parent gun; preserve recipe quantities and separate payouts. |
| `y-combat-armor-2`, `y-combat-armor-3` items/equipment | Yuoki `yi_equip_shield_a` (CF-35) | Cyborg recipes use the parent shield. Original 120/240-point local equipment remains commented; parent 350-point shield unchanged. |
| `y-equ-1`, `y-equ-2` items/equipment | Yuoki CF-35 / KT-60 respectively | The first shield export consumes `yi_equip_shield_a`, the second `yi_equip_shield_b`. Original payouts and parent statistics remain; both local definitions stay commented. |
| `y-zproduct-8` battery equipment only | Yuoki `yi_equip_battery_a` (EQ-3A) | Disable PFW wearable placement; preserve its distinct 12 GJ fuel item, manufacture, refill, trade and targeting-device recipes. Preserve the old placement property and equipment declaration in comments, and retain all artwork. Parent battery stays 2×2, 300 MJ. |

Both required mods are explicitly checked in the integration module. Required dependency versions remain `base >= 2.1.21`, `Yuoki >= 1.3.0`, and `yi_engines >= 1.3.0`. Reused prototypes bring their parent-owned graphics, sounds and behavior; the [asset mapping](data/asset-reuse-0.5.1.json) removes the local copies only where a visual replacement was confirmed.

### Recipe and balance decisions

All **105 original active recipe routes** remain, plus the restored Mk.1 constructor for **106 routes**. The first consolidation changed five recipes:

- `y-retrader-recipe`: output is ten `ye_trade_node`; original ingredient quantities remain.
- `y-rfab1c-recipe`: consumes seven `yi_ammo_energie` instead of seven PFW magazines.
- `y-rfab2f-recipe`: exports four `yi_minigun` with the original payout.
- `y-fab3f-recipe`: consumes one `yi_minigun` in the existing cyborg recipe.
- `y-rfab8g-recipe`: exports one `yi_equip_generator_a` with the original payout.

The later gun/shield consolidation changes ten more recipe ingredient references (one overlaps the earlier minigun pass), and updates four trade overlays to their parent item icons. No active PFW recipe was found equivalent to a parent recipe, so none was suppressed. The ten-node construction yield remains an intentional retained PFW contract for this pass; it is much cheaper per node than Engines' own constructor. Quantities, payouts and recipe times were not rebalanced. Parent successor statistics and acquisition costs can change the economy and warrant later balancing.

The War Material Factory now accepts six item ingredients, allowing its existing Advanced Targeting Device recipe (`y-equ-3`, formerly `y-fab8d-recipe`) to be selected. Recipe ingredients, quantities and outputs remain unchanged. A Factorio 2.1.21 runtime check confirmed the old limit rejected that recipe, then all four War Material recipes crafted once with exact outputs after the correction. The test supplied ingredients and electricity directly; it does not establish complete natural progression.

Of the 35 historically disabled recipes, only the original `y-zproduct-2-recipe` is restored as `y-combat-armor-1`; the other 34 remain inactive. The movement recipe `y-fab8k-recipe` is annotated as having the same material transformation as parent `yi_equip_legs_a`, with distinct time/category access. Its original text remains intact.

## Missing-input acquisition

The previous review found seven inputs without producing recipes, directly blocking 13 routes and indirectly blocking nine exports. The owner approved these remedies:

| Former missing input | Current acquisition |
|---|---|
| Combat Armor Mk.1 (`y-combat-armor-1`) | Restore the original constructor as recipe `y-combat-armor-1`: 2 refined N4 + 4 iron plates → 2 components, 1 second in War Material. Retain this item; do not substitute Durotal Structure Element. |
| Reactive / Shielded Armor (`y-combat-armor-2`, `y-combat-armor-3`) | Use Yuoki CF-35 (`yi_equip_shield_a`) in their cyborg recipes. |
| Lasergun / Plasmagun (`y-sm-1`, `y-sm-2`) | Use Yuoki YI-LCS (`yi_lasergun`) in cyborgs, Advanced Targeting Device and both exports. |
| CF-56 / KT-34 (`y-equ-1`, `y-equ-2`) | Use Yuoki CF-35 (`yi_equip_shield_a`) for the first export, KT-60 (`yi_equip_shield_b`) for the second. |

All three parent products have existing enabled manufacturing recipes. Superseded local items, guns and shield equipment remain commented with parent ownership annotations; their alternative constructors stay disabled. The former laser/plasma artwork and other unused assets remain available for future use.

All 56 trade recipes remain with unchanged ingredient quantities, payout quantities and times. The former laser export now consumes three parent guns for 41 UC and one Trader Sign; the plasma export consumes six of the same gun for 50 UC and one sign. Two laser exports therefore pay 82 UC and two signs for six guns. The owner explicitly chose to retain both contracts and balance later. The CF-35 and KT-60 exports retain their different material baskets. Parent statistics and crafting costs are unchanged.

These changes resolve the seven identified missing-input routes and their 22 affected recipes; they do not establish a complete playthrough or balance the wider economy. Historical discovery documents retain the original state. No migrations are supplied.

The energy cell remains 12 GJ chemical fuel with `burnt_result = "y-zproduct-8-empty"`. The engine returns one empty cell after burning when the consuming burner has a spent-fuel output slot; burners without that slot consume the fuel normally and discard the container. Existing full output slots retain native blocking behavior. No burner definitions are changed. The current base/Yuoki/Engines chemical burners have no such slots, so the existing trade recipe remains the current recovery route; compatible burners supplied by other mods can recover spent cells. Manufacture, refill and targeting-device recipes remain unchanged. See the [item API](https://lua-api.factorio.com/latest/prototypes/ItemPrototype.html#burnt_result) and [Factorio staff explanation](https://forums.factorio.com/viewtopic.php?t=123678).

## Names and Factoriopedia

Factorio 2.0 changed recipe-name inheritance: a recipe with a different ID needs its own localized name, even when it has one product or an explicit `main_product`. [Factorio staff confirmation](https://forums.factorio.com/viewtopic.php?t=135184). Matching IDs and the main product also support the merged item/recipe entry; `main_product` alone is insufficient. [Factoriopedia correction](https://forums.factorio.com/viewtopic.php?t=128120). The bundled 2.1.21 base recipes use matching IDs for ordinary manufacture such as `iron-gear-wheel`, and distinct IDs/names for alternatives such as `solid-fuel-from-light-oil`.

PFW now follows that pattern: 48 primary manufacturing recipes share their product IDs and explicitly identify their main product. Biomass selects `y-biomass`, preserving the returned wood. Their items use the existing manufacturing subgroups, so they belong in the PFW groups. The old-to-new recipe IDs are recorded in the existing [mapping record](data/parent-content-0.5.1.json). All amounts, times, categories and enabled states remain unchanged. Recipe renames have no migration in this development release.

All 56 trades and the separate ten-node constructor and cell-charging recipe retain their distinct IDs. Missing import/export/construction names are supplied in English and German. The two gun contracts display their shared YI-LCS input and different quantities; shield contracts name CF-35 and KT-60. The retained `y-cyb-9u` armor now has a name, but its constructor remains disabled.

Before this correction, the engine's English prototype-locale dump omitted 63 active PFW recipe names and the retained armor name. Use `--dump-prototype-locale` separately from `--dump-data`, then pass its output directory as `--locale-dir` to the existing validator to check the actual resolved names. Headless checks establish names, matching IDs and main-product metadata; the merged graphical Factoriopedia presentation still needs the owner's client check.

The subsequent [manual progression/API audit](incomplete-content.md#051-audit-2026-10-09) traces all 106 active routes, verifies factory construction and a trade bootstrap in headless, and separates original unfinished content from 0.5.x suppressions. Its test limits and six still-unobtainable prototype items are recorded there.

## Explicitly pending

- Balance the retained gun/shield export contracts and cyborg costs after parent consolidation.
- The second armor `y-cyb-9u` and its animation/grid: no unambiguous successor selected.
- Any other unavailable content, balancing and further disabled-content restoration; the seven reviewed input chains are addressed above.
- Retained-artwork upscaling and any still-unconfirmed duplicates. The follow-up maps/removes 39 confirmed duplicates and retains 167 other images, including unused images; four now use the accepted AI redraws, and the arrow pass removes another 49 variants.
- All migrations until a formal release. Reload validation concerns a save created with 0.5.1 itself.

## Verification

Tested with Factorio **2.1.21 Linux headless**, Yuoki **1.3.0** at `50ea38b9703a13e8644c3bcfe6e400b3bf2b4a5c`, and Engines **1.3.0** at `8d777d015e36d93d2757a290c3f3f32a49c11280`. Both parent main branches still matched those commits when this pass began. Baseline PFW was merged Phase 1 commit `c0f0099469d08c98276f662a0e4ce3e54dd2c187`.

The official [crafting-machine schema](https://lua-api.factorio.com/latest/prototypes/AssemblingMachinePrototype.html) was checked for category and result handling, and the matching 2.1.21 runtime schema for equipment insertion/removal and character ammunition checks.

- Full before/after prototype comparison: only the recorded suppressions, approved recipe references, the restored Mk.1 constructor, primary recipe IDs/main products/item subgroups, one removed PFW character-animation entry, Trade Node category addition, the War Material Factory ingredient limit (five to six), the removal of PFW cell wearable placement/equipment, its conditional empty-cell burn result, and subsequent approved artwork substitutions differ. All unrelated parent prototypes and remaining pending content identities/statistics remain unchanged.
- Preservation: all 105 recipes and their quantities retained, 34 historical disabled recipes still inactive and Mk.1 restored, 75 remaining original graphics unchanged; seven superseded sheets removed, 34 AI artwork updates verified, 41 parent replacements and 49 arrow-variant removals verified against their manifests, all 232 original archive files intact at the immutable import commit.
- Restored-chain crafting: Mk.1 and all three parent equipment recipes produced the required supplies, then all nine affected manufacturing recipes and 13 affected exports completed with exact outputs and empty input inventories. The harness carried verified output counts between stages and supplied other ingredients/power; this is not a full natural-progression playthrough.
- Naming/tier correction: engine locale dumps resolve all 106 recipe names and retained item/entity/equipment names in English and German. All 48 renamed primary recipes are enabled, select in their intended machines, match their main products/subgroups, and craft with exact outputs. Both CF-35/KT-60 exports craft with preserved payouts. The resulting save reloads for 600 ticks.
- Live crafting: all 56 PFW trades completed in Engines nodes with exact output quantities, including four-product exports and energy-cell exchanges. The parent's existing `y_exchange_b1` trade also completed.
- Live construction/production: PFW's constructor produced ten parent nodes; the cyborg recipe consumed the parent minigun and produced its expected result. Tests supplied ingredients and power directly; they do not prove natural progression is complete.
- Fuel-cell separation: the engine dump differs from the accepted prior build only by removal of the local battery equipment and item placement property, plus the approved empty-cell burn result. Live checks confirm Yuoki battery insertion/removal, cell fuel burning in a furnace, and exact outputs for manufacture, refill, trade and targeting-device recipes. The resulting save reloads for 600 ticks. All artwork remains byte-identical.
- Conditional burn result: a stock stone furnace exhausted a cell, discarded the unsupported container and continued on coal. An isolated test-only furnace with one spent-fuel slot returned exactly one empty cell and also continued. Remaining fuel energy was shortened after confirming the real 12 GJ cell was burning. The fixture is outside the package; no production burner changed. The four related recipes retained exact outputs, and a fixture-free new game/reload passed.
- Equipment: the parent generator and movement equipment were inserted into and removed from both the parent walker and the retained PFW second armor, returning the correct parent item IDs.
- Earlier ammunition checks covered the former PFW guns; those definitions are now inactive and consumers use the unchanged parent gun.
- New 0.5.1 game, save and reload: successful; reload ran another 600 ticks. Data loading also checked with official optional mods enabled.
- Graphical baseline: the owner tested 0.5.0 and confirmed the initial 0.5.1 candidate loads. The owner also confirmed the parent-artwork candidate loads. The owner confirmed the four AI icons work in-game. The owner also accepted the generated-arrow candidate. The owner confirmed the second AI batch works. The owner accepted the later artwork and merged PR #6; the owner also accepted batch4. The owner continued after the batch5 correction; the current directional-animation candidate awaits its local graphical check.

Initial content-pass output and package identity are in [validation evidence](data/parent-content-0.5.1-validation.txt); the AI candidate in [its validation](data/ai-redraw-0.5.1-validation.txt), the arrow candidate in [its validation](data/trade-icons-0.5.1-validation.txt), the second batch in [batch2 validation](data/ai-artwork-batch-2-validation.txt), the third batch in [batch3 validation](data/artwork-batch-3-validation.txt), the ammunition correction in [its validation](data/ammunition-factory-artwork-validation.txt), batch4 in [its validation](data/artwork-batch-4-validation.txt), batch5 in [its validation](data/artwork-batch-5-validation.txt), batch6 in [its validation](data/artwork-batch-6-validation.txt), batch7 in [its validation](data/artwork-batch-7-validation.txt), and batch8 in [its validation](data/artwork-batch-8-validation.txt).

### Reproduce the comparison

Generate `--dump-data` output using the exact same engine, parent sources, mod list and startup settings for the baseline revision and this candidate. Baseline mod list: base, Yuoki, yi_engines and yi_pfw enabled; Space Age, Quality, Elevated Rails and Recycler disabled. Keep output/config directories isolated.

```sh
python3 docs/tools/validate_parent_content.py --before /path/to/0.5.0-dump.json --after /path/to/0.5.1-dump.json --yuoki /path/to/Yuoki --engines /path/to/yi_engines
python3 docs/tools/verify_original.py --archive-only
factorio --config /path/to/config.ini --mod-directory /path/to/mods --create /path/to/051-new.zip --map-gen-seed 147 --preset default
factorio --config /path/to/config.ini --mod-directory /path/to/mods --benchmark /path/to/051-new.zip --benchmark-ticks 600 --benchmark-runs 1
```

The comparison validator checks the entire prototype dump against the baseline plus the documented allowed changes, not just prototype counts. The older `validate_phase1.py` remains a historical 0.5.0 check; run it only at the Phase 1 revision.
