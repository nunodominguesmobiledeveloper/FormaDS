# FormaDS

FormaDS is a reusable SwiftUI design system distributed as a Swift Package. It provides semantic foundations, three themes, reusable components, localized defaults and accessibility behavior without depending on application business logic.

## Requirements

- iOS 17 or later
- Swift tools 6.4
- SwiftUI and Swift Package Manager
- Xcode 27 was used for the latest repository validation

The package product and import name are both `FormaDS`.

## Installation

### Local package

In Xcode, choose **File → Add Package Dependencies… → Add Local…**, select the directory containing `Package.swift`, and add the `FormaDS` product to the application target.

### Git dependency

Use this repository URL in Xcode after an approved version tag is available. No stable release tag is documented yet, so production consumers should not assume a `1.0.0` release exists.

## Getting started

```swift
import SwiftUI
import FormaDS

struct ExampleView: View {
    var body: some View {
        DSCard {
            VStack(alignment: .leading, spacing: DS.Spacing.regular) {
                Text("Welcome")
                    .font(DS.Typography.heading)
                    .foregroundStyle(DS.Colors.textPrimary)

                DSButton("Continue") {
                    // App-owned action
                }
            }
        }
        .dsScreenPadding()
        .background {
            DSBackground().ignoresSafeArea()
        }
        .dsTheme(.aurora)
    }
}
```

Change the theme without changing component implementations:

```swift
content
    .dsTheme(.horizon)

content
    .dsTheme(.midnightGold)
```

The consuming app owns screen titles, feature copy, navigation destinations, persistence and business rules. FormaDS owns reusable visual behavior and generic localized defaults.

## Included themes

- `DSTheme.aurora`
- `DSTheme.horizon`
- `DSTheme.midnightGold`

Each theme resolves semantic colors, effects and backgrounds independently for Light and Dark appearances.

## Localization

FormaDS supports English (`en`) and European Portuguese (`pt-PT`). Package-owned defaults are stored in `Sources/FormaDS/Resources/Localizable.xcstrings`; Showcase strings are stored separately in `Showcase/FormaDSShowcase/FormaDSShowcase/Localizable.xcstrings`.

Public text parameters use `LocalizedStringResource` where localization ownership matters. Consumer-supplied resources retain their own localization context, while omitted component defaults resolve from the FormaDS resource bundle.

## Repository structure

```text
FormaDS/
├── Package.swift
├── Sources/FormaDS/
│   ├── Components/
│   ├── Foundations/
│   │   └── Backgrounds/
│   ├── Resources/
│   └── Themes/
├── Tests/FormaDSTests/
├── Showcase/FormaDSShowcase/
└── docs/
```

## Validation status

During the Phase 14.5 validation completed on 11 November 2026, the package built with no warnings, all 117 package tests passed, and the Showcase built and ran on a physical device. The repository has CI for package tests and a Showcase build; a dedicated Showcase UI-test target and snapshot-test infrastructure are not currently present.

## Documentation

- [Architecture](docs/ARCHITECTURE.md)
- [Components and public APIs](docs/COMPONENTS.md)
- [Theming](docs/THEMING.md)
- [Localization](docs/LOCALIZATION.md)
- [Testing](docs/TESTING.md)
- [Consumer integration](docs/CONSUMER_INTEGRATION.md)
- [Release checklist](docs/RELEASE_CHECKLIST.md)

## License

No license file is currently present. Distribution terms require an explicit repository-owner decision before a public release.
