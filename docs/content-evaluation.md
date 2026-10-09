# PFW content ownership evaluation

Evaluated 2026-10-09. **Documentation only: no mod source, assets, dependency declarations, or migrations were changed.** This applies the [accepted ownership requirements](content-ownership.md) to the supplied 0.4.15 release.

## Findings and recommended disposition

PFW contains a substantial distinct manufacturing/export economy, alongside personal equipment that now has parent-owned successors. Reuse the successors where established; keep PFW's distinct recipes. The strongest machine consolidation candidate is Engines' Trade Node. The nine dedicated war-goods factories have no established parent equivalent.

- Reuse Yuoki's minigun, laser weapon/ammunition system, mobile generator and movement equipment. Their legacy declarations should eventually remain commented and annotated with the parent IDs.
- Reuse the parent shield/armor systems, but resolve the tier mappings before changing consumers. Several old products map to a single modern product, and their statistics differ.
- Treat Engines' Trade Node as the preferred replacement candidate for the PFW node, with explicit category compatibility and construction-economy decisions.
- Preserve all **105 active PFW recipe routes** for the port: no identical input/output transformation was found in the tested baseline, including the proposed reference-remapping scenario. This is a retention recommendation, not proof that their historical costs or availability are suitable today.
- Preserve all **35 commented recipes**. One movement-equipment recipe has the same material transformation as its parent successor after remapping, but different time/access. Annotate that overlap; do not reactivate it automatically.
- Preserve PFW's energy-cell fuel, refill and export behavior. Replacing its item wholesale with the parent battery would lose functionality.
- Leave unused unique artwork and disabled code present. Content ownership and artwork ownership remain separate decisions; this evaluation authorizes no asset deletion.

## Scope and evidence

| Input | Exact version used |
|---|---|
| PFW | Original 0.4.15 import, commit `103efa8acc74ab86b282b5388f64f333d06660dd` |
| Yuoki Industries | 1.3.0, [commit 50ea38b](https://github.com/jatmn/Yuoki-Factorio-2.x/tree/50ea38b9703a13e8644c3bcfe6e400b3bf2b4a5c) |
| Yuoki Engines | 1.3.0, [commit 8d777d0](https://github.com/jatmn/Yuoki-Engines-Factorio-2.x/tree/8d777d015e36d93d2757a290c3f3f32a49c11280) |
| Engine baseline | Factorio 2.1.21; base + Yuoki + yi_engines, default startup settings; Space Age, quality, elevated rails and recycler disabled |

Fresh clean parent checkouts and a successful isolated parent-only `--dump-data` run establish current declarations after data-stage modifications. The baseline contains **727 recipes**, including base recipes. This supersedes the earlier name-only comparison for this configuration. PFW was **not** loaded into 2.1, ported, played, or save-migrated. Optional-mod combinations and nondefault settings were not tested.

Coverage: **234 active literal declarations** (105 recipes and 129 other prototypes), plus **55 commented declarations** (35 recipes, 11 items, one gun, eight repeated category placeholders). Counts are declarations, not distinct IDs across types. All prototype files required by `data.lua` were considered; character animation mutations and the malformed migration were also inspected separately. The archive-specific scanner is not a general Lua parser.

The comparison examined typed item identity, ingredients/results and quantities, recipe roles, machine categories, equipment statistics, existing manufacturing access, and historical migration intent. Exact material signatures detect candidates; absence of an exact match alone does not settle semantic equivalence. The family-by-family decisions below additionally distinguish trade packages, equipment, biological processing and machine roles. Uncertain replacements stay explicitly pending.

Full records:

- [Non-recipe prototype inventory and dispositions](data/prototype-ownership-inventory.csv): each active/commented declaration, source line, parent candidate and reason.
- [Recipe ownership audit, CSV](data/recipe-ownership-audit.csv) and [JSON](data/recipe-ownership-audit.json): all 140 active/commented recipe declarations, material comparisons, possible reference changes and same-product parent recipe candidates.
- [Evaluation provenance and collision/category results](data/content-evaluation.json).
- [Selected current parent prototype evidence](data/parent-content-evidence.json): evaluated parent recipes, items, machines and equipment with source locations. Source locations identify declarations; the recorded prototype values come from the final dump.
- [Original active recipe catalog](recipe-catalog.md): historical quantities and purpose, unchanged by this evaluation.

## Machines

| PFW definitions | Parent candidate | Evaluation / future treatment |
|---|---|---|
| Entity + item `y-retrader-1` | Engines entity + item `ye_trade_node` | Strong role match: small automated trading machine. Recommend consolidation after category compatibility. Different operating statistics mean this is a design-level reuse, not an identical machine. |
| Recipe `y-retrader-recipe` | Engines recipe `ye_trade_node` | Distinct construction route. Preserve PFW's recipe; if the node is consolidated, adapt its output to the parent item and review the ten-unit yield. Do not classify it as an identical parent recipe. |
| Entities/items `y-factory-1`, `2`, `3`, `5`, `8`, `9`; six active construction recipes | Engines `ye_fassembly1`, `ye_fassembly2`, `ye_fassembly_sp` considered | Retain PFW ownership. Engines has general assemblers, but none supplies the six PFW production categories or their specialized content. Similar purpose as a factory is insufficient evidence of moved content. |
| Entities/items `y-factory-4`, `6`, `7`; three commented constructors | No confirmed replacement | Retain placeholders and commented constructors. Their heavy-weapons/tank/support categories have no active PFW processing recipes. |
| Entities/items `y-rich-1`, `y-rich-2`; two commented constructors | Yuoki `y-fame-gen` considered | Retain unfinished content pending later design. PFW uses obsolete `yuoki-fame-recipe`; current fame machine uses `yuoki-fame`. The two PFW wealth tiers have different speed/power and no demonstrated current recipe connection. Do not infer equivalent behavior from the fame theme. |

Sources: [PFW basic entities](../prototypes/e_basic.lua), [factory entities](../prototypes/e_factory.lua), [basic constructors](../prototypes/ir_basic.lua), [factory constructors](../prototypes/ir_factory.lua); parent [Trade Node entity](https://github.com/jatmn/Yuoki-Engines-Factorio-2.x/blob/8d777d015e36d93d2757a290c3f3f32a49c11280/prototypes/e_andere.lua#L155), [Trade Node recipe](https://github.com/jatmn/Yuoki-Engines-Factorio-2.x/blob/8d777d015e36d93d2757a290c3f3f32a49c11280/prototypes/r_externs.lua#L3), [general factories](https://github.com/jatmn/Yuoki-Engines-Factorio-2.x/blob/8d777d015e36d93d2757a290c3f3f32a49c11280/prototypes/e_assemblys.lua), [fame machine](https://github.com/jatmn/Yuoki-Factorio-2.x/blob/50ea38b9703a13e8644c3bcfe6e400b3bf2b4a5c/prototypes/entity/e_ultimates.lua#L44).

### Trade Node compatibility

| Property | PFW `y-retrader-1` | Engines `ye_trade_node` |
|---|---|---|
| Category | `yrcat-retrade` | `yuoki-stargate` |
| Crafting speed | 2 | 0.5 |
| Power | 1.25 MW | 7.5 MW |
| Constructor | 2 `y-basic-t1-mf` + 6 `y-bluegear` + 1 `y-stargate` → **10 nodes** | 1 `y-stargate` + 2 `y-bluegear` + 4 iron plates → **1 node** |

PFW has **56 recipes** in `yrcat-retrade`: goods exports, imports, resales and energy-cell exchange. None can run in the unmodified modern parent node. Recommended future integration: add PFW's category narrowly to the parent node while retaining `yuoki-stargate`. Moving PFW recipes into `yuoki-stargate` instead would also expose them to the large Yuoki Stargate and should be a deliberate choice.

These 56 recipes are item-only, with at most two distinct inputs and up to four products. Check actual output inventory behavior when implemented; do not assume the parent's existing four-ingredient declaration proves all trade recipes work. Retaining old base recipe times in the slower parent node makes those trades four times slower than in the old PFW node. Do not overwrite the parent's speed/power to imitate PFW globally.

The PFW ten-node constructor remains a distinct route under the user's preservation rule. It would bypass much of the parent's per-node construction cost. Record that balance decision before enabling the remapped route; discovery does not approve silently changing its yield or deleting it.

## Equipment and weapons

“Reuse” below means parent ownership in the future implementation, with the original PFW declaration retained commented and annotated. A successor can be appropriate even when its balance has changed. “Pending” means the exact tier/product mapping remains unresolved.

| PFW prototype(s) | Current Yuoki candidate | Material differences / recommendation |
|---|---|---|
| Gun `y-sm-5` | `yi_minigun` | Strong equivalence: bullet category, range 18, cooldown 2, damage multiplier 2, slowdown 0.8. Reuse parent gun; keep PFW export and cyborg consumers. |
| Gun `y-sm-1` | `yi_lasergun` | Historical migration explicitly names it. Old range 40 / cooldown 20 / multiplier 4 / `railgun`; parent 30 / 8 / 1 / `plasma`. Reuse the current system with its ammunition, not old firing semantics. |
| Gun `y-sm-2` | `yi_lasergun` | Migration also collapses the plasmagun into the same parent gun. Old range 16 / cooldown 7 / multiplier 4. Parent ownership is supported, but merging its separate trade identity is pending the recipe-value decision below. |
| Ammo `y-mun-2` + projectile `p2` | `yi_ammo_energie` + parent `p2` | Parent ammo uses `plasma`, magazine 25 versus old 10. Both repeat 16 projectiles; parent `p2` deals 8 impact versus old 6 physical; delivery effects also differ. Reuse the pair. Never overwrite the parent's colliding `p2`. |
| Items + shields `y-combat-armor-2`, `y-combat-armor-3` | Migration suggests `yi_equip_shield_a` for both | Old 3×2 shields: 120 / 240; parent A: 350, 3×2. Different charge parameters and shared cyborg-component role. Reuse parent shield family, but settle whether two component tiers remain distinct before remapping both items. |
| Items + shields `y-equ-1`, `y-equ-2` | Migration suggests `yi_equip_shield_b` for both | Old shields: 240 at 2×2 / 630 at 3×3; parent B: 600 at 3×2. Different charge parameters and separate export contracts. Exact mapping is pending. |
| Item + generator `y-equ-6` | `yi_equip_generator_a` | Both 4×4; power changes from 15 MW to 1.6 MW. Reuse parent generator; retain PFW export. |
| Item + movement equipment `y-equ-9` | `yi_equip_legs_a` | Both 2×3, movement bonus 0.275. Consumption changes from 18 kW to 250 kW. Reuse parent equipment; preserve disabled local manufacture/export. |
| Battery equipment `y-zproduct-8` | `yi_equip_battery_a` | Both 2×2; old 15 MJ / 15 MW input/output versus parent 300 MJ / 2 GW. Reuse the equipment role separately from PFW's fuel/trade item. See exception below. |
| Armor `y-cyb-8u` | `yi_walker_a` | Same walker icon/robo1 animation family; parent grid 14×14 versus 12×12 and inventory bonus 40 versus 30. Physical/acid resistances change 12/55% → 14/75%; explosion 20/55% → 20/75%. Strong successor candidate; preserve disabled PFW conversion. |
| Armor `y-cyb-9u` | `yi_walker_a` or `yi_armor_gray`, depending on intended role | Old resistance/grid values resemble `yi_walker_a`, but its old armor2 animation is associated with `yi_armor_gray` today. The latter has a 9×9 grid and different resistance values. No justified exact mapping; do not automatically pick `yi_walker_c` just because it is a later walker. Preserve pending design. |
| Grids `y_walker_grid`, `y_armor_grid` | Parent `y_walker_grid`, or the selected armor's own grid | Old `y_walker_grid` is 12×12 and directly collides with parent's 14×14. Old `y_armor_grid` is 14×14. Use parent-owned grids once armor ownership is chosen; do not resize the existing parent's grid. |
| Commented gun `y-sm-3` | No active parent grenade-launcher equivalent established | Keep commented. Its active PFW item is a trade package; it is not an active usable grenade launcher. |

Original sources: [guns/ammo/projectile](../prototypes/uo_fab2.lua), [equipment](../prototypes/uo_fab8.lua), [armor/grids](../prototypes/uo_fab3.lua), [migration intent](../prototypes/migrations/yi_pfw_0.4.15.json). Current source: [Yuoki equipment, guns and recipes](https://github.com/jatmn/Yuoki-Factorio-2.x/blob/50ea38b9703a13e8644c3bcfe6e400b3bf2b4a5c/prototypes/objects/y_player_equipment.lua), [armor/grids and recipes](https://github.com/jatmn/Yuoki-Factorio-2.x/blob/50ea38b9703a13e8644c3bcfe6e400b3bf2b4a5c/prototypes/objects/y_player_styles_items.lua), [armor animations](https://github.com/jatmn/Yuoki-Factorio-2.x/blob/50ea38b9703a13e8644c3bcfe6e400b3bf2b4a5c/prototypes/objects/y_player_styles.lua).

The legacy migration is malformed and does not prove any rename executed. Its mappings are historical intent, not ready-to-use migrations. Asset identity also cannot choose shield roles: old CF-56 artwork is now used for the **battery**, and the panz4/panz5 artwork does not follow the old JSON's shield grouping. Use behavior and the selected tier policy to decide prototype ownership.

### Energy-cell exception

Keep `y-zproduct-8` and `y-zproduct-8-empty` as PFW trade/fuel concepts unless a deliberate later design provides all of their behavior. The old filled item is a **12 GJ fuel** as well as the intended carrier of battery equipment. The parent battery item has no matching fuel or empty-casing cycle.

Preserve these three active recipes:

- `y-zproduct-8-recipe`: cases + refined N4 + infused UC → filled cell.
- `y-zproduct-8charge-recipe`: empty casing + infused UC → filled cell.
- `y-rzproduct-8-recipe`: filled cell → Green Fractals + red/gray materials + empty casing.

`y-fab8d-recipe` also consumes the cell in an advanced targeting device. Avoid globally renaming this item to `yi_equip_battery_a`; doing so could let ordinary parent batteries enter PFW's refill/export economy. Recommended direction: parent owns wearable battery equipment, PFW keeps its trade/fuel cell, with any conversion or placement relationship explicitly designed later. The old `placed_as_equipment_result` spelling and invalid energy priority also require a port fix; no usable 2.1 equipment linkage is assumed here. No burnt-result return is declared in the original item.

## Trade goods and materials

| PFW family | Parent comparison / disposition |
|---|---|
| `y-mun-0`, `1`, `3`–`9` (9 items) | Retain. These are packaged ammunition/bomb commodities, not ammo prototypes. Yuoki's usable ammunition is already an ingredient in several recipes. A crate made from eight parent magazines plus a chest is not another copy of the magazine. |
| `y-sm-0`, `3`, `4`, `6` (4 items) | Retain close-combat, grenade-launcher, sniper and biological-weapon trade packages. No matching active parent commodity established. Do not turn descriptive lore into deployable weapons. |
| `y-cyb-0`–`9` (10 items) | Retain cyborg/brain-parasite commodity chain and all manufacture/export routes. These are ordinary items, not units or armor. In particular, `y-cyb-8` is distinct from wearable `y-cyb-8u`; the parent walker does not replace both automatically. Engines includes the old brain-parasite image but no active literal reference to it or corresponding brain-parasite item was found. |
| `y-veh-0`–`6`, `8`, `9` (9 items) | Retain frames, trailers, trucks and wheels as trade goods. They have no placed vehicle entity. Engines' motors and generators are ingredients in the chain, not equivalent finished PFW commodities. |
| `y-equ-0`, `3`, `4`, `5` (4 items) | Retain shield component, targeting device and battlefield energy-support/stockpile commodities. These are ordinary items without wearable equipment behavior. Parent shield/battery equipment does not automatically replace them. |
| `y-redcoil`, `y-grycoil`, `y-stuff-1`–`6` (8 items) | Retain imported trade materials and all eight import/eight resale recipes. Their supply/currency role differs from parent conductive wire/coils and other manufactured intermediates. No confirmed equivalents. |
| `y-biomass`, `y-combat-train`, `y-medic`, `y-zielfern` | Retain PFW biomass, training units, medic sets and scopes. Engines' `ye_biomixed` (Rabio) is a synthetic-fuel feedstock produced from sugar + corn, with green signs as a byproduct. Yuoki's `y_organic_dust` is compost. Neither establishes equivalent PFW biomass production or cyborg/medic usage. |
| `y-combat-armor-1` | Retain the unique intermediate and its commented manufacturing recipe. It is an ordinary item, not wearable armor or shield equipment. Parent gray armor is not an equivalent ingredient. Existing active cyborg recipes remain blocked until its acquisition is deliberately resolved. |
| `y-zproduct-8`, `y-zproduct-8-empty` | Retain trade/fuel roles; split out parent battery ownership as described above. |
| Commented `ypfw_trader_sign` | Already parent-owned: Yuoki defines the active item. Keep local declaration commented and eventually annotate the existing owner. Reuse this currency; do not add another sign item. |
| Commented item variants `y-mun-2`, `y-sm-1`, `2`, `5`; placeholders `y-sm-7`, `8`, `9`, `y-veh-7`, `y-equ-7`, `8` | Preserve all. The first group shadows usable types elsewhere in PFW; future annotations should point to the parent usable type. The remaining prototypes are unfinished ideas, not evidence of parent duplicates. |

Sources: original [ammunition](../prototypes/ir_fab1.lua), [small arms](../prototypes/ir_fab2.lua), [cyborgs](../prototypes/ir_fab3.lua), [vehicles](../prototypes/ir_fab5.lua), [war material](../prototypes/ir_fab8.lua), [imports](../prototypes/ir_imports.lua), [intermediates](../prototypes/ir_zmaterial.lua); parent [Engines agricultural/export recipes](https://github.com/jatmn/Yuoki-Engines-Factorio-2.x/blob/8d777d015e36d93d2757a290c3f3f32a49c11280/prototypes/z_recipes.lua), [Yuoki currency item](https://github.com/jatmn/Yuoki-Factorio-2.x/blob/50ea38b9703a13e8644c3bcfe6e400b3bf2b4a5c/prototypes/z_items.lua#L424).

## Recipes: retain distinct routes, annotate real overlap

| Source family | Active | Commented | Disposition |
|---|---:|---:|---|
| Basic machines | 1 | 2 | Retain distinct node constructor; retain disabled wealth constructors. |
| Factories | 6 | 3 | Retain dedicated construction routes and placeholders. |
| Ammunition | 19 | 1 | Keep 9 manufacturing/packaging + 10 exports; remap electrical ammo export to selected parent ammo. |
| Small arms | 11 | 9 | Keep 4 manufacturing + 7 exports; preserve disabled manufacturing/placeholder exports. |
| Cyborgs | 20 | 0 | Keep 10 manufacturing + 10 exports; adapt parent equipment consumers after mapping. |
| Vehicles | 15 | 5 | Keep 9 manufacturing + 6 exports and disabled concepts. |
| War material | 10 | 10 | Keep 4 manufacturing + 6 exports; preserve commented recipes, including overlapping movement manufacture. |
| Imports/resales | 16 | 0 | Keep all distinct trade-material exchanges. |
| Intermediates/cells | 7 | 3 | Keep biomass/training/medic/scope/cell routes; preserve commented armor-component manufacture. |
| Wearable walker conversions | 0 | 2 | Preserve distinct conversions; do not enable just because parent armor exists. |
| **Total** | **105** | **35** | No active route identified for suppression as an equivalent parent recipe. |

The comparison checks original IDs and an explicitly labeled **scenario**, using the old migration's likely item successors plus the Trade Node and modern base-name candidates. Scenario aliases are diagnostic, not an approved mapping. In particular, the fuel cell and ambiguous walker armors are deliberately not globally aliased. Matching output names alone only produces a candidate list; it never marks a recipe redundant. Batch-scaled or arbitrary alternative mappings are not exhaustively searched.

The one material match is commented `y-fab8k-recipe` → `yi_equip_legs_a`: **8 advanced frames + 12 structure elements + 8 blue gears + 2 advanced chips → 1 movement item** after output remapping. PFW specifies 2 seconds in `yrcat-material`; Yuoki specifies 3 seconds in `yuoki-wonder`, enabled, made in its quantum composer. Preserve the PFW recipe commented and annotate the parent route. Treat a later request for separate war-factory manufacturing access as an intentional alternate route, rather than accidentally enabling a duplicate.

Other disabled gun/shield/ammo/generator constructors use different ingredients from their parent successors. They remain potential alternate recipes, preserved inactive. The two walker conversions use a PFW cyborg commodity plus Fame; Yuoki uses its armor progression and industrial materials. Parent ownership of the resulting wearable armor does not erase those distinct conversion ideas.

### Many-to-one mappings change trade meaning

The old migration maps both laser and plasma guns to `yi_lasergun`, yet PFW has:

- `y-rfab2b-recipe`: 3 old laser guns → 41 UC + 1 Trader Sign.
- `y-rfab2c-recipe`: 6 old plasma guns → 50 UC + 1 Trader Sign.

After a naive alias, six parent laser guns could earn 82 UC + 2 signs through the first route versus 50 UC + 1 sign through the second. Both are distinct PFW contracts, but their old product distinction is lost. Preserve both records; decide later whether to keep intentionally different contracts, adjust quantities, or represent distinct trade packages while reusing one usable parent gun. Do not silently erase either contract as a duplicate.

Likewise `y-rfab8b-recipe` and `y-rfab8c-recipe` export different shields for different material baskets. Mapping both shields to `yi_equip_shield_b` changes them into alternative contracts for the same item. The armor-component mappings also flatten two cyborg-input tiers. These are explicit design decisions, not mechanical search-and-replace steps.

The scenario affects **16 active recipes**, including two base-name repairs. Their exact references are listed in the recipe audit. `flame-thrower` is absent from the baseline (`flamethrower` exists). `raw-wood` is also absent. The biomass recipe consumes old `wood` and returns old `raw-wood`; translating both to modern `wood` changes the historical processed/raw distinction. Record that recipe's intended transformation before modernizing it.

## Categories and presentation

All ten PFW recipe categories are absent from parent machine capabilities in the tested baseline. Retain the nine production/placeholder categories with their intended machines; the trading category needs the compatibility addition above if its machine moves to Engines. The 1 item group and 21 subgroups do not collide by name/type. Keep their organization until an intentional UI change; blank/unused groupings are not permission to prune content.

PFW's `uo_fabx.lua` adds `level4addon`/`level5addon` to obsolete player animations. Yuoki now owns the corresponding animation families through its character setup. With parent armor reuse, keep the old PFW mutation code commented and annotated instead of applying a second armor-animation mutation. The `y-cyb-9u` association still needs the explicit choice described above. Shared/unused images follow the separate [asset reuse policy](asset-reuse.md).

The two direct active same-type/name collisions are projectile `p2` and grid `y_walker_grid`. No active PFW item, machine, gun, ammo, armor or recipe ID collides directly. This absence does not rule out renamed successors; the ownership matrix addresses those.

## Deferred implementation decisions and checks

1. Select supported parent versions and dependency detection. The evaluated configuration has both parents loaded; Engines 1.3.0 itself requires Yuoki 1.3.0. Validate the selected prototypes as well as mod presence before using parent paths/IDs.
2. Resolve shield tier grouping, plasma/laser trade identity, second wearable armor, cell equipment separation, and Trade Node constructor yield. Preserve all distinct recipes and inactive source while doing so.
3. Implement the ownership map; comment and annotate redundant definitions rather than deleting them. Do not rewrite parent combat statistics, grids, crafting categories or unrelated recipes wholesale.
4. Adapt unique recipe references and node category support. Confirm every retained recipe has a reachable input route, compatible crafter and sufficient result handling. Parent equipment constructors exist and are enabled in the baseline, but PFW's missing armor-Mk.1 route remains a separate blocker.
5. Validate actual crafting, export payouts, equipment placement/removal, ammunition behavior, parent regressions and any intended save migration on the chosen 2.1 build. This evaluation supplies evidence and decisions; it does not claim those future checks passed.

No source edits, prototype suppression, recipe rebalance, upscaling, asset removal or disabled-content restoration was performed in this evaluation.
