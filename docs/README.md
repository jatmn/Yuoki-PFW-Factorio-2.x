# Profit from War discovery records

Research date: 2026-10-09. Subject: Yuoki Industries — Profit from War (`yi_pfw`) 0.4.15.

This directory preserves the original mod's behavior and restoration research. The original Factorio 0.14 release remains in the immutable import commit. The working source is now **0.5.1**, following the owner-tested and merged [Phase 1 startup port](phase-1.md). See [confirmed parent-content consolidation](parent-content-0.5.1.md) and its [parent artwork follow-up](asset-reuse-0.5.1.md) for current changes and validation. The owner selected [AI-assisted redraws for retained artwork](decisions/ai-artwork.md); the first four reviewed icons are now applied. Trade icons now use [Yuoki-generated arrow overlays](decisions/trade-arrow-overlays.md), replacing 49 baked variants. The [second AI batch](ai-artwork-batch-2.md) redraws eight import commodities, including the corrected processor colors. The [third artwork batch](artwork-batch-3.md) adds seven sprite-referenced building icons and reuses Engines artwork for the shared factory. The [ammunition-factory correction](ammunition-factory-artwork.md) applies that same method to its first-round icon. The [fourth artwork batch](artwork-batch-4.md) redraws five retained component icons after PR #6 merged, keeping version 0.5.1. The [fifth artwork batch](artwork-batch-5.md) redraws four battlefield-support components and records the side-mounted-cylinder correction. The [sixth artwork batch](artwork-batch-6.md) completes the remaining 32px inventory icons and pairs the empty cell with the accepted filled-cell model. Historical inventories still describe 0.4.15.

## Accepted implementation priority

[Build plan and release policy](build-plan.md): Phase 1 gets PFW to launch without crashing; cleanup and expansion follow. Implementation started at 0.5.0; the owner has now authorized 0.5.1. Add a Factorio-compliant changelog using Yuoki date formatting, update dependencies, and remove the legacy migrations for a fresh release without a 0.4.15 upgrade path. All migrations are now deferred until a formal release.

## Reading order

1. [Provenance and scope](provenance.md): original archive identity, preservation guarantees, historical dates, and limits of this research.
2. [Gameplay and economy](gameplay.md): what the mod did, what its factories produced, and how trading worked.
3. [Recipes and production chains](recipes.md): quantities, example loops, imports, and a complete linked recipe catalog.
4. [Incomplete and overlapping content](incomplete-content.md): defined versus obtainable items, placeholders, and dependency overlap.
5. [Factorio 2.1 assessment](factorio-2.1-assessment.md): concrete compatibility work and decisions that remain open.
6. [Parent-mod asset reuse](asset-reuse.md): accepted reuse/removal, unused-content preservation, and retained-artwork resolution requirements, initial ownership candidates, and validation before changing local artwork.
7. [Content ownership](content-ownership.md): reuse parent-owned machines, items, guns, and equivalent recipes while preserving unique PFW recipes and commenting out redundant definitions.
8. [Completed content evaluation](content-evaluation.md): current parent ownership candidates, all active/commented recipe dispositions, machine compatibility and unresolved mappings.
9. [Repository protections](repository-protections.md): the existing Yuoki policy used when creating this repository.
10. [Sources and verification](sources-and-verification.md): evidence, reproducibility commands, and work not performed.

## Machine-readable records

- [Original archive manifest](data/archive-manifest.json): SHA-1/SHA-256 identity and SHA-256 for every original file.
- [Mod Portal metadata snapshot](data/mod-portal-2026-10-09.json).
- [All 105 active recipes, CSV](data/recipe-inventory.csv).
- [All 105 active recipes, JSON](data/recipes.json).
- [Prototype and recipe counts](data/inventory-summary.json).
- [Dependency comparison record](data/dependency-comparison.json).
- [Content evaluation provenance](data/content-evaluation.json), [prototype dispositions](data/prototype-ownership-inventory.csv), [140-recipe audit](data/recipe-ownership-audit.csv), [detailed recipe comparison](data/recipe-ownership-audit.json), and [parent prototype evidence](data/parent-content-evidence.json).
- [Complete PNG audit](data/asset-audit.json) and [parent-asset reuse candidates](data/asset-reuse-candidates.csv).

“Active” means an uncommented declaration in the supplied source, not a recipe proven reachable or working in-game. Material costs and equipment statistics describe the original source unless explicitly marked as a modern comparison.
