# Accepted build sequence and release policy

Owner requirements recorded 2026-10-09. These govern implementation and supersede the earlier suggested order where it put comprehensive cleanup ahead of getting the game to launch. The owner confirmed the Phase 1 candidate works and merged PR #5. Implementation continues with [0.5.1 confirmed parent-content consolidation](parent-content-0.5.1.md).

## Version and changelog

- Start the restored mod at **0.5.0** when implementation begins. Set `info.json`, the package version and the first changelog section consistently.
- The owner explicitly authorized **0.5.1** after merging Phase 1. Keep the 0.5.0 changelog section intact and accumulate this pass in 0.5.1. Hold at 0.5.1 until another version is authorized; commits, PRs and completed phases do not authorize an automatic bump.
- Add a root `changelog.txt` when building. There is no existing changelog to carry forward; do not invent historical release entries. Record implemented changes rather than prospective discovery tasks.
- Use Yuoki Industries' date convention: `Date: D. M. YYYY`, with unpadded day/month and spaces after the dots; for example `Date: 8. 10. 2026`. Use the applicable release date, not the example or discovery date by default. Reference: [Yuoki 1.3.0 changelog](https://github.com/jatmn/Yuoki-Factorio-2.x/blob/50ea38b9703a13e8644c3bcfe6e400b3bf2b4a5c/changelog.txt).
- Follow Factorio's parser format: exactly 99 hyphens for the section separator, immediately followed by the section version (currently `Version: 0.5.1`); category lines indented two spaces and ending in a colon; entries indented four spaces then `- `; continuation lines indented six spaces. Avoid tabs, trailing spaces and duplicate version sections.

The in-game browser parses this structure; the Mod Portal displays the file as plain text. Use the same file for both and verify it displays correctly in the game with no changelog parsing errors. The date format itself is unrestricted by Factorio, so Yuoki's convention is compatible. [Official changelog specification](https://lua-api.factorio.com/2.1.21/auxiliary/changelog-format.html).

## Dependencies and target

Replace the obsolete Factorio 0.14 dependency metadata during Phase 1. Keep **both Yuoki Industries and Yuoki Engines required**. Based on the evaluated parent 1.3.0 sources, the initial candidate metadata is:

| Field | Candidate for the first build |
|---|---|
| `version` | `0.5.0`, held until explicit owner instruction |
| `factorio_version` | `2.1` |
| Required dependencies | `base >= 2.1.20`, `Yuoki >= 1.3.0`, `yi_engines >= 1.3.0` |

Verify these against the actual parent versions/API used when building. The current parent-only validation ran on Factorio **2.1.21**, not on the proposed minimum 2.1.20. Test the advertised minimum before claiming it is supported, or raise the minimum to the earliest verified build. Record exact test versions/commits separately from declared minimums. Do not copy unrelated optional integrations or incompatibilities merely because a parent declares them. [Dependency and metadata syntax](https://lua-api.factorio.com/2.1.21/auxiliary/mod-structure.html).

When parent definitions/assets are used, resolve them against the loaded providers. Dependency updates are part of the initial startup work, not a later cleanup task. See the [parent evaluation](content-evaluation.md) for pinned sources and concrete collisions.

## Fresh release: no legacy migrations

**0.5.0 is a fresh, clean release.** The owner explicitly authorized removing the currently bundled legacy migration files during implementation:

- `prototypes/migrations/yi_pfw_0.4.15.json`
- `prototypes/migrations/yi_pfw_0.4.15.lua`

Do not repair, relocate or execute those files. Do not add a 0.4.15 → 0.5.0 migration or an old-save upgrade path. Validate new games and saves created by 0.5.0. The original archive/import and discovery records retain historical evidence; the future package should not carry these legacy migrations.

This is a specific exception to the general rule preserving disabled code. All other disabled/commented content and unused unique artwork remain subject to the preservation requirements. **Updated owner direction: do not add any migrations before a formal release.** Use fresh games for development-version validation; save/reload checks use the same development version.

## Phase 1 — launch successfully

The first milestone is **PFW enabled alongside its required parents in Factorio 2.1, launching and entering a new game without a crash**.

Scope: establish 0.5.0 metadata/changelog, update dependencies, remove the legacy migrations, and resolve startup blockers. Work through obsolete prototype syntax/fields, missing references/assets, invalid character/equipment definitions and conflicting parent prototype names. Use the ownership research when a collision or missing reference blocks startup, while keeping the change bounded to compatibility. Do not solve startup by disabling the entire mod or silently dropping its content; preserve any unavoidable temporary exclusion in source and document its cause and follow-up.

Completion evidence:

1. PFW is enabled at version 0.5.0 with the recorded required dependency versions.
2. Data-stage validation completes without fatal errors.
3. A graphical client reaches the main menu and creates/enters a new game with PFW enabled, with no startup, asset-loading or initialization crash. A headless dump alone cannot establish this.
4. The new game runs for a brief smoke test, can be saved, and that 0.5.0 save reloads successfully. No legacy-save migration is expected.
5. The root changelog has a single valid 0.5.0 section, uses Yuoki's date style, and displays correctly. Record remaining gameplay/visual issues as later work.

This milestone establishes a working launch baseline. It does not assert complete recipe accessibility, correct economics, finished ownership consolidation or final artwork quality.

## After Phase 1

Continue the documented parent-content consolidation, unique-recipe restoration, duplicate-asset replacement/removal, retained-artwork upscaling, balance work, cleanup and expansion **after the startup milestone**. These requirements remain in force; they are not prerequisites for Phase 1 except where a specific compatibility fix is needed to launch.

Preserve unique recipes when a machine/item moves to a parent. Retain redundant prototype definitions commented and annotated, and preserve other disabled content and unused unique assets. Apply only the explicit legacy-migration removal exception above. Completing later work does not authorize a bump beyond the explicitly approved current version, 0.5.1.

## Retained-artwork method

On 2026-10-09 the owner selected **AI-assisted redraws** after reviewing four comparisons against conventional resizing. Follow the [accepted artwork decision](decisions/ai-artwork.md), preserve parent reuse and unused unique artwork, and review later batches at game size. The first four reviewed icons are implemented at 64px; this does not complete all retained artwork or animation work.
