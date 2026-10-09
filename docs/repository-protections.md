# Repository protection record

Configured on 2026-10-09 for [jatmn/Yuoki-PFW-Factorio-2.x](https://github.com/jatmn/Yuoki-PFW-Factorio-2.x).

The reference policy was inspected live on `jatmn/Yuoki-Factorio-2.x`, `jatmn/Yuoki-Engines-Factorio-2.x`, and the railway repository. The new repository mirrors the core Yuoki ruleset rather than the separate, stricter PR requirement used by `yuoki-quinityn`.

| Setting | Applied value |
|---|---|
| Visibility | Public |
| Default branch | `main` |
| Active ruleset | `Master` |
| Ruleset scope | All branches (`~ALL`) |
| Branch deletion | Blocked |
| Non-fast-forward updates / force pushes | Blocked |
| Bypass | Repository administrator role, always; matches core Yuoki |
| Secret scanning | Enabled |
| Secret-scanning push protection | Enabled |
| Merge methods | Merge, squash, and rebase |
| Automatic branch deletion after merge | Enabled |
| Auto-merge | Disabled |
| Actions | Enabled; all actions allowed, matching the inspected repositories |
| Default workflow token permissions | Read, matching Engines and Railways |
| Workflow approval of PR reviews | Disabled, matching Engines and Railways |

No required status checks, required reviewer count, or mandatory PR rule were added because they are absent from the core Yuoki reference ruleset. Administrator bypass is part of that policy, so the deletion and force-push restrictions are not absolute for administrators.

[New ruleset](https://github.com/jatmn/Yuoki-PFW-Factorio-2.x/rules/24811615) · [Core reference ruleset](https://github.com/jatmn/Yuoki-Factorio-2.x/rules/2576592) · [Engines reference ruleset](https://github.com/jatmn/Yuoki-Engines-Factorio-2.x/rules/2576417)

The original import was pushed before the discovery branch. The documentation is submitted through a separate PR and remains unmerged pending further direction. This document is a creation-time record, not an automatically updated assertion about future settings.
