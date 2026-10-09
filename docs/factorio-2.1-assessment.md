# Factorio 2.1 restoration assessment

A restoration appears feasible, but changing `factorio_version` would not produce a working mod. The work includes modernizing prototypes, restoring production paths, reconciling parent-mod ownership, and rebalancing an incomplete economic design.

This assessment is a discovery record. The owner has added explicit requirements to reuse assets from loaded Yuoki/Engines, remove redundant local copies, and modernize the resolution of retained PFW artwork; see [asset reuse](asset-reuse.md). Unused assets and disabled/commented-out code must remain in the maintained source tree for future reuse; only confirmed parent-owned asset duplicates may be removed through the mapped replacement process. The complete implementation sequence and new gameplay features remain undecided. No PFW 2.1 load test was performed.

## Existing infrastructure

Local, clean Yuoki and Engines checkouts inspected during discovery both identified themselves as version 1.3.0 targeting Factorio 2.1, requiring base 2.1.20 or later. An existing Factorio 2.1.21 data dump was used for a name comparison. This is stronger evidence than the stale portal pages that still listed the mods as 2.0, but it is a local snapshot rather than proof of a particular public release status.

All external ingredient/product names referenced by active PFW recipes appeared somewhere in that dump except `flame-thrower` and `raw-wood`. This comparison checks names, not type correctness, reachability, balance, or full compatibility. The dump came from prior workspace activity and was not freshly generated for this discovery. [Snapshot identities and limitations](data/dependency-comparison.json).

## Asset ownership before the port

Map existing artwork to supported parent-owned assets before modernizing its prototype references. Keep both parent mods required, detect their enabled versions in the data stage, and use their files or visual definitions. Remove duplicate PFW files after replacement references and graphical validation are complete. Upscale retained low-resolution PFW assets to reviewed targets, with correct icon/frame metadata and preserved world size. These are required parts of restoration, not optional later cleanup. The [initial audit](asset-reuse.md) records 39 same-named candidates, with resolution/layout differences still requiring review.

## Required compatibility work

| Area | Observed legacy source | Required direction |
|---|---|---|
| Metadata | Factorio 0.14 and old minimum dependency versions | Select modern minimum versions after confirming dependency compatibility |
| Ingredients | Positional pairs such as `{"iron-plate", 1}` | Explicit typed records with `type`, `name`, and `amount` |
| Products | `result` and `result_count` | Modern `results` arrays; meaningful main products/localization for multi-output trade recipes |
| Booleans | `enabled = "true"` | Boolean `true` |
| **2.1 categories** | Singular recipe `category` | `categories = { ... }` under the current 2.1 schema |
| Machine graphics | Top-level `animation` | Current `graphics_set` structure |
| Old fields | Inventory flags, mining hardness, old emissions and ingredient limits | Remove or convert according to the target prototype API |
| Icons | Legacy 32-pixel icons without size metadata | Upscale retained low-resolution icons to reviewed modern targets and specify actual icon sizes |
| Vanilla names | `flame-thrower`, `raw-wood` | Update the flamethrower reference and redesign the old processed/raw-wood conversion |
| Fluids | Water quantities from the pre-0.15 fluid scale | Re-evaluate modern amounts rather than copying the numeric values blindly |
| Character | `data.raw.player.player.animations` | Current `character` prototype and armor-animation array handling |
| Equipment | Old definitions, names, energy fields, and armor properties | Prefer modern parent-mod equipment or explicitly restore distinct PFW items |
| Migrations | Malformed files in `prototypes/migrations` | Valid root `migrations/` files only if supported upgrade paths are chosen |

Official reference: [RecipePrototype](https://lua-api.factorio.com/latest/prototypes/RecipePrototype.html), [ItemIngredientPrototype](https://lua-api.factorio.com/latest/types/ItemIngredientPrototype.html), [CraftingMachinePrototype](https://lua-api.factorio.com/latest/prototypes/CraftingMachinePrototype.html), [CharacterPrototype](https://lua-api.factorio.com/latest/prototypes/CharacterPrototype.html), [migrations](https://lua-api.factorio.com/latest/auxiliary/migrations.html).

The biomass recipe deserves design attention: simply replacing `raw-wood` with `wood` changes the meaning of a recipe that originally consumed processed wood and returned raw wood. The original balance depended on the old conversion between them.

## Production and ownership work

Resolve the 18 items lacking a producing recipe and the two direct name collisions before calling the production graph complete. Several active cyborg and equipment recipes depend on unavailable legacy armor or gun IDs. Choose whether these become modern Yuoki equipment, distinct trade-only components, or restored legacy items.

Reusing `yi_lasergun`, `yi_minigun`, `yi_ammo_energie`, and modern equipment would fit the intent suggested by the bundled migration file. It would also change recipe costs and possibly create different recycling paths. Mapping names is not sufficient to preserve economics.

No runtime control system is present in the old archive. The existing trade mechanism can remain data-stage recipes and assembling machines; a new scripted market is not necessary to restore its original concept.

Preserve currently disabled recipes, placeholder content, and their unique assets while deciding how to restore them. Neither lack of a live recipe path nor lack of an asset reference authorizes pruning. Keep disabled behavior inactive until it is deliberately revisited.

## Balance and optional DLC

- Recalculate full material and power costs. The original factories used 2–3 MW and the Trade Node 1.25 MW.
- Keep deliberate trade profit distinct from accidental resource duplication.
- Decide whether expensive materials returned by a trade are intended catalysts and how productivity should treat them.
- Explicitly consider productivity, quality, and recycling for imports, exports, currency, signs, containers, and equipment. Current recipes expose controls including `allow_productivity`, `allow_quality`, and recycling-related metadata.
- Reassess large stack sizes, equipment strength, and the gap between cheap and advanced trade returns.
- If Space Age is supported, decide whether offworld lore remains flavor or gains actual planet/logistics requirements. The original mod did not implement these.
- Clarify whether progression stays ingredient-gated or gains technologies; the original addon has no technology prototypes.

## Suggested bounded first playable scope

This is a recommendation, not an accepted implementation plan:

1. Map and reuse parent-owned artwork under the accepted asset-reuse requirement, then preserve the six functional factory roles, Trade Nodes, and eight exotic materials.
2. Restore a small set of complete production/export/import loops using modern dependency items.
3. Validate that every intended product can be obtained without editor spawning.
4. Evaluate costs and returns before expanding the remaining chains.
5. Reintroduce custom walker visuals only after resolving equipment ownership and character compatibility.

Deployable cyborgs, drivable trucks, demand-based markets, missions, and actual interplanetary trade would be new features. Their names and graphics in the old archive do not establish existing implementations to port.

## Validation needed for an implementation

A future port should load against a pinned Factorio 2.1 build and dependency revisions, create a new save, exercise complete production and trade loops, and check equipment behavior. Quality/recycling combinations and existing-save migrations need separate coverage if they are supported. Prototype loading alone would not prove economy balance or recipe accessibility.
