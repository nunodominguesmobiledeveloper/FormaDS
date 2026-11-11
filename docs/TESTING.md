# Testing and accessibility

## Current automated coverage

The `FormaDSTests` target contains 117 XCTest tests. The latest Phase 14.4 run passed all 117 tests and reported 33% line coverage in Xcode. Coverage is evidence, not a release threshold.

Tests cover semantic tokens, theme resolution, contrast contracts, backgrounds, typography, metrics, public API smoke tests, English/Portuguese defaults, progress normalization, chart scale behavior, toast presentation policy and component model contracts.

## Running locally

In Xcode, select the `FormaDS` scheme and an iOS simulator, then choose **Product → Test** (`⌘U`). The Test Navigator (`⌘6`) and Report Navigator (`⌘9`) retain results.

The Showcase has no dedicated UI-test target. Its key interactive and accessibility flows therefore remain manual checks.

## CI

`.github/workflows/ci.yml` runs package tests with code coverage and builds `FormaDSShowcase` without code signing. CI uses an explicit Xcode 27 runner/toolchain selection. Confirm the workflow result on every pull request; do not infer remote success from local tests.

## Manual matrix

- Aurora, Horizon and Midnight Gold in Light/Dark.
- VoiceOver names, values, reading order, toast lifetime and focus after presentation.
- Maximum Dynamic Type with long English and Portuguese text.
- Reduce Motion for toast and progress/chart transitions.
- Touch targets, disabled states and information not conveyed by color alone.
- Translucent-surface contrast over the actual themed backgrounds.

## Visual regression

No snapshot dependency or approved baseline set exists. Until a stable device/OS/Xcode matrix is agreed, review representative component screenshots manually and do not accept new image baselines automatically.
