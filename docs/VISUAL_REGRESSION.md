# Visual regression strategy

FormaDS 1.0 uses a controlled manual visual baseline. No image-comparison
dependency or automated snapshot suite is part of the release candidate.

## Required matrix

Review each representative screen in all six theme/appearance combinations:

| Theme | Light | Dark |
|---|---:|---:|
| Aurora | Required | Required |
| Horizon | Required | Required |
| Midnight Gold | Required | Required |

Run the matrix on one recorded iPhone simulator model and OS version. Keep the
device, orientation, locale, Dynamic Type size and demonstration data constant
within a comparison set. Repeat localization-sensitive screens in English and
European Portuguese.

## Representative coverage

- Foundations: colors, typography, spacing, radius, sizes, icons, gradients and shadows.
- Layout: backgrounds, cards, rows, section headers and icon tiles.
- Interaction: buttons, selection controls, text fields, text editor and search.
- Data: progress bars/rings, concentric progress, stats, badges and bar charts.
- Presentation: tab bar, bottom sheet, toast, confirmation dialog and empty state.
- Integration: the independent consumer fixture for theme inheritance, fonts and localized defaults.

For text-heavy and adaptive layouts, add one accessibility Dynamic Type capture.
The accessibility capture supplements the normal-size baseline; it does not replace
manual VoiceOver, Reduce Motion or touch-target review.

## Capture and review

1. Clean-build the Showcase at the candidate SHA and record Xcode, simulator and OS versions.
2. Capture the same screens with stable content and no transient cursor, keyboard or animation.
3. Name evidence with theme, appearance, locale and screen, for example
   `horizon-dark-pt-indicators.png`.
4. Compare alignment, clipping, typography/font fallback, semantic colors, contrast,
   state indicators, overlays and presentation layering against the last approved evidence.
5. Record each intentional difference in the pull request. Do not replace a baseline
   merely because the new output differs.
6. Store approved release evidence under an explicitly versioned evidence directory.

The Phase 14.7 screenshots under
`Integration/FormaDSConsumerValidation/Evidence/phase-14.7` remain integration
evidence for the six theme/appearance combinations. They are not a complete
component snapshot suite.

## Future automation

Automated component-level snapshots may be evaluated after 1.0 using controlled
device, OS, locale, appearance and Dynamic Type settings. The maintenance cost,
reference-image review process and CI stability must be agreed before adopting a
snapshot tool. Full Showcase UI tests are also deferred; no automated UI coverage
is claimed for 1.0.
