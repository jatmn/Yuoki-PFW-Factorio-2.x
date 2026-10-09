# Provenance and scope

The supplied `yi_pfw_0.4.15.zip` is the historical Profit from War addon by Yuoki Tani. Its SHA-1 matches the release identified by the public Mod Portal API.

| Property | Evidence |
|---|---|
| Mod name | `yi_pfw` |
| Title | Yuoki Industries - Profit from War |
| Version | `0.4.15` |
| Date in `info.json` | 2016-10-23 |
| Factorio target | `0.14` |
| Dependencies | `base >= 0.14`, `Yuoki >= 0.4.61`, `yi_engines >= 0.4.19` |
| Portal upload timestamp | 2017-01-22T11:54:08.214000Z |
| Archive SHA-1 | `ec3e903e2f96718b2b4e537415c489e5777ef1bc` |
| Original import commit | `103efa8` |

The October source date and January portal upload date describe different events. The forum announcement also identifies 0.4.15 with the October 2016 release.

## Preservation

The initial `main` commit contains all 232 files from the archive. The packaging directory `yi_pfw_0.4.15/` was removed so `info.json`, `data.lua`, `prototypes/`, `locale/`, and `graphics/` sit at the repository root. Relative paths inside that directory and every file's bytes are preserved. Original CRLF line endings were retained.

Git cannot represent empty directories. The archive's empty `graphics/fab6/` and `graphics/fab7/` directories are recorded in the manifest; no marker files were inserted into the original source. ZIP timestamps and directory entries are archive metadata, not a guarantee made by Git.

Every staged blob was compared with its archive entry before the original commit. [The manifest](data/archive-manifest.json) includes the archive SHA-256 and per-file SHA-256 values. The discovery PR adds only `/docs`; it does not repair the original mod or add a root README, license file, build tooling, or game configuration.

## Historical intent

The portal describes an addon for experienced Yuoki players, centered on profitable groups of trading factories, mid/endgame production puzzles, and cycles supported by trade returns. Most goods were intended for sale.

On March 31, 2017, YuokiTani marked the addon obsolete/broken pending redesign and fixes. The author said some concepts had moved into YI Engines' Agronomie content. This is consistent with the incomplete source; it is not evidence that every original recipe failed.

The portal metadata labels the release MIT. That metadata is preserved as an observation; the ZIP contains no standalone license document, and the import does not invent one or change attribution.

Sources: [original metadata](../info.json), [portal](https://mods.factorio.com/mod/yi_pfw), [portal API](https://mods.factorio.com/api/mods/yi_pfw/full), [release discussion](https://forums.factorio.com/viewtopic.php?t=12217), [obsolete notice](https://forums.factorio.com/viewtopic.php?t=12217&start=40).

## Research boundary

The work comprises static source inspection, historical primary-source research, recipe extraction, and comparison with existing local Factorio 2.1 dependency snapshots. The complete original 0.14 dependency stack was not reconstructed. Neither a historical gameplay test nor a PFW 2.1 load test was performed. Missing recipes in this archive must not automatically be described as proof of unavailability under every historical mod combination.
