# Independent consumer integration validation — Phase 14.7

## Purpose

The Showcase consumes the package but lives in the same repository. Before a 1.0 release, create an independent SwiftUI application that imports only `SwiftUI` and public `FormaDS` APIs.

## Required fixture

Use iOS 17 or later and add the local package first. The fixture should demonstrate:

1. `DSTheme.aurora`, `.horizon` and `.midnightGold` without changing component code.
2. Light and Dark appearances for each theme.
3. `DSCard`, `DSButton`, `DSTextField`, progress and feedback components.
4. FormaDS-localized defaults in `en` and `pt-PT`.
5. Consumer-owned `LocalizedStringResource` overrides.
6. State changes, a sheet or confirmation dialog, and toast presentation.

Representative setup:

```swift
import SwiftUI
import FormaDS

struct ConsumerRootView: View {
    @State private var name = ""

    var body: some View {
        DSCard {
            DSTextField(
                title: "Name",
                placeholder: "Enter a name",
                text: $name
            )
        }
        .dsScreenPadding()
        .background { DSBackground().ignoresSafeArea() }
        .dsTheme(.aurora)
    }
}
```

## Acceptance evidence

Validation completed on 11 November 2026.

The fixture was clean-built and launched again during the MIT release-preparation
pass after the official font replacements. No package integration or launch
regression was reported. The detailed theme, appearance, localization and component
matrix below remains the recorded functional evidence.

- Consumer project: `Integration/FormaDSConsumerValidation/FormaDSConsumerValidation.xcodeproj`
- Target and scheme: `FormaDSConsumerValidation`
- Dependency: local `FormaDS` package product through the Xcode package dependency
- Xcode: 27.0 (build 27A266a)
- Runtime: iPhone 18 Pro simulator, iOS 27.0, device identifier
  `34A15112-B9B4-4904-82CB-AF8A16D9C026`
- Build invocation: Xcode Build action for the `FormaDSConsumerValidation` scheme
  with build-for-testing enabled; result succeeded with zero build errors
- Runtime invocation: Xcode install and run for the same scheme and destination;
  process launched without a crash or hang
- Imports: `SwiftUI` and public `FormaDS` only; no `@testable import`,
  Showcase types or source-path workaround

The fixture exercised `DSTheme`, `DSCard`, `DSButton`, `DSTextField`,
`DSProgressBar`, `DSToastData`, `DSBottomSheet`,
`dsConfirmationDialog`, `DSBackground`, `DSSectionHeader` and public
layout, color, typography and icon tokens. State mutation, text entry, scrolling,
sheet confirmation, destructive reset, toast presentation and toast undo all
completed successfully.

| Theme | Light | Dark |
|---|---|---|
| Aurora | [evidence](../Integration/FormaDSConsumerValidation/Evidence/phase-14.7/aurora-light-en.png) | [evidence](../Integration/FormaDSConsumerValidation/Evidence/phase-14.7/aurora-dark-en.png) |
| Horizon | [evidence](../Integration/FormaDSConsumerValidation/Evidence/phase-14.7/horizon-light-en.png) | [evidence](../Integration/FormaDSConsumerValidation/Evidence/phase-14.7/horizon-dark-en.png) |
| Midnight Gold | [evidence](../Integration/FormaDSConsumerValidation/Evidence/phase-14.7/midnight-gold-light-en.png) | [evidence](../Integration/FormaDSConsumerValidation/Evidence/phase-14.7/midnight-gold-dark-en.png) |

English and European Portuguese consumer-owned resources were verified at runtime.
A modifier-order defect initially left toast and confirmation-dialog presentations
outside the selected locale environment. Moving theme, appearance and locale to
wrap those presentation modifiers corrected the issue. The corrected runtime
evidence covers the [Portuguese toast](../Integration/FormaDSConsumerValidation/Evidence/phase-14.7/toast-pt.png),
[undo result](../Integration/FormaDSConsumerValidation/Evidence/phase-14.7/undo-pt.png)
and [Portuguese reset dialog](../Integration/FormaDSConsumerValidation/Evidence/phase-14.7/reset-dialog-pt.png).

No overlap, truncation, broken alignment, crash or hang was observed on the tested
simulator. Interactive controls exposed meaningful accessibility labels and selected
states in the captured hierarchy. This validation does not replace the separate
manual accessibility sign-off for maximum Dynamic Type, VoiceOver, Reduce Motion
and touch-target coverage.

Do not create a `1.0.0` tag until the remaining release gates are closed and the
repository owner approves the release.
