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

In Xcode, choose **File → Add Package Dependencies…** and enter:

```text
https://github.com/nunodominguesmobiledeveloper/FormaDS.git
```

After the `1.0.0` tag is published, select **Up to Next Major Version** from `1.0.0`. No stable release tag exists yet, so production consumers should not assume that version is currently available.

The equivalent package manifest entry will be:

```swift
dependencies: [
    .package(
        url: "https://github.com/nunodominguesmobiledeveloper/FormaDS.git",
        from: "1.0.0"
    )
]
```

Add `.product(name: "FormaDS", package: "FormaDS")` to the consuming target dependencies.

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

During the MIT release-preparation validation on 11 November 2026, the package built successfully and all 117 package tests passed. Earlier repository validation also built and ran the Showcase and the independent consumer application. Candidate CI and a final clean installation check remain required before tagging `1.0.0`. The repository has CI for package tests and a Showcase build; a dedicated Showcase UI-test target and snapshot-test infrastructure are not currently present.

## Documentation

- [Architecture](docs/ARCHITECTURE.md)
- [Components and public APIs](docs/COMPONENTS.md)
- [Theming](docs/THEMING.md)
- [Localization](docs/LOCALIZATION.md)
- [Testing](docs/TESTING.md)
- [Visual regression strategy](docs/VISUAL_REGRESSION.md)
- [Consumer integration](docs/CONSUMER_INTEGRATION.md)
- [Release checklist](docs/RELEASE_CHECKLIST.md)
- [Release readiness audit](docs/RELEASE_READINESS.md)
- [Licensing overview](README_LICENSING.md)
- [Licensing policy](docs/LICENSING_POLICY.md)
- [Third-party and asset audit](docs/ASSET_LICENSE_AUDIT.md)
- [Publishing guidance](docs/PUBLISHING.md)
- [Changelog](CHANGELOG.md)

## License

FormaDS is open-source software available under the [MIT License](LICENSE). The license permits personal and commercial use, modification, distribution, sublicensing and sale, provided that the copyright and permission notices are preserved.

Sora and Manrope are third-party materials and remain under the SIL Open Font License 1.1 rather than MIT. See [Licensing](README_LICENSING.md), [Third-Party Notices](THIRD_PARTY_NOTICES.md) and `LICENSES/`.
