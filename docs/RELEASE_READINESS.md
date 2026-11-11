# Release readiness audit — FormaDS 1.0.0 MIT preparation

Audit date: 11 November 2026  
Prepared candidate branch: `release/1.0.0-rc`

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
- The standard MIT License is present with `Copyright (c) 2026 Nuno Domingues`.
- The release documentation no longer imposes proprietary Personal/Commercial,
  acceptance, governing-law, fork or redistribution restrictions.
- The Showcase built and ran on a physical device during Phase 14.5. Phase 14.6
  changes do not modify Swift source or project configuration.
- During the MIT release-preparation pass on 11 November 2026, the Showcase
  completed Clean Build Folder and Build successfully, and the independent
  consumer application also completed a clean build and launched successfully.
- No obvious credential, private-key or provisioning-profile files are tracked.
- `.gitignore` covers Xcode user data, build products, environment files, signing
  material, provisioning profiles, private keys and common certificate formats.
- No `TODO`, `FIXME`, `@unchecked Sendable` or `nonisolated(unsafe)` markers were
  found in the package source.
- The Phase 14.7 independent consumer fixture built and ran on an iPhone 18 Pro
  simulator with all six theme/appearance combinations, English and European
  Portuguese localization, state changes and presentation components verified.
- The seven bundled fonts retain their required PostScript names; package tests
  confirmed registration, and the updated official binaries were manually
  validated in the Showcase without observed fallback or layout regressions.
- Automated accessibility coverage protects localized descriptions, progress values,
  semantic state behavior and the VoiceOver toast lifetime policy. Source review
  confirms labels, values and traits on the reusable controls, accessibility-size
  layout adaptations and the reduced-motion toast transition.
- The Showcase typography gallery was manually reviewed in Light/Dark with elevated
  Dynamic Type after the official font replacement. Maximum accessibility sizes and
  the complete interactive accessibility matrix remain pending manual sign-off.
- A controlled manual visual-regression strategy now covers Aurora, Horizon and
  Midnight Gold in Light/Dark. Candidate baseline review remains pending.
- Complete Showcase UI tests are deferred to a future version. No automated Showcase
  UI-test coverage is claimed for 1.0.
- The CI workflow selects the official `xcode-27` runner. Its current image provides
  Xcode 27.x and the iPhone 17 simulator required by the workflow; remote success
  must still be verified on the exact candidate SHA.
- The release-candidate preparation pass on 11 November 2026 built the FormaDS
  scheme successfully for testing and executed all 117 package tests: 117 passed,
  zero failed, skipped, expected failures or tests not run. Xcode reported no build
  errors. The candidate SHA has not yet been created, so this local result must be
  repeated or confirmed by CI after the candidate commit exists.

## Corrections made

- Added an unreleased changelog without claiming a stable version.
- Made CI resilient to Xcode 27 patch updates by relying on the explicitly selected
  `xcode-27` runner image and verifying its active toolchain.
- Removed the exact simulator OS patch from the CI destination so compatible runtime
  updates do not break validation.
- Updated the release checklist with completed documentation and API-review evidence.
- Replaced the former proprietary licensing model with MIT and retained the separate
  OFL-1.1 notices and provenance records for Sora and Manrope.
- Documented the controlled visual baseline, the exact accessibility evidence and
  manual gaps, and the decision to defer complete Showcase UI tests.

## Release blockers

| Priority | Item | Required action |
|---|---|---|
| High | Ownership confirmation pending | Confirm that all original FormaDS contributions can lawfully be released by Nuno Domingues under MIT and are not subject to employer/client rights. |
| Resolved | Font binary provenance | All seven TTF files were replaced from pinned official static upstream distributions; PostScript names, notices and hashes are recorded in the asset audit. |
| High | Candidate CI result pending | Merge the readiness changes and confirm CI on the exact candidate commit. |
| High | Release approval pending | Record the candidate SHA and obtain explicit owner approval before tagging. |
| High | Manual accessibility sign-off pending | Validate VoiceOver, maximum Dynamic Type, Reduce Motion and touch targets on the candidate. |
| Medium | Candidate visual baseline pending | Run and retain the controlled manual matrix documented in `VISUAL_REGRESSION.md`. |
| Accepted for 1.0 | Complete Showcase UI tests deferred | Add an XCUI test target in a future version; do not claim automated UI coverage for 1.0. |

## Non-blocking observations

- The package runtime defaults are localized. Some extracted Showcase demonstration
  strings rely on source-language fallback; they do not affect package-owned defaults
  and should be reviewed as Showcase content rather than changed automatically.
- The command-line Showcase build in the assistant sandbox could not access the user's
  SwiftPM/CoreSimulator caches. A clean build succeeded through Xcode during this
  release-preparation pass; candidate CI must still provide the definitive clean
  automated-environment result.

## Prohibited until the gates close

Do not create a `1.0.0` tag, GitHub release or stable-version claim until all high
priority blockers above are closed and the repository owner explicitly approves the
release.
