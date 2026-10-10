# Incomplete and overlapping content

For the current 0.5.1 state, see [the progression and preserved-content audit below](#051-audit-2026-10-09).

The later [content ownership evaluation](content-evaluation.md) compares all active/commented declarations against freshly pinned parent sources and records replacement decisions. The inventory below describes the original release and initial discovery.

This release already contains unfinished or disconnected content. “Defined,” “craftable,” and “usable” are different states. The counts below describe declarations in the ZIP; they do not prove reachability in every historical dependency combination.

The owner requires retaining the disabled/commented-out code and unused assets for future development. The inventory below identifies restoration opportunities, not content to prune. Confirmed duplicate artwork may be replaced by parent-owned assets with its mapping preserved; unique unused assets and inactive code stay in the maintained source tree.

## Items without a producing recipe in this archive

| Group | Internal names | Consequence |
|---|---|---|
| Armor components | `y-combat-armor-1`, `y-combat-armor-2`, `y-combat-armor-3` | Active cyborg recipes consume these; their local manufacturing recipes are commented out |
| Guns | `y-sm-1`, `y-sm-2`, `y-sm-5` | Usable gun prototypes and export recipes exist, but local manufacture is commented out |
| Electrical ammunition | `y-mun-2` | An ammo prototype and export recipe exist; manufacture is commented out |
| Shield equipment | `y-equ-1`, `y-equ-2` | Equipment and export definitions remain; manufacture is commented out |
| Generator and movement equipment | `y-equ-6`, `y-equ-9` | Usable equipment definitions remain; manufacture is commented out |
| Walker armor | `y-cyb-8u`, `y-cyb-9u` | Armor and animation definitions remain; conversion recipes are commented out |
| Placeholder factories | `y-factory-4`, `y-factory-6`, `y-factory-7` | Heavy Weapons, Tank, and Supply factory construction is commented out |
| Wealth machinery | `y-rich-1`, `y-rich-2` | Entity definitions exist; construction recipes are commented out |

There are 18 such mod-owned item names. This includes deliberate placeholders as well as broken production connections. The local modern dependency dump also contained no producing recipes for the sampled legacy names `y-combat-armor-1`, `y-combat-armor-2`, `y-sm-1`, `y-equ-1`, or `y-cyb-8u`.

The advanced targeting recipe `y-fab8d-recipe` declares six ingredients while the original War Material factory declares `ingredient_count = 5`. That is a further historical compatibility/reachability question to check against the original engine; it was not tested here.

## Usable prototypes that remain

| Prototype | Defined behavior |
|---|---|
| Minigun (`y-sm-5`) | Bullet ammunition; range 18; cooldown 2 ticks; damage modifier 2 |
| Lasergun (`y-sm-1`) | Railgun ammunition category; range 40; cooldown 20 ticks; damage modifier 4 |
| Plasmagun (`y-sm-2`) | Railgun ammunition category; range 16; cooldown 7 ticks; damage modifier 4 |
| Electrical charge (`y-mun-2`) | Magazine size 10; launches repeated custom `p2` projectiles |
| Reactive Armor equipment | 3×2 shield equipment; maximum shield 120 |
| Shielded Armor equipment | 3×2 shield equipment; maximum shield 240 |
| CF-56 | 2×2 shield; maximum shield 240 |
| KT-34 | 3×3 shield; maximum shield 630 |
| Energy cell equipment | 2×2 battery; capacity 15 MJ |
| Mobile generator | 4×4 generator; power 15 MW |
| Movement equipment | 2×3; movement bonus 0.275; consumption 18 kW |
| Walker (`y-cyb-8u`) | 12×12 grid; inventory bonus 30; physical/acid resistance 12 flat and 55%; explosion resistance 20 flat and 55% |
| Second walker (`y-cyb-9u`) | 14×14 grid; physical/acid resistance 14 flat and 75%; explosion resistance 20 flat and 75% |

These statistics are declarations, not measured effective damage or combat performance. For example, gun range and the electrical ammunition's projectile range need testing together. The grenade-launcher gun definition is commented out; the active grenade-launcher product is a trade item.

## Evidence of migration toward parent-mod equipment

The bundled migration JSON names replacements such as:

| Legacy PFW name | Proposed replacement recorded in the file |
|---|---|
| `y-sm-1`, `y-sm-2` | `yi_lasergun` |
| `y-sm-5` | `yi_minigun` |
| `y-mun-2` | `yi_ammo_energie` |
| `y-combat-armor-2`, `y-combat-armor-3` | `yi_equip_shield_a` |
| `y-equ-1`, `y-equ-2` | `yi_equip_shield_b` |
| `y-zproduct-8` | `yi_equip_battery_a` |
| `y-equ-6` | `yi_equip_generator_a` |
| `y-equ-9` | `yi_equip_legs_a` |

The modern Yuoki snapshot contains those replacement names. This supports reusing modern Yuoki content, but does not make the old IDs aliases automatically or prove the migration ever ran.

The JSON is malformed (including trailing commas and a missing separator between sections), is stored under `prototypes/migrations/`, and includes inappropriate entries such as gun names in its equipment mapping. The neighboring Lua file only calls `game.reload_script()`. The owner subsequently chose a fresh 0.5.0 release: remove both legacy migration files during implementation and do not create a 0.4.15 upgrade migration. Their contents remain historical evidence here; see the [build plan](build-plan.md).

## Direct modern collisions

- `p2` already exists as a projectile in the local modern dependency dump.
- `y_walker_grid` already exists as a 14×14 equipment grid. PFW declares the same name with dimensions 12×12.

A port should assign ownership of these prototypes explicitly, avoiding accidental changes to parent-mod behavior.

Other cleanup candidates include missing/stale localization, package icons hiding the identity of trade goods, the `fals` typo in one animation definition, obsolete sound/graphics references, and old equipment energy-source fields. These have not all been validated against the running engine.

Sources: [gun/ammunition prototypes](../prototypes/uo_fab2.lua), [armor](../prototypes/uo_fab3.lua), [equipment](../prototypes/uo_fab8.lua), [character animation edits](../prototypes/uo_fabx.lua), [migration JSON](https://github.com/jatmn/Yuoki-PFW-Factorio-2.x/blob/103efa8acc74ab86b282b5388f64f333d06660dd/prototypes/migrations/yi_pfw_0.4.15.json), [inventory summary](data/inventory-summary.json).

## 0.5.1 audit: 2026-10-09

Manually reviewed the loaded PFW Lua modules, active recipes, factory categories, parent integration, equipment/character edits and graphics helpers. Compared against Factorio **2.1.21** prototype/runtime documentation and the engine changelog, with Yuoki **1.3.0** (`50ea38b9`) and Engines **1.3.0** (`8d777d01`). Original disabled state comes from the immutable 0.4.15 import (`103efa8a`) and its existing inventories, not from today's comments alone.

### The four progression checks

| Check | Result |
|---|---|
| Factory acquisition | The six production factories (1, 2, 3, 5, 8, 9) have enabled constructors using only parent materials. Each costs 2 Basic Machine Frames, 6 Blue Gears and 4 Simple Chips. Headless crafting produced all six, and each resulting factory was placed. **Not every declared factory is obtainable**: factories 4, 6 and 7 remain unfinished placeholders with disabled constructors. |
| Ingredients and machines | All **106 active PFW recipes** have a structurally reachable route through enabled recipes, obtainable machines and ordinary base research. The review includes parent guns/shields, Mk.1 components, biomass, imports and cell manufacture/refill. Prior supplied-input crafting tests cover every active PFW route; this pass adds construction and trade-bootstrap checks. |
| Circular dependencies and technology | No closed dependency cycle blocks those 106 routes. PFW recipes are enabled on a fresh force. Upstream steel, automation, oil/plastic and science requirements still apply; this does not mean everything is available immediately. Six remaining uncraftable item definitions are listed below. |
| Trade bootstrap | Verified live: 21 refined N4 + 21 steel → 21 Close Combat Weapons; three exports → 9 UC + 3 Trader Signs; one gray-coil import consumes 1 UC + 3 signs → 1 gray coil, leaving 8 UC. No imported goods, currency or signs were supplied to that chain. |

The structural trace starts with natural resources, unlocks base technologies through their prerequisites/science or research triggers, and admits recipes only when their ingredients and a compatible machine are reachable. It checks recipe categories, item-ingredient limits and fluid-capable machines. It is an availability check, not a simulation of quantities, fluid temperatures, power networks, probability, throughput or a complete playthrough. The live construction/trading test supplies parent construction materials (including a Stargate), electricity and the initial N4/steel. It does not claim those were obtained from mining during the test. No research was forced; all 106 PFW recipes were checked enabled on the fresh force.

The manual parent trace addresses the important apparent loops:

- Crusher and Heat Form Press constructors use base assemblers/metals; the press accepts ordinary chemical fuel. N4/F7 ores plus water produce crushed ores, refined materials and rich dust. These produce Blue Gears, Conductive Wire, Structure Elements, Chip Plates and Simple Chips, then the PFW factories. None needs PFW exports/imports.
- The Trade Node requires a **Stargate**, so trading is substantially later than basic PFW manufacture. Its accumulator, infuser, crystals, chips and fame trace through parent machines and ordinary base research. UC can be pressed from rich dust before trading. Crystals come from dirt washing; Technical Signs have manufacture byproducts; fame has a Mastercrafted Underground Drill manufacture byproduct. These routes can be expensive, but they do not require a pre-existing PFW trade economy. Crystal yields are probabilistic and require repeated production.
- Gray-coil imports break the apparent tires/vehicles/export loop. The melee export demonstrated above supplies its first UC and signs without tires or imports. Other starter exports also exist.
- Energy-cell refill needs an empty cell, but new-cell manufacture does not. Biomass returns its seed wood, which can be obtained from trees. Neither is a closed startup dependency.

### Compatibility results

No new active PFW load/crafting blocker was found. A field-name cross-check covered **181 active PFW declarations** and their recipe ingredients/results, energy sources, mining results, resistances, icon layers and remaining character-animation registration (734 structure checks). No unknown fields were found in those checked structures. Graphics helpers and their layer/direction/frame handling were also read manually; this is not a claim of exhaustive automated validation of every nested API type.

- Recipes use typed ingredient/result tables and modern `categories`; primary recipes retain the matching item ID and explicit `main_product`. Old `normal`/`expensive`, singular `result`/`result_count`, and old recipe category fields are not active PFW recipe definitions.
- Crafting entities use `graphics_set`, current energy/emissions fields and current module/effect properties. War Material retains its corrected six-ingredient capacity. PFW's active factory definitions have no fluid boxes to migrate; biomass uses the parent's chemistry-capable machine.
- Fuel uses `fuel_categories`, including the 2.1 item-field change. Conditional empty-cell recovery remains as previously tested; no burner changed.
- Character animation registration uses `mining_with_tool` and current rotated-animation properties. The orphaned local `playeranimations_y2.miningwithhands` table is now commented, preserving its source. Its only registration was already disabled in Phase 1; commenting the helper makes **no prototype change**.
- The remaining armor's `durability` is still a documented inherited ToolPrototype field, so it was not misclassified as an unknown field and removed. It should not be interpreted as the old armor-wear mechanic.
- There is no PFW `control.lua`, runtime event handler or remaining migration to port. Disabled historical blocks still contain old API forms and must be reviewed before any restoration.
- Some reused parent definitions retain legacy fields (for example `minable.hardness` on the Engines Trade Node and `base_area`/`base_level` on Yuoki fluid boxes). Those are upstream cleanup candidates, not PFW-owned declarations; this pass does not modify the parent repositories.

References: [2.1 prototype API](https://lua-api.factorio.com/latest/prototype-api.json), [RecipePrototype](https://lua-api.factorio.com/latest/prototypes/RecipePrototype.html), [CharacterArmorAnimation](https://lua-api.factorio.com/latest/types/CharacterArmorAnimation.html), [ArmorPrototype](https://lua-api.factorio.com/latest/prototypes/ArmorPrototype.html), [ItemPrototype](https://lua-api.factorio.com/latest/prototypes/ItemPrototype.html). The downloaded API identifies itself as 2.1.21; `latest` links may advance. This is a **2.1.21-targeted port**, not a claim that the package supports 2.0; its declared minimum remains 2.1.21.

### Originally disabled content still awaiting review

Of the original **35 commented recipes**, Mk.1 manufacture is restored and **34 remain inactive**. This count excludes recipes newly disabled during 0.5.x; none of the 105 originally active routes was disabled. Exact original IDs/source lines remain in the [existing recipe ownership inventory](data/recipe-ownership-audit.csv).

| Original disabled group | Remaining IDs | Count |
|---|---|---:|
| Wealth machine construction | `y-rich-1-recipe`, `y-rich-2-recipe` | 2 |
| Electrical ammunition manufacture | `y-fab1c-recipe` | 1 |
| Energy guns/minigun manufacture | `y-fab2b-recipe`, `y-fab2c-recipe`, `y-fab2f-recipe` | 3 |
| Future weapons and exports | `y-fab2h/i/k-recipe`, `y-rfab2h/i/k-recipe` (each slash denotes separate IDs) | 6 |
| Vehicle and chassis routes | `y-fab5h-recipe`, `y-rfab5a/b/c/h-recipe` | 5 |
| Equipment manufacture/export | `y-fab8b/c/g/h/i/k-recipe`, `y-rfab8a/h/i/k-recipe` | 10 |
| Heavy Weapons, Tank, Supply constructors | `y-fab4-recipe`, `y-fab6-recipe`, `y-fab7-recipe` | 3 |
| Armor components Mk.2/Mk.3 | `y-zproduct-3-recipe`, `y-zproduct-4-recipe` | 2 |
| Commodity-to-walker conversions | `y-fab3ix_y8-recipe`, `y-fab3ix_y9-recipe` | 2 |

Many old gun, shield, generator and movement constructors now overlap parent-owned products. Do not restore those as duplicate local products. Preserve the distinct future-content routes for design review. Current mappings remain in [parent-content notes](parent-content-0.5.1.md).

Other originally commented declarations are the plain-item forms of `y-mun-2`, `y-sm-1/2/5`; future items `y-sm-7/8/9`, `y-veh-7`, `y-equ-7/8`; the usable grenade-launcher gun `y-sm-3` (its trade commodity is active); a local Trader Sign item; and repeated placeholder `yrcat-retrade` declarations. These remain separate from the 22 redundant declarations suppressed during 0.5.1, the later wearable-cell suppression and the earlier collision/API fixes. See the [original prototype inventory](data/prototype-ownership-inventory.csv).

Six **still-registered but uncraftable** item definitions remain: `y-factory-4`, `y-factory-6`, `y-factory-7`, `y-rich-1`, `y-rich-2`, and armor `y-cyb-9u`. The first three also have no active PFW production recipes in their dedicated categories. They are preserved unfinished content; no active PFW recipe needs them as an ingredient. Their presence in Factoriopedia or editor menus is not proof of normal acquisition. The second armor's grid and character animation remain registered for future restoration.

### Retained graphics, separated by origin

The current `graphics/` tree contains **144 PNG files**. The engine prototype dump references **60**; **84 are unreferenced by active prototypes**. This scan follows resolved graphics-helper paths, not only literal Lua filenames. It excludes the separate package thumbnail and documentation media. An unreferenced runtime image can still be useful source material for the artwork tools.

- **72 paths were already unreferenced by active source in 0.4.15** and remain retained: spare ammunition/weapon/cyborg/vehicle art, metal bars/crystals/import icons, the spare gear/trade-node images, alternate group icon and miscellaneous basic art. These are not assets made obsolete by this port. The [original asset inventory](data/asset-audit.json) records the individual paths and references.
- **12 formerly referenced paths are now inactive**: the six original `fab-*-sheet.png` files; `graphics/entity/gate-node.png`, `trade-node-icon.png`, `tut-vai1.png`; `graphics/fab1/bst_z1.png`; `graphics/fab2/plasma-gun.png`; and `graphics/equip/fusion-cell-64.png`. This group includes preserved original sprite references and later redrawn art for subsequently disabled functions. A retained path does not imply its bytes are still the 0.4.15 artwork.
- No currently unreferenced graphics path was newly introduced under a different filename during 0.5.x. Confirmed parent replacements removed earlier remain covered by the existing mapping record.

Nothing in this inventory is deletion or reactivation approval. All unique unused artwork and disabled source remain preserved; no additional screenshots, generated sheets or repository audit artifacts were added for this check.
