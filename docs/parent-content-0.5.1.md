# 0.5.1: confirmed parent-content consolidation

The owner confirmed the 0.5.0 candidate appears to work, merged PR #5, and explicitly authorized **0.5.1**. This pass consolidates confirmed successors. The owner chose to leave ambiguous mappings pending and subsequently directed that **all migrations wait until a formal release**. Test this development version with a fresh game; no upgrade path is supplied.

## Ownership changes

The central [mapping record](data/parent-content-0.5.1.json) identifies every suppressed declaration, its source file, parent and replacement ID. All 11 redundant declarations remain in source inside annotated Lua comments. The first walker's redundant character animation is also retained commented. The subsequent [asset mapping](data/asset-reuse-0.5.1.json) replaces 39 confirmed duplicate files; 167 local images remain. The subsequent [AI redraw batch](decisions/ai-artwork.md) changes four of those. The [arrow-overlay pass](decisions/trade-arrow-overlays.md) then removes 49 redundant variants, leaving 118 local images. The [second AI batch](ai-artwork-batch-2.md) brings that set to 12 AI icons and 106 originals. The [third batch](artwork-batch-3.md) adds seven sprite-referenced building redraws and one more parent-icon reuse, leaving 19 AI icons and 98 originals. The [fourth batch](artwork-batch-4.md) adds five component redraws, bringing the count to 24 AI icons and 93 originals. The [fifth batch](artwork-batch-5.md) brings the count to 28 AI icons and 89 originals. The [sixth batch](artwork-batch-6.md) brings the count to 30 AI icons and 87 originals. The [seventh batch](artwork-batch-7.md) adds a group icon and equipment sprite, bringing the count to 32 AI artwork assets and 85 originals. The [eighth batch](artwork-batch-8.md) adds two static world sprites, bringing the count to 34 AI artwork assets and 83 originals. Current totals are 41 parent replacements, 34 AI artwork assets and 82 originals.

| Former PFW ID | Active parent owner / ID | Preserved behavior and differences |
|---|---|---|
| `y-retrader-1` entity and item | Engines `ye_trade_node` | Add `yrcat-retrade` alongside the parent's existing categories. Retain all 56 PFW trades and the distinct ten-node construction recipe. Parent speed stays 0.5 and power stays 7.5 MW: unchanged recipe times make PFW trades four times slower than the former speed-2 node. |
| `y-sm-5` gun | Yuoki `yi_minigun` | PFW's export and cyborg recipes now consume the parent minigun. Parent gun statistics remain unchanged. Disabled local manufacture remains available as an annotated future alternate route. |
| `y-mun-2` ammunition | Yuoki `yi_ammo_energie` | Retain the seven-magazine export contract. The parent magazine contains 25 rounds versus the former 10, with the parent's existing projectile/delivery behavior. |
| `y-equ-6` item/equipment | Yuoki `yi_equip_generator_a` | Preserve the export contract; use the existing 4×4 parent generator, including its 1.6 MW output versus PFW's former 15 MW. |
| `y-equ-9` item/equipment | Yuoki `yi_equip_legs_a` | Use the parent's 2×3 equipment, 0.275 movement bonus and 250 kW demand versus the former 18 kW. Local manufacture/export stays disabled. |
| `y-cyb-8u` armor and `yi-pfw-walker-grid` | Yuoki `yi_walker_a` and `y_walker_grid` | Use the parent's armor, 14×14 grid and animation. Preserve the disabled cyborg-to-walker conversion. The PFW cyborg commodity `y-cyb-8` remains distinct and active. |
| `yi-pfw-energy` ammunition category | Yuoki `plasma` | The two pending PFW energy guns use the confirmed parent ammunition. Their IDs, range, cooldown and damage multipliers remain unchanged; their ownership decisions stay pending. |

Both required mods are explicitly checked in the integration module. Required dependency versions remain `base >= 2.1.21`, `Yuoki >= 1.3.0`, and `yi_engines >= 1.3.0`. Reused prototypes bring their parent-owned graphics, sounds and behavior; the [asset mapping](data/asset-reuse-0.5.1.json) removes the local copies only where a visual replacement was confirmed.

### Recipe and balance decisions

All **105 active recipe routes** remain. Exactly five recipes change references:

- `y-retrader-recipe`: output is ten `ye_trade_node`; original ingredient quantities remain.
- `y-rfab1c-recipe`: consumes seven `yi_ammo_energie` instead of seven PFW magazines.
- `y-rfab2f-recipe`: exports four `yi_minigun` with the original payout.
- `y-fab3f-recipe`: consumes one `yi_minigun` in the existing cyborg recipe.
- `y-rfab8g-recipe`: exports one `yi_equip_generator_a` with the original payout.

No active PFW recipe was found equivalent to a parent recipe, so none was suppressed. The ten-node construction yield remains an intentional retained PFW contract for this pass; it is much cheaper per node than Engines' own constructor. Quantities, payouts and recipe times were not rebalanced. Parent successor statistics and acquisition costs can change the economy and warrant later balancing.

The War Material Factory now accepts six item ingredients, allowing its existing Advanced Targeting Device recipe (`y-fab8d-recipe`) to be selected. Recipe ingredients, quantities and outputs remain unchanged. A Factorio 2.1.21 runtime check confirmed the old limit rejected that recipe, then all four War Material recipes crafted once with exact outputs after the correction. The test supplied ingredients and electricity directly; it does not establish natural ingredient availability.

All 35 previously disabled recipes remain inactive. The movement recipe `y-fab8k-recipe` is annotated as having the same material transformation as parent `yi_equip_legs_a`, with distinct time/category access. Its original text remains intact.

## Missing-input chains: review before restoration

The owner explicitly chose to **keep Combat Armor Mk.1 manufacture disabled** while reviewing these chains. The current 2.1.21 prototype dump with the parent revisions below contains no producing recipe for seven PFW inputs. They directly block 13 of the 105 active PFW recipes; nine further export recipes depend on the blocked products, for **22 affected routes** total. This is a bounded recipe-dependency audit, assuming other base/parent supplies are available; the remaining 83 routes are not a claim of complete natural progression. The older discovery documents describe the original release and retain their historical counts.

| Missing input | Direct consumers and downstream effect | Preserved recipe / ownership decision |
|---|---|---|
| Combat Armor Mk.1 (`y-combat-armor-1`) | Shaden, Nakajima, Pyroon and Sentinel manufacture, then their exports. Nakajima also needs the missing laser. | `y-zproduct-2-recipe`: 2 refined N4 + 4 iron plates → 2 components, 1 second in War Material. Ordinary intermediate, no confirmed parent replacement; **remain disabled**. |
| Combat Armor Mk.2 (`y-combat-armor-2`) | Scuptor and Defender manufacture, then exports. | `y-zproduct-3-recipe`: 2 grey coils + 4 iron plates → 2. Historical mapping to `yi_equip_shield_a` remains ambiguous. |
| Combat Armor Mk.3 (`y-combat-armor-3`) | MKE-C3D-Sirus and SWE-W21-Fxxt manufacture, then exports; also require laser and plasma respectively. | `y-zproduct-4-recipe`: 2 red coils + 2 `y-stuff-3` → 2. Same historical parent shield mapping as Mk.2, losing the separate tier identity. |
| Lasergun (`y-sm-1`) | Its export, Nakajima, MKE-C3D-Sirus and Advanced Targeting Device manufacture; those products' exports follow. | `y-fab2b-recipe` remains commented. Historical successor `yi_lasergun` is also the proposed plasma successor. |
| Plasmagun (`y-sm-2`) | Its export and SWE-W21-Fxxt manufacture/export. | `y-fab2c-recipe` remains commented; same parent gun ambiguity. |
| CF-56 shield (`y-equ-1`) | Shield export `y-rfab8b-recipe`. | `y-fab8b-recipe` remains commented; historical successor `yi_equip_shield_b` is also the proposed KT-34 successor. |
| KT-34 shield (`y-equ-2`) | Shield export `y-rfab8c-recipe`. | `y-fab8c-recipe` remains commented; distinct construction cost and export payout from CF-56. |

The eight blocked cyborg products are `y-cyb-1` through `y-cyb-6`, plus `y-cyb-8` and `y-cyb-9`. Brain parasites and the medic cyborg are not blocked by these seven missing inputs. Advanced Targeting Device is the ninth downstream product. Its six-slot machine fix permits crafting when ingredients are supplied; it does **not** supply the missing laser.

The existing Yuoki recipes produce `yi_lasergun`, `yi_equip_shield_a` and `yi_equip_shield_b`, but their IDs do not satisfy the retained PFW ingredient IDs. Blind substitution changes trade choices: three lasers pay 41 UC plus one Trader Sign, while six plasma guns pay 50 UC plus one sign. If both become the same parent gun, six guns could instead earn 82 UC and two signs through two laser exports. The two shield exports also have distinct material payouts. These mappings remain pending as instructed.

The disabled gun constructors still reference the suppressed `y-mun-2` ammunition; any later deliberate restoration must adapt that input to the confirmed parent ammunition and modernize the legacy recipe syntax. Enabling their old text verbatim is insufficient. No constructor or mapping was changed by this review.

Resolving Mk.1 alone would remove these blockers from Shaden, Pyroon and Sentinel manufacture/export (six routes); Nakajima would still need the laser. Resolving the laser alone would free its export and Advanced Targeting Device manufacture/export (three routes), while its two cyborg consumers would remain armor-blocked. These are dependency projections, not implemented changes or live progression tests.

## Explicitly pending

- Laser/plasma gun identity collapse and the four shield-to-parent tier mappings: deferred by owner choice. Their existing export contracts remain distinct.
- The second armor `y-cyb-9u` and its animation/grid: no unambiguous successor selected.
- Filled/empty PFW energy cells and wearable battery separation: keep fuel, refill and export behavior intact.
- Previously unavailable inputs/recipes, balancing and disabled-content restoration.
- Retained-artwork upscaling and any still-unconfirmed duplicates. The follow-up maps/removes 39 confirmed duplicates and retains 167 other images, including unused images; four now use the accepted AI redraws, and the arrow pass removes another 49 variants.
- All migrations until a formal release. Reload validation concerns a save created with 0.5.1 itself.

## Verification

Tested with Factorio **2.1.21 Linux headless**, Yuoki **1.3.0** at `50ea38b9703a13e8644c3bcfe6e400b3bf2b4a5c`, and Engines **1.3.0** at `8d777d015e36d93d2757a290c3f3f32a49c11280`. Both parent main branches still matched those commits when this pass began. Baseline PFW was merged Phase 1 commit `c0f0099469d08c98276f662a0e4ce3e54dd2c187`.

The official [crafting-machine schema](https://lua-api.factorio.com/latest/prototypes/AssemblingMachinePrototype.html) was checked for category and result handling, and the matching 2.1.21 runtime schema for equipment insertion/removal and character ammunition checks.

- Full before/after prototype comparison: only the recorded suppressions, five recipe references, two ammunition categories, one removed PFW character-animation entry, Trade Node category addition, the War Material Factory ingredient limit (five to six), and subsequent approved artwork substitutions differ. All unrelated parent prototypes and pending content identities/statistics remain unchanged.
- Preservation: all 105 recipes and their quantities retained, all 35 historical disabled recipes still inactive, 82 remaining graphics unchanged, 34 AI artwork updates verified, 41 parent replacements and 49 arrow-variant removals verified against their manifests, all 232 original archive files intact at the immutable import commit.
- Live crafting: all 56 PFW trades completed in Engines nodes with exact output quantities, including four-product exports and energy-cell exchanges. The parent's existing `y_exchange_b1` trade also completed.
- Live construction/production: PFW's constructor produced ten parent nodes; the cyborg recipe consumed the parent minigun and produced its expected result. Tests supplied ingredients and power directly; they do not prove natural progression is complete.
- Equipment: the parent generator and movement equipment were inserted into and removed from both the parent walker and the retained PFW second armor, returning the correct parent item IDs.
- Ammunition: both pending PFW energy guns fired and consumed the parent ammunition. The engine also accepted the parent minigun/bullet pairing through `can_shoot`; a complete bullet-combat simulation is not claimed.
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
