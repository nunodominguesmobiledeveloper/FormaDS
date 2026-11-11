# FormaDS 1.0 release checklist

**Status: not released. This checklist does not authorize a tag or release.**

## Already evidenced

- [x] `Package.swift`: Swift tools 6.4, iOS 17+, `FormaDS` library product and processed resources.
- [x] Three themes provide Light/Dark semantic values.
- [x] Package and Showcase use separate `en` / `pt-PT` String Catalogs.
- [x] Package built without errors or warnings during Phase 14.6 validation.
- [x] 117 package tests passed during Phase 14.6 validation.
- [x] Showcase built and ran on a physical device during Phase 14.5 validation.
- [x] Initial GitHub Actions workflow exists.

## Required before 1.0

- [x] Documentation pull request reviewed and merged.
- [ ] CI succeeds on the release-candidate commit.
- [x] Independent consumer validation in `CONSUMER_INTEGRATION.md` succeeds.
- [ ] Showcase UI-test decision recorded; current target is absent.
- [ ] Manual VoiceOver, maximum Dynamic Type, Reduce Motion and touch-target review signed off.
- [ ] Visual-regression strategy approved or manual baseline evidence retained.
- [x] Public API inventory reviewed for source compatibility during Phases 14.2 and 14.5.
- [ ] License/distribution terms decided; no license file currently exists.
- [x] Changelog and pre-1.0 migration status prepared.
- [ ] Versioning policy and release repository URL confirmed.
- [ ] Release-candidate commit SHA recorded.
- [ ] Explicit owner approval obtained before creating `1.0.0`.

## Release record

- Candidate commit: TBD
- Tested Xcode: Xcode 27.0 (build 27A266a); reconfirm on candidate
- Tested device/simulator: physical device during Phase 14.5 and iOS simulator for package tests; record exact candidate matrix
- Package tests: 117 passed on 11 November 2026 (Phase 14.6 branch); rerun on candidate
- CI: workflow hardened for Xcode 27 patch/runtime updates; release-candidate run pending
- Independent consumer: Phase 14.7 passed on iPhone 18 Pro simulator with iOS 27.0
- Accessibility sign-off: pending final manual review
- Release approval: pending
