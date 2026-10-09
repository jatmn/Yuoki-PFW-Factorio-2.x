# Animation batch 9: shared-factory parent reuse

Version remains **0.5.1**. PFW factories `y-factory-4`, `y-factory-6` and `y-factory-7` now reference Engines' `graphics/entity/science_gen.png` for their east/west animations. The redundant local `tut-hai1.png` is removed. Their distinct north/south `tut-vai1.png` remains unchanged, along with their recipes and machine behavior.

## Frame and parent assessment

Batch3 had already reused this machine family's parent icon, but deferred animation replacement until frames and directions were checked. This pass inspected all 16 frames of both PFW directions and the parent sheet. East/west and the parent have the same four circular stations, blue center and front rotating assembly in corresponding frames. North/south have a different front structure. Engines uses its one view in every direction; that does not make it a replacement for PFW's distinct north/south animation.

Yuoki and Engines remain at the previously reviewed revisions `50ea38b9703a13e8644c3bcfe6e400b3bf2b4a5c` and `8d777d015e36d93d2757a290c3f3f32a49c11280`. Both revisions were rechecked; the prior 242-path parent-building review is reused. Engines' unused `tut-2.png` was also inspected and is a different static structure. No further parent counterpart was confirmed.

Across all 16 east/west pairs, the largest mean RGB difference on grey is 1.9283 on a 0–255 scale; the largest mean alpha difference is 0.9012. Parent frames were resampled from 128px to 120px for this comparison. These measurements support the visual match; the originals and parent are not byte-identical. [Hashes, frame metrics and mappings](data/animation-batch-9-references.json) record the evidence.

## Runtime change and validation

PFW's original sheet has sixteen 120×120 frames; the parent has sixteen 128×128 frames. Each of the six east/west declarations uses the parent filename, width/height 128 and `scale = 0.9375` (120/128). Thus the display canvas remains 120×120. Shift `{0.3, 0}`, frame count 16, line length 16 and default animation speed remain unchanged. The [Factorio 2.1.21 Animation contract](https://lua-api.factorio.com/latest/types/Animation.html) was checked for frame layout, scale and the default speed of one frame per tick.

This is direct parent reuse, with no generated or repacked runtime sheet. The north/south source and declarations, all 34 prior AI assets, all other local artwork, and parent machine prototypes remain unchanged. No machine identity or crafting-category alias is introduced: these PFW factories retain their distinct production roles. Unused unique assets and disabled code remain intact.

The existing validator adds exact expectations for these three machines' east/west source dimensions and scale. Full prototype equality still covers everything else. Current totals: **41 parent replacements, 34 AI assets and 82 unchanged original PNGs**, with 116 local PNGs. The [validation record](data/animation-batch-9-validation.txt) includes package identity and headless checks. Final graphical playback and rotation checks remain with the owner's local client. No version bump or migrations are included.
