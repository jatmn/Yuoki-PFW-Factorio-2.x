# Incomplete and overlapping content

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

The JSON is malformed (including trailing commas and a missing separator between sections), is stored under `prototypes/migrations/`, and includes inappropriate entries such as gun names in its equipment mapping. The neighboring Lua file only calls `game.reload_script()`. These files need deliberate replacement if save migration becomes part of a future port.

## Direct modern collisions

- `p2` already exists as a projectile in the local modern dependency dump.
- `y_walker_grid` already exists as a 14×14 equipment grid. PFW declares the same name with dimensions 12×12.

A port should assign ownership of these prototypes explicitly, avoiding accidental changes to parent-mod behavior.

Other cleanup candidates include missing/stale localization, package icons hiding the identity of trade goods, the `fals` typo in one animation definition, obsolete sound/graphics references, and old equipment energy-source fields. These have not all been validated against the running engine.

Sources: [gun/ammunition prototypes](../prototypes/uo_fab2.lua), [armor](../prototypes/uo_fab3.lua), [equipment](../prototypes/uo_fab8.lua), [character animation edits](../prototypes/uo_fabx.lua), [migration JSON](../prototypes/migrations/yi_pfw_0.4.15.json), [inventory summary](data/inventory-summary.json).
