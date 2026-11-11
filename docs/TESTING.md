# Testing and accessibility

## Current automated coverage

The `FormaDSTests` target contains 117 XCTest tests. The latest Phase 14.4 run passed all 117 tests and reported 33% line coverage in Xcode. Coverage is evidence, not a release threshold.

Tests cover semantic tokens, theme resolution, contrast contracts, backgrounds, typography, metrics, public API smoke tests, English/Portuguese defaults, progress normalization, chart scale behavior, toast presentation policy and component model contracts.

## Running locally

In Xcode, select the `FormaDS` scheme and an iOS simulator, then choose **Product → Test** (`⌘U`). The Test Navigator (`⌘6`) and Report Navigator (`⌘9`) retain results.

The Showcase has no dedicated UI-test target. Its key interactive and accessibility flows therefore remain manual checks. Complete Showcase UI tests are explicitly deferred to a future version; FormaDS 1.0 does not claim automated end-to-end UI coverage.

## CI

`.github/workflows/ci.yml` runs package tests with code coverage and builds `FormaDSShowcase` without code signing. CI uses an explicit Xcode 27 runner/toolchain selection. Confirm the workflow result on every pull request; do not infer remote success from local tests.

## Manual matrix

- Aurora, Horizon and Midnight Gold in Light/Dark.
- VoiceOver names, values, reading order, toast lifetime and focus after presentation.
- Maximum Dynamic Type with long English and Portuguese text.
- Reduce Motion for toast and progress/chart transitions.
- Touch targets, disabled states and information not conveyed by color alone.
- Translucent-surface contrast over the actual themed backgrounds.

## Accessibility evidence for the 1.0 candidate

Automated package tests protect concrete contracts including localized accessibility
descriptions, clamped progress values, semantic state colors and the rule that a
toast does not dismiss automatically while VoiceOver is enabled. Source inspection
also confirms accessibility labels/values/traits across interactive controls,
adaptive layouts for accessibility Dynamic Type sizes, and a reduced-motion toast
transition.

The Showcase typography gallery was manually reviewed in Light and Dark with an
elevated Dynamic Type size after the official font replacement, without observed
font fallback, clipping or layout regression. This is useful evidence, but it is not
a complete maximum-size Dynamic Type sign-off.

The following remain manual release checks and must not be inferred from unit tests:

- VoiceOver reading order, pronunciation, focus movement and real interaction.
- Maximum accessibility Dynamic Type across representative long EN and pt-PT content.
- Reduce Motion behavior in the running Showcase, including dynamic feedback and charts.
- Effective 44 by 44 point touch areas and spacing between adjacent controls.
- Contrast on translucent surfaces over the final rendered backgrounds.

## Visual regression

No snapshot dependency or automated baseline set exists. The controlled manual
strategy, required six-combination matrix and review rules are documented in
[VISUAL_REGRESSION.md](VISUAL_REGRESSION.md).
