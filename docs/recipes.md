# Recipes and production chains

The supplied source declares 105 active recipes. Commented-out recipes are excluded; missing dependencies and unreachable intermediates do not remove an otherwise active declaration from the count.

| Category | Count |
|---|---:|
| Building construction (`crafting`) | 7 |
| Ammunition | 9 |
| Small Arms | 4 |
| Cyborgs | 10 |
| Vehicles | 9 |
| War Material | 4 |
| Components | 5 |
| Biomass (`chemistry`) | 1 |
| Imports and exports (`yrcat-retrade`) | 56 |
| **Total** | **105** |

The complete source-derived catalog is available as [CSV](data/recipe-inventory.csv) and [JSON](data/recipes.json). Every row has an internal recipe ID, inputs, outputs, category, base crafting time, and source file/line. A readable [complete catalog](recipe-catalog.md) is generated from the same records.

## Example production and sale recipes

All quantities are per recipe execution. UC means `y-unicomp-a2`. Sign means `ypfw_trader_sign`.

| Product | Manufacture | Export |
|---|---|---|
| Projectile Crate | 8 `y-ammo-hohlspitz` + 1 wooden chest → 1 crate | 8 crates → 1 Green Fractal + 1 sign |
| Chemical Weapon Canister | 6 `y-ammo-acid-2` + 1 iron chest → 1 canister | 4 canisters → 3 Bounded Red + 1 sign |
| HAP-Projectiles | 5 `y-ammo-poison` + 1 Fifty Gray's → 1 package | 2 packages → 5 UC + 1 sign |
| Rockets package | 3 vanilla rockets + 1 wooden chest → 1 package | 4 packages → 9 Fifty Gray's + 1 sign |
| Classic Drop Bomb | 1 iron plate + 1 explosives → 1 bomb | 15 bombs → 4 UC + 1 sign |
| Special Drop Bomb | 1 classic bomb + 1 basic Yuoki chip + 1 iron plate + 1 wooden chest | 8 bombs → 5 UC + 22 rich dust + 1 sign |
| Freedom Bomb | 1 classic bomb + 1 basic chip + 1 biomass + 1 iron chest | 4 bombs → 4 UC + 1 sign |
| Sweep Bomb | 1 classic bomb + 4 toxic dust + 1 Neotix + 1 `y_sc11` | 2 bombs → 6 UC + 2 Neotix + 1 sign |
| Exterminatus Bomb | 1 classic bomb + 1 Orange Crystal + 1 Katalex + 1 `y_sc11` | 1 bomb → 1 UC + 2 Magnetic Blocks + 2 Orange Crystals + 1 sign |
| Close Combat Weapons | 1 refined N4 material (`y-refined-yres1`) + 1 steel plate | 7 items → 3 UC + 1 sign |
| Grenade Launcher goods | 1 refined N4 material + 5 iron plates | 7 items → 3 UC + 1 sign |
| Brain Parasite | 3 biomass + 1 Combat Training Unit | 9 parasites → 2 UC + 1 sign |
| Wheels | 3 Fifty Gray's + 4 iron plates → 10 wheels | 3 wheels → 1 UC + 1 sign |
| Wheel Loader | 1 simple truck frame + 3 steel chests + 4 basic frames + 1 advanced frame | 1 loader → 2 Neotix + 8 UC + 1 sign |
| Battlefield Energy Stockpile | 4 large flywheels + 8 large accumulators + 3 Ultra Wire + 14 conductive wire + 4 iron cases | 1 stockpile → 1 Katalex + 245 UC + 1 sign |

These are recipe returns, not net profit calculations. The worth of input materials, electricity, machine investment, and parent-mod conversion paths must be included before judging profitability.

## Imports and resale

Each import produces one item. Every resale below also produces one Trader Sign.

| Material | Internal name | Import UC | Import signs | Resale payment |
|---|---|---:|---:|---|
| Fifty Gray's | `y-grycoil` | 1 | 3 | 16 rich dust |
| Bounded Red | `y-redcoil` | 3 | 9 | 50 rich dust |
| Green Fractals | `y-stuff-2` | 7 | 21 | 6 UC |
| Orange Crystals | `y-stuff-1` | 12 | 36 | 10 UC |
| Neotix | `y-stuff-5` | 20 | 60 | 18 UC |
| Ultra Wire | `y-stuff-3` | 35 | 105 | 31 UC |
| Magnetic Blocks | `y-stuff-4` | 50 | 150 | 45 UC |
| Katalex | `y-stuff-6` | 100 | 300 | 90 UC |

Imports consume three signs per UC spent. This discourages relying entirely on purchases: producing barter goods can supply useful materials directly, and trading activity supplies the signs. Prices do not change over time.

## Components and the biology chain

- Biomass: 1 old `wood` + 10 dirt + 25 water → 1 `raw-wood` + 2 biomass; base time 10 seconds. Old processed wood and raw wood were distinct items.
- Combat Training Units: 1 basic Yuoki chip → 6 units; base time 4 seconds. The internal `y-combat-train` name refers to training, not a railway train.
- Medic & Repair Sets: 2 biomass + 1 basic machine frame → 6 sets; base time 4 seconds. They are ordinary crafting components, not usable repair packs or healing capsules.
- Riflescopes: 2 basic chips + 1 Orange Crystal + 4 iron plates → 4 scopes; base time 4 seconds.

Brain parasites lead into cyborg recipes. Other cyborgs combine biomass, weapon goods, armor components, training, or medical sets. Their specialist descriptions do not implement battlefield behavior. For instance, nine Asklepios medical cyborg goods export for one UC, two Green Fractals, and one sign. Many other cyborg branches rely on components with missing manufacture recipes.

## Energy-cell loop

1. Assemble: 2 iron cases + 6 refined N4 material + 3 infused UC-A2 → 1 filled cell.
2. Export: 1 filled cell → 1 Green Fractal + 3 Bounded Red + 3 Fifty Gray's + 1 empty cell.
3. Recharge: 1 empty cell + 3 infused UC-A2 → 1 filled cell.

Assembly and recharge each have a base time of two seconds. This exchange does not award a Trader Sign. It returns the empty container explicitly; the source does not define a burnt-result item for burning the cell.

The item has a 12 GJ fuel value. Its separate equipment definition is a 2×2 battery with 15 MJ capacity and 15 MW input/output limits. The fuel value does not mean the equipment arrives holding 12 GJ.

## Why the cycles mattered

Sweep Bomb production consumes Neotix and its export returns the same amount. That imported material can circulate, while bombs, toxic dust, `y_sc11`, and power remain recurring inputs. Other branches transform locally manufactured machinery into rare materials, which can feed additional products or be converted into UC.

This supports the original goal of growing production through trade returns. It does not prove an infinite-resource exploit or a profitable modern economy without evaluating the complete conversion graph.

Most recipes omit `energy_required`; the catalog records the Factorio default of 0.5 seconds. Base time is divided by the crafting machine's speed. The extractor is a static parser for this archive's literal tables, not an emulator of the original engine.

Sources: [ammunition](../prototypes/ir_fab1.lua), [small arms](../prototypes/ir_fab2.lua), [cyborgs](../prototypes/ir_fab3.lua), [vehicles](../prototypes/ir_fab5.lua), [war material](../prototypes/ir_fab8.lua), [imports](../prototypes/ir_imports.lua), [components](../prototypes/ir_zmaterial.lua). The author's [May 2015 value sheet](https://johnsmith.ktec.de/factorio/mods/yuoki_docu/_pfw-value-sheet.pdf) documents an earlier balance and must not replace the 0.4.15 source quantities.
