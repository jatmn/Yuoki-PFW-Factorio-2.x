# 0.5.1: parent artwork reuse

This continues the unmerged PR #6 after the owner confirmed the first 0.5.1 candidate loads. Version remains **0.5.1**. No migrations, content-identity decisions, balance changes or retained-artwork upscaling are included in this pass.

## Result

**39 confirmed duplicate PNGs** now resolve to parent files: 33 from Yuoki and six from Engines. Their local copies were removed after updating all active and commented Lua references. The remaining **167 PNGs are byte-for-byte unchanged**, including unused unique artwork and candidates without a suitable confirmed replacement. All disabled code stays present and inactive.

The [central replacement manifest](data/asset-reuse-0.5.1.json) records every removed file, provider path, dimensions, original/provider SHA-256, previous source references and future-use mapping. Parent sources remain the verified Yuoki/Engines 1.3.0 commits used for the content pass. This deliberately adopts the recorded provider paths as dependency contracts, including a few currently unused but shipped parent files; their availability and hashes are checked during validation.

| Family | Treatment |
|---|---|
| `armor2`, `robo1`, `cb3` character sheets | Reuse same-layout Yuoki sheets. Active second-armor geometry, shifts, scale, timing, direction/frame counts remain unchanged. First-walker code remains commented; unused sheets retain a provider mapping. |
| Shield, generator and movement equipment sprites | Reuse equivalent Yuoki artwork without changing equipment identities or statistics. The ambiguous shield ownership decisions remain pending. |
| Weapon, walker and equipment icons | Use parent images and their actual icon sizes, including 64px files whose names still contain `32`. |
| Brain parasite and generic package | Reuse Engines icons. The generic package image is named `package_carni.png` there; PFW commodities remain PFW items. |
| Trader sign | Reuse Yuoki `trader_sign_x.png`, which preserves the blue artwork. The same-named `trader_sign.png` is gold and was rejected as a visual match. The local item declaration remains disabled. |
| Unused utility icons | Remove only visually confirmed duplicates with recorded parent paths; retain the future-use mapping even when no Lua consumer exists. |

Seventeen of the replaced files had active references before this artwork pass. The rest served disabled code or future use. Absence of a consumer was never a removal criterion.

## Evidence and rejected matches

The comparison covered all 206 PFW PNGs and 1,311 PNGs from the two pinned providers. Neither whole-file hashes nor decoded visible pixels produced exact matches. The accepted pairs are revised/recompressed or resized versions of the same artwork, established by visual comparison and compatible layout rather than an equality claim.

Same-basename review was extended with small-image similarity candidates and manual inspection. Similarity alone produced false positives: an ammunition image resembled a signal pole numerically, and a sparse rocket image resembled an empty image. Both originals remain. The 96px gearbox image remains because the confirmed 32px counterpart is not a suitable replacement for that richer future-use sprite. `barren_silver16.png` remains because its only same-named candidate is under Engines' `_obsolete` directory and no current replacement was selected.

All **1,126 80×100 frame tiles** across the 14 character sheets were compared at the same positions. Maximum per-tile mean RGBA difference was below 2.615 on a 0–255 scale. Representative sprite comparisons and every direction of the active second armor's idle, mining, running and running-with-gun sheets were inspected visually. This supports the same-layout mapping; it does not replace in-game rendering validation.

## Validation

The extended standard-library validator verifies every provider file/hash/dimension, all 167 retained original hashes, absence of each approved duplicate, and absence of removed paths from all Lua source including comments. It checks icon sizes and referenced sprite frame bounds. It also compares the complete engine dump with the Phase 1 baseline plus the explicitly allowed content changes and artwork substitutions, so gameplay changes cannot hide behind asset edits.

```sh
python3 docs/tools/validate_parent_content.py --before /path/to/0.5.0-dump.json --after /path/to/current-dump.json --yuoki /path/to/Yuoki --engines /path/to/yi_engines
python3 docs/tools/verify_original.py --archive-only
```

The existing provider detection and required dependencies remain in force. No fallback copies are bundled. The final distribution is checked against the exact runtime files and replacement manifest. [Selected validation and package identity](data/asset-reuse-0.5.1-validation.txt).

The earlier live checks of 56 trades, construction, equipment and ammunition remain applicable: the complete dump comparison proves this follow-up changes only asset paths and corresponding icon dimensions. Headless data loading, fresh-game creation and same-version save reload are checked again for the revised package. Graphical testing of this artwork revision remains a local check: inspect the PFW icons, retained shields and second armor in all movement/mining directions.

## Next work

Review/upscale retained low-resolution artwork using representative visual comparisons, then address the separately documented progression/accessibility work. Uncertain content mappings stay pending until deliberately resolved. Neither that work nor a later PR update authorizes a version bump or migrations.
