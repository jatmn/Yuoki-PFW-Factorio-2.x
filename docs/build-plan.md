# Accepted build sequence and release policy

Owner requirements recorded 2026-10-09. These govern implementation and supersede the earlier suggested order where it put comprehensive cleanup ahead of getting the game to launch. The owner confirmed the Phase 1 candidate works and merged PR #5. Implementation continues with [0.5.1 confirmed parent-content consolidation](parent-content-0.5.1.md).

## Version and changelog

- Start the restored mod at **0.5.0** when implementation begins. Set `info.json`, the package version and the first changelog section consistently.
- The owner explicitly authorized **0.5.1** after merging Phase 1. Keep the 0.5.0 changelog section intact and accumulate this pass in 0.5.1. Hold at 0.5.1 until another version is authorized; commits, PRs and completed phases do not authorize an automatic bump.
- Maintain root `changelog.txt` with implemented changes rather than prospective discovery tasks. The owner supplied the historical 0.4.15 entry dated 2016-10-23: "still unfinished, but now aviable at mods.factorio.com". Preserve that wording; do not invent other historical entries.
- Updated owner direction: use `Date: YYYY-MM-DD`, with zero-padded month/day. The current 0.5.0 and 0.5.1 sections use `Date: 2026-10-09`; historical 0.4.15 uses `Date: 2016-10-23`. This supersedes the earlier Yuoki-style date instruction.
- Follow Factorio's parser format: exactly 99 hyphens for the section separator, immediately followed by the section version (currently `Version: 0.5.1`); category lines indented two spaces and ending in a colon; entries indented four spaces then `- `; continuation lines indented six spaces. Avoid tabs, trailing spaces and duplicate version sections.

The in-game browser parses this structure; the Mod Portal displays the file as plain text. Use the same file for both and verify it displays correctly in the game with no changelog parsing errors. The date format itself is unrestricted by Factorio; use the owner’s year-month-day convention. [Official changelog specification](https://lua-api.factorio.com/2.1.21/auxiliary/changelog-format.html).

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
5. The root changelog has valid version sections and displays correctly. Current date/history requirements above supersede the original Phase 1 single-section/date-style check. Record remaining gameplay/visual issues as later work.

This milestone establishes a working launch baseline. It does not assert complete recipe accessibility, correct economics, finished ownership consolidation or final artwork quality.

## After Phase 1

Continue the documented parent-content consolidation, unique-recipe restoration, duplicate-asset replacement/removal, retained-artwork upscaling, balance work, cleanup and expansion **after the startup milestone**. These requirements remain in force; they are not prerequisites for Phase 1 except where a specific compatibility fix is needed to launch.

Preserve unique recipes when a machine/item moves to a parent. Retain redundant prototype definitions commented and annotated, and preserve other disabled content and unused unique assets. Apply only the explicit legacy-migration removal exception above. Completing later work does not authorize a bump beyond the explicitly approved current version, 0.5.1.

## Retained-artwork method

On 2026-10-09 the owner selected **AI-assisted redraws** after reviewing four comparisons against conventional resizing. Follow the [accepted artwork decision](decisions/ai-artwork.md), preserve parent reuse and unused unique artwork, and review later batches at game size. The first four reviewed icons are implemented at 64px; this does not complete all retained artwork or animation work.

The owner also selected [Yuoki-generated trade arrows](decisions/trade-arrow-overlays.md). Redraw base artwork only and generate arrow variants through the parent helper; do not create separate baked-arrow PNGs.

For building artwork, the owner requires inspecting existing sprite/animation sheets and checking both parents before drawing. Reuse confirmed parent art directly; otherwise use both icon and sprite references. Preserve structural identity and colors. See the [batch3 reference correction](artwork-batch-3.md).

## Follow-up work after the current 0.5.1 pass

Recorded at the owner's request on 2026-10-09. The active content has no known startup or missing-input blockers from the completed checks. These are follow-ups, not claims that a full playthrough or release review is complete. Keep version **0.5.1** and defer migrations until a formal release; this list does not authorize balance changes or disabled-content restoration.

- [ ] **Latest Walker export graphical check:** verify the parent Walker icon/generated arrow, displayed name, input and payout in the client: one Walker - T.R. → 100 Katalex + 250 Neotix + 5000 Trader Signs. Actual manufacture/export and save/reload already passed headless. Review the current [PR #9](https://github.com/jatmn/Yuoki-PFW-Factorio-2.x/pull/9) before merging.
- [ ] **Trade-economy audit:** compare current parent manufacturing costs with PFW returns; identify inconsistent contracts and profitable exchange loops, then present proposed changes before adjusting payouts. Include gun/shield exports, cyborg costs, both direct armor exports, wealth-machine costs and the PFW constructor yielding ten Trade Nodes. Concrete example: three identical parent laser guns currently pay 41 UC + one Trader Sign, while six pay 50 UC + one sign; two smaller exports instead pay 82 UC + two signs. Recommended next substantive task.
- [ ] **Ordinary progression playthrough:** establish practical acquisition costs, timing and trading progression from resources through factories, the first Trade Node and later exports/imports. Structural reachability and supplied-input crafting checks do not replace this playthrough.
- [ ] **Optional disabled-content review:** examine future weapons, vehicle/chassis trades and equipment concepts individually for usefulness and overlap with both parents. Preserve their code/art while deciding whether to restore anything. Heavy Weapons, Tank and Supply factories stay disabled; restoring them needs a functional design, not just constructors.
- [ ] **Deferred Engines Research Center artwork:** carry out [issue #8](https://github.com/jatmn/Yuoki-PFW-Factorio-2.x/issues/8) in an Engines PR: directional views, recolorable material/light masks and validated animation/shadows. Keep PFW's three placeholders disabled; the artwork task does not automatically require a PFW change.
- [ ] **Status-document reconciliation and release preparation:** refresh existing current-status counts and stale pending statements against accepted changes and user checks, while preserving clearly labeled historical discovery records. Reconcile the implemented changelog before a formal release. Reuse existing records; add no duplicate screenshots or documentation files. Release publication, version changes and any migration work remain separate decisions.
