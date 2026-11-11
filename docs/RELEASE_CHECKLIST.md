# FormaDS 1.0 release checklist

**Status: not released. This checklist does not authorize a tag or release.**

## Already evidenced

- [x] `Package.swift`: Swift tools 6.4, iOS 17+, `FormaDS` library product and processed resources.
- [x] Three themes provide Light/Dark semantic values.
- [x] Package and Showcase use separate `en` / `pt-PT` String Catalogs.
- [x] Package built without errors or warnings during Phase 14.4.
- [x] 117 package tests passed during Phase 14.4.
- [x] Showcase built and ran on a physical device during Phase 14.5 validation.
- [x] Initial GitHub Actions workflow exists.

## Required before 1.0

- [ ] Documentation pull request reviewed and merged.
- [ ] CI succeeds on the release-candidate commit.
- [ ] Independent consumer validation in `CONSUMER_INTEGRATION.md` succeeds.
- [ ] Showcase UI-test decision recorded; current target is absent.
- [ ] Manual VoiceOver, maximum Dynamic Type, Reduce Motion and touch-target review signed off.
- [ ] Visual-regression strategy approved or manual baseline evidence retained.
- [ ] Public API inventory reviewed for source compatibility.
- [ ] License/distribution terms decided; no license file currently exists.
- [ ] Changelog and migration notes prepared.
- [ ] Versioning policy and release repository URL confirmed.
- [ ] Release-candidate commit SHA recorded.
- [ ] Explicit owner approval obtained before creating `1.0.0`.

## Release record

- Candidate commit: TBD
- Tested Xcode: Xcode 27 locally; reconfirm on candidate
- Tested device/simulator: physical device during Phase 14.5 and iOS simulator for package tests; record exact candidate matrix
- Package tests: 117 passed on 11 November 2026; rerun on candidate
- CI: pending documentation-branch run
- Independent consumer: pending Phase 14.7
- Accessibility sign-off: pending final manual review
- Release approval: pending
