# Architecture and responsibilities

## Module boundaries

`FormaDS` is a Swift Package library. It owns semantic foundations, theme data, reusable SwiftUI components, package-localized defaults and generic accessibility behavior.

`FormaDSShowcase` is an independent consuming app. It owns galleries, navigation, sample data, demo state and Showcase-localized copy. FormaDS never imports Showcase code.

Consumer applications own domain models, persistence, services, business validation, feature navigation and feature-specific strings.

```text
Consumer application ──────→ FormaDS
FormaDSShowcase ────────────→ FormaDS
FormaDS ────────────────X──→ consumer or Showcase modules
```

## Source layout

1. `Foundations`: semantic colors, typography, spacing, radii, sizes, icons, gradients, shadows, layout and themed background rendering.
2. `Themes`: complete Light/Dark palettes, effects and background specifications.
3. `Components`: reusable views and modifiers composed from foundations and environment values.
4. `Resources`: fonts and the package String Catalog.
5. `Tests/FormaDSTests`: package contracts and regression tests.
6. `Showcase/FormaDSShowcase`: demonstrations and manual validation.

Background code is physically located at `Sources/FormaDS/Foundations/Backgrounds`, not in a root-level `Backgrounds` directory.

## Theme resolution

`View.dsTheme(_:)` writes a `DSTheme` to SwiftUI environment. Semantic tokens resolve against that theme and the current `ColorScheme`. Components request roles such as `.accentPrimary` and `.surfaceCard`; they do not branch on concrete theme identifiers.

## Localization

Public copy generally uses `LocalizedStringResource`. Component-owned fallbacks resolve from `Bundle.module`; consumer resources are displayed as supplied. Package and Showcase catalogs remain separate.

## Concurrency and presentation

Views use SwiftUI state and bindings. Toast automatic dismissal is driven by a cancellable `.task(id:)`; replacing a toast changes its identity and cancels the previous task. VoiceOver disables automatic dismissal, and Reduce Motion changes the transition behavior.

## Compatibility policy

The package is preparing for 1.0. Public names and initializers should remain source-compatible unless a separately documented migration is approved. Implementation-only helpers remain internal even when covered through `@testable` tests.
