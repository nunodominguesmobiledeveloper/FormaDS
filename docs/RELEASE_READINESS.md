# Release readiness audit — Phase 14.6

Audit date: 11 November 2026  
Audited branch: `release/phase-14.6-readiness`  
Release status: **not approved and not released**

## Verified

- `Package.swift` declares Swift tools 6.4, iOS 17+, the `FormaDS` library product,
  processed resources and the `FormaDSTests` target.
- The package has no external package dependencies.
- The public API and documentation inventories were reviewed during Phases 14.2
  and 14.5.
- All package-owned runtime localization keys have non-empty English and European
  Portuguese values.
- The three themes remain available with Light and Dark semantic values.
- The package built successfully with Xcode 27.0 (build 27A266a).
- All 117 package tests passed with zero failures or skipped tests.
- The Showcase built and ran on a physical device during Phase 14.5. Phase 14.6
  changes do not modify Swift source or project configuration.
- No obvious credential, private-key or provisioning-profile files are tracked.
- No `TODO`, `FIXME`, `@unchecked Sendable` or `nonisolated(unsafe)` markers were
  found in the package source.
- The Phase 14.7 independent consumer fixture built and ran on an iPhone 18 Pro
  simulator with all six theme/appearance combinations, English and European
  Portuguese localization, state changes and presentation components verified.

## Corrections made

- Added an unreleased changelog without claiming a stable version.
- Made CI resilient to Xcode 27 patch updates by relying on the explicitly selected
  `xcode-27` runner image and verifying its active toolchain.
- Removed the exact simulator OS patch from the CI destination so compatible runtime
  updates do not break validation.
- Updated the release checklist with completed documentation and API-review evidence.

## Release blockers

| Priority | Item | Required action |
|---|---|---|
| High | Proprietary license remains a draft | Set the effective date, governing law/venue and acceptance process; obtain qualified legal review. |
| Resolved | Font binary provenance | All seven TTF files were replaced from pinned official static upstream distributions; PostScript names, notices and hashes are recorded in the asset audit. |
| High | Candidate CI result pending | Merge the readiness changes and confirm CI on the exact candidate commit. |
| High | Release approval pending | Record the candidate SHA and obtain explicit owner approval before tagging. |
| Medium | Manual accessibility sign-off pending | Validate VoiceOver, maximum Dynamic Type, Reduce Motion and touch targets. |
| Medium | Visual-regression policy pending | Approve snapshot infrastructure or retain a controlled manual baseline. |
| Medium | Showcase UI-test decision pending | Decide whether the absent UI-test target is acceptable for 1.0. |

## Non-blocking observations

- The package runtime defaults are localized. Some extracted Showcase demonstration
  strings rely on source-language fallback; they do not affect package-owned defaults
  and should be reviewed as Showcase content rather than changed automatically.
- The command-line Showcase build in the assistant sandbox could not access the user's
  SwiftPM/CoreSimulator caches. The same Showcase was already built and run through
  Xcode during Phase 14.5; candidate CI must provide the definitive clean-environment
  build result.

## Prohibited until the gates close

Do not create a `1.0.0` tag, GitHub release or stable-version claim until all high
priority blockers above are closed and the repository owner explicitly approves the
release.
