# Theming

## Built-in themes

| Theme | Public value | Appearances |
|---|---|---|
| Aurora | `DSTheme.aurora` | Light / Dark |
| Horizon | `DSTheme.horizon` | Light / Dark |
| Midnight Gold | `DSTheme.midnightGold` | Light / Dark |

Apply a theme at the screen or application boundary:

```swift
RootView()
    .dsTheme(.aurora)
```

Descendants inherit it through `EnvironmentValues.dsTheme`. Without an explicit modifier, the environment default is Aurora.

## Semantic tokens

`DSColorToken` contains background, text, surface, border, accent, state, action-text, progress and map roles. Use tokens through `DS.Colors`, for example:

```swift
Text("Summary")
    .foregroundStyle(DS.Colors.textPrimary)
    .padding(DS.Spacing.regular)
    .background(DS.Colors.surfaceCard)
```

Effects resolve through `DS.Gradients.primaryAction`, `.dsShadow(.primaryAction)` and the selected theme. `DSBackground()` uses the active theme's background specification; `DSAuroraBackground()` is a convenience view that intentionally fixes Aurora.

## Custom themes

`DSTheme` is public and can be constructed from complete Light/Dark `DSThemePalette` values, `DSEffectsPalette` values and `DSBackgroundValue` specifications. `DSThemePalette` requires a value for every `DSColorToken`; an incomplete palette fails its precondition.

## Validation

Automated tests verify all semantic colors resolve for all three themes in Light/Dark, validate effect values, and check selected text/action contrast contracts. Translucent surfaces and background composition still require visual validation on the actual rendered screen.
