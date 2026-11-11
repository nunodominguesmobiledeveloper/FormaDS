# FormaDS 1.0 release checklist

**Status: not released. This checklist does not authorize a tag or release.**

## Already evidenced

- [x] `Package.swift`: Swift tools 6.4, iOS 17+, `FormaDS` library product and processed resources.
- [x] Three themes provide Light/Dark semantic values.
- [x] Package and Showcase use separate `en` / `pt-PT` String Catalogs.
- [x] Package built without errors or warnings during Phase 14.6 validation.
- [x] 117 package tests passed during Phase 14.6 validation.
- [x] Showcase built and ran on a physical device during Phase 14.5 validation.
- [x] Showcase Clean Build Folder and Build succeeded during MIT release preparation.
- [x] Independent consumer application clean-built and launched after the MIT and font-provenance updates.
- [x] Initial GitHub Actions workflow exists.
- [x] CI configuration uses the official `xcode-27` runner, whose installed Xcode toolchain satisfies Swift tools 6.4 and provides the selected iPhone 17 simulator.
- [x] FormaDS candidate-preparation build-for-testing succeeded locally on 11 November 2026.
- [x] All 117 package tests passed locally during candidate preparation with zero failures, skips or tests not run.

## Required before 1.0

- [x] Documentation pull request reviewed and merged.
- [ ] CI succeeds on the release-candidate commit.
- [x] Independent consumer validation in `CONSUMER_INTEGRATION.md` succeeds.
- [x] Showcase UI-test decision recorded: complete UI automation is deferred to a future version and no UI-test coverage is claimed for 1.0.
- [ ] Manual VoiceOver reading order, focus, pronunciation and interaction signed off.
- [ ] Maximum accessibility Dynamic Type with representative long EN/pt-PT content signed off.
- [ ] Reduce Motion behavior in the running Showcase signed off.
- [ ] Touch-target and adjacent-control spacing review signed off.
- [x] Controlled manual visual-regression strategy recorded for all three themes in Light/Dark.
- [ ] Release-candidate visual baseline reviewed and retained using the recorded strategy.
- [x] Public API inventory reviewed for source compatibility during Phases 14.2 and 14.5.
- [x] Standard MIT License added with `Copyright (c) 2026 Nuno Domingues`.
- [x] Proprietary Personal/Commercial terms, acceptance process, governing-law clause and commercial-license template removed.
- [ ] Formal ownership/title confirmation obtained from Nuno Domingues.
- [ ] Confirm all original FormaDS contributions can lawfully be released under MIT and are not subject to employer/client rights.
- [x] Every bundled Sora/Manrope TTF replaced from a pinned official static distribution, with matching OFL notices and hashes recorded in the asset audit.
- [x] Changelog and pre-1.0 migration status prepared.
- [x] Semantic Versioning policy and release repository URL documented.
- [ ] Release-candidate commit SHA recorded.
- [ ] Explicit owner approval obtained before creating `1.0.0`.

## Release record

- Candidate commit: TBD
- Tested Xcode: Xcode 27.0 (build 27A266a); reconfirm on candidate
- Tested device/simulator: physical device during Phase 14.5 and iOS simulator for package tests; record exact candidate matrix
- Package tests: 117 passed locally on 11 November 2026 during candidate preparation; confirm by CI on candidate SHA
- CI: workflow hardened for Xcode 27 patch/runtime updates; release-candidate run pending
- Independent consumer: Phase 14.7 passed on iPhone 18 Pro simulator with iOS 27.0
- Automated accessibility evidence: package contracts pass; source implementation reviewed
- Manual accessibility sign-off: VoiceOver, maximum Dynamic Type, Reduce Motion and touch targets pending
- Visual regression: controlled manual strategy recorded; candidate baseline review pending
- Showcase UI tests: deferred to a future version; no automated UI coverage claimed
- Release approval: pending
