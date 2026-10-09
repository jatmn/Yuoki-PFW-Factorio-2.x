# Decision: use AI-assisted redraws for retained artwork

Status: **accepted by the owner on 2026-10-09**. Applies to retained PFW artwork during the Factorio 2.1 restoration. Confirmed parent-owned artwork continues to use the parent files.

The owner requested four samples of conventional resizing and AI redraws. After seeing the ammunition factory, plasma gun, tire and filled energy cell side by side, the owner selected AI redraws and asked that the decision be recorded.

## Chosen method

Use the original artwork as the reference for AI-assisted redraws, preserving the recognizable object, palette, orientation and industrial style. The purpose is improved visual detail and readability. A redraw may interpret shapes and details; it is not a pixel-faithful enlargement. Conventional resampling remains useful for deriving game-sized PNGs from the accepted high-resolution redraws, but it is not the selected artwork-restoration method.

Review subsequent batches against the originals at their intended game sizes. Keep transparency and record prompts, source images, output identities and prototype metadata changes. For animations, consistent frames, directions and alignment must be established before replacing a sheet. This decision does not establish that an icon redraw method is already suitable for animation sheets.

Preserve unused unique artwork and disabled source. Reusing parent artwork remains the first choice for confirmed duplicates. Artwork changes do not resolve pending item ownership, activate disabled recipes, change gameplay or authorize migrations. Version remains **0.5.1** until the owner requests another bump.

## Current artwork progress

The [second batch](../ai-artwork-batch-2.md) adds eight import-commodity redraws, for 12 AI icons and 106 unchanged originals. The owner corrected the processor palette during review: its center must stay red and all eight outer cells blue. For future batches, enlarge the original before describing its colors and preserve each color-bearing part and its position. First-batch counts and validation below remain historical.

## Arrow variants

The owner confirmed this candidate works, then chose [Yuoki-generated arrow overlays](trade-arrow-overlays.md). Future AI work redraws base artwork only. The following first-batch record predates that overlay pass, which removes 49 redundant variants and leaves 118 local images (four AI redraws, 114 originals).

## First batch

The four reviewed AI samples are installed as 64×64 transparent icons:

| Asset | Runtime path | Consumers |
|---|---|---|
| Ammunition factory | `graphics/entity/fabrik-ammo-icon.png` | Factory item and machine icon |
| Plasma gun | `graphics/fab2/plasma-gun.png` | Gun icon; preserved inactive item declaration |
| Tire | `graphics/fab5/reifen.png` | Tire item |
| Filled energy cell | `graphics/fab8/fusion-cell.png` | Filled-cell item |

All six source references now declare `icon_size = 64`; five are active. Recipes that inherit these item icons follow automatically. World sprites, the equipment sprite, export variants and the empty-cell icon are unchanged in this batch. Their future redraws must be reviewed for consistency with the selected designs. The four replaced original icons remain in the immutable import; all other 163 local PNGs remain byte-identical. The earlier 39 parent-artwork replacements remain intact.

The [manifest](../data/ai-redraw-0.5.1.json) records exact prompts, built-in `image_gen` provenance, original/output hashes, full-resolution source paths and dimensions. The full-resolution PNGs are under `docs/artwork/ai-redraw-0.5.1/`; runtime copies are the same 64px Lanczos derivatives shown in the comparison. Documentation and authoring images are excluded from the candidate mod ZIP.

![Originals, conventional resizing and selected AI redraws](../artwork/ai-redraw-0.5.1/comparison.png)

Factorio's [2.1.21 icon documentation](https://lua-api.factorio.com/2.1.21/types/IconData.html) defines `icon_size` as the square image size in pixels. The existing [full-dump validator](../tools/validate_parent_content.py) admits only these four image replacements and their icon-size changes on top of the documented parent consolidation, while checking all other retained images and gameplay data. [Validation and candidate identity](../data/ai-redraw-0.5.1-validation.txt) record the package checks. The owner accepted the sample appearance; graphical validation of the integrated candidate remains a separate local check.
