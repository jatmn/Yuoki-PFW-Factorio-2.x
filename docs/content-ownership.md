# Parent-mod content ownership and recipe reuse

## Accepted requirement

The restoration must audit content already moved into Yuoki Industries or Yuoki Engines: machines/entities, their placement items and construction recipes, intermediate items, guns, ammunition, equipment, and processing/trading recipes. PFW should use the existing parent-owned content instead of registering redundant local equivalents.

Keep redundant PFW definitions in the maintained source as commented-out, inactive code, with the owning mod and replacement prototype/recipe ID recorded beside them. Do not delete them or rely only on Git history. Already-disabled code remains available for later review and is not automatically enabled by this work.

The [completed discovery evaluation](content-evaluation.md) applies this requirement to all active and commented literal declarations against pinned Yuoki and Engines 1.3.0 sources. It records confirmed overlap, replacement candidates, unique routes and unresolved mapping decisions. Neither similar artwork nor matching output items alone proves two definitions redundant.

## Evaluate each definition separately

| Finding | Required treatment |
|---|---|
| Equivalent machine/entity already supplied by a parent | Use the parent machine; retain and comment out the redundant PFW entity definition |
| Equivalent placement item or construction recipe already supplied by a parent | Use the parent item/recipe; retain and comment out the redundant PFW definitions |
| Equivalent item, gun, ammunition, or equipment already supplied by a parent | Point PFW consumers to the parent prototype; retain and comment out the redundant PFW definition |
| Equivalent recipe already supplied by a parent | Reuse the existing recipe; retain and comment out the redundant PFW recipe |
| Parent owns the machine or product, but PFW supplies a distinct recipe | Keep the PFW recipe, adapting references and crafting compatibility to the parent-owned content |
| Unique PFW content with no equivalent | Keep it; modernize active functionality and preserve inactive definitions for later work |
| Only the image is shared | Reuse the asset; evaluate prototype and recipe equivalence independently |

A reused machine does not make every recipe in its old source file redundant. Review declarations individually, including inputs, outputs, amounts, byproducts, crafting categories, accessibility/unlocks, effects, and role in the trade economy. Different names can represent moved content, while identical-looking machines can have different functions. A recipe producing the same item by a meaningfully different route may remain useful PFW content.

## Machine and unique-recipe example

Suppose PFW originally defined a machine that now exists in Engines, together with a processing recipe Engines does not provide:

1. Use the Engines entity and its existing placement item/construction recipe where they are equivalent.
2. Keep the redundant PFW machine/item/construction declarations commented out, annotated with the Engines replacements.
3. Preserve the distinct PFW processing recipe. Point its ingredients and products to the agreed owners.
4. Ensure the parent machine can perform that recipe. Reuse a suitable existing crafting category, or add the narrow compatibility extension needed for a PFW category without replacing the parent's unrelated capabilities.
5. Verify the retained recipe is accessible, accepts the intended ingredients/fluids, completes, and produces its outputs in the parent machine.

A unique recipe must not disappear merely because its former machine is no longer locally registered. Likewise, reusing a parent gun does not automatically remove a PFW-only export recipe for that gun.

## Ownership mapping and implementation order

For every reviewed definition, record the PFW type/ID and source location, parent mod and type/ID, supported parent version, evidence of equivalence, retained unique functionality, and the resulting action. Keep ambiguous candidates pending instead of treating them as duplicates automatically.

1. Audit supported current parent versions and classify prototypes and recipes separately.
2. Establish a central ownership mapping and annotate redundant PFW definitions with their replacements.
3. Update active PFW references, including recipe ingredients/results, placement/mining results, equipment links, ammunition/projectiles, crafting categories, and unlock effects as applicable.
4. Keep redundant local definitions commented out so they are not registered. Setting a recipe's `enabled` flag to false alone does not satisfy this requirement: the redundant definition must remain inactive at registration, with the parent implementation used instead.
5. Preserve unique recipes and any narrowly required machine compatibility, without overwriting unrelated parent behavior.
6. Account for inactive code's future-use references and mappings; keep that code inactive and present.
7. Apply asset reuse/removal only under the separate [asset policy](asset-reuse.md). Unique unused artwork stays available for future work.

## Acceptance checks

- One active owner exists for each confirmed equivalent machine, item, gun, equipment component, or recipe.
- Every suppressed PFW definition remains in source, commented out and annotated with its parent replacement.
- Active consumers resolve to existing prototypes of the correct type under supported dependency versions.
- Every unique PFW recipe is retained and accessible wherever its active behavior is intended; currently disabled recipes remain preserved for deliberate later restoration.
- Retained processing recipes actually run in their selected parent machine, with compatible ingredients, fluids, outputs, and crafting categories.
- Parent content retains its unrelated recipes, capabilities, and behavior.
- No unused assets or disabled code are pruned because they lack current consumers.

The [evaluation and disposition records](content-evaluation.md) now provide the duplicate-content decision list, including explicit pending cases. The older [incomplete-content inventory](incomplete-content.md) and [dependency comparison](data/dependency-comparison.json) remain historical discovery evidence. The evaluation changes documentation only.
