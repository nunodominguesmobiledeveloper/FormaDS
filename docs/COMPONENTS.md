# Components and public API

All component text parameters shown below use `LocalizedStringResource` unless the signature says `String`. Optional parameters and defaults match the current Swift source. Components inherit `DSTheme` and `ColorScheme` from the SwiftUI environment.

## Buttons

### `DSButton`

```swift
DSButton(
    _ title: LocalizedStringResource,
    icon: DSIconToken? = nil,
    variant: DSButtonVariant = .primary,
    size: DSButtonSize = .regular,
    action: @escaping () -> Void
)
```

Variants are `.primary` and `.secondary`; sizes are `.regular` and `.small`.

```swift
DSButton("Save", icon: .check) {
    // Consumer-owned action
}
```

### `DSIconButton`

```swift
DSIconButton(
    _ icon: DSIconToken,
    accessibilityLabel: LocalizedStringResource,
    variant: DSButtonVariant = .secondary,
    action: @escaping () -> Void
)
```

The accessibility label is required because the visual control contains only an icon.

## Cards and layout

### `DSCard`

```swift
DSCard(
    style: DSCardStyle = .standard,
    @ViewBuilder content: () -> Content
)
```

Styles are `.standard`, `.elevated` and `.selected`.

### `DSRow`

The full initializer accepts `leading`, `content` and `trailing` builders. Public overloads also support leading + content, content + trailing, or content only.

```swift
DSRow(
    @ViewBuilder leading: () -> Leading,
    @ViewBuilder content: () -> Content,
    @ViewBuilder trailing: () -> Trailing
)
```

```swift
DSRow {
    DSIconTile(.calendar)
} content: {
    Text("Meeting")
} trailing: {
    DSIcon(.forward)
}
```

### `DSSectionHeader`

```swift
DSSectionHeader(
    title: LocalizedStringResource,
    subtitle: LocalizedStringResource? = nil,
    actionTitle: LocalizedStringResource? = nil,
    action: (() -> Void)? = nil
)
```

The action is only presented when both `actionTitle` and `action` are supplied.

### `DSIconTile`

```swift
DSIconTile(
    _ icon: DSIconToken,
    color: DSColorToken = .accentPrimary
)
```

`DSIconTile` is presentational; wrap it in a `Button` when it performs an action.

## Selection controls

### `DSChip`

```swift
DSChip(
    _ title: LocalizedStringResource,
    isSelected: Bool,
    action: @escaping () -> Void
)
```

The consumer owns selection state and updates it in `action`.

### `DSCheckbox`

```swift
DSCheckbox(
    _ title: LocalizedStringResource,
    isChecked: Binding<Bool>,
    selectedAccessibilityValue: LocalizedStringResource? = nil,
    notSelectedAccessibilityValue: LocalizedStringResource? = nil
)
```

Omitted accessibility values use FormaDS-localized defaults.

### `DSToggle`

```swift
DSToggle(
    _ title: LocalizedStringResource,
    subtitle: LocalizedStringResource? = nil,
    isOn: Binding<Bool>
)
```

### `DSSegmentedControl` and `DSSelectionOption`

```swift
DSSelectionOption(
    value: Value,
    title: LocalizedStringResource
)

DSSegmentedControl(
    options: [DSSelectionOption<Value>],
    selection: Binding<Value>
)
```

`Value` must conform to `Hashable & Sendable`.

```swift
enum Filter: Hashable, Sendable { case all, favorites }

@State private var filter = Filter.all

DSSegmentedControl(
    options: [
        .init(value: .all, title: "All"),
        .init(value: .favorites, title: "Favorites")
    ],
    selection: $filter
)
```

## Forms

### `DSTextField`

```swift
DSTextField(
    title: LocalizedStringResource,
    placeholder: LocalizedStringResource,
    text: Binding<String>,
    helperText: LocalizedStringResource? = nil,
    errorMessage: LocalizedStringResource? = nil
)
```

### `DSTextEditor`

```swift
DSTextEditor(
    title: LocalizedStringResource,
    placeholder: LocalizedStringResource,
    text: Binding<String>,
    helperText: LocalizedStringResource? = nil,
    errorMessage: LocalizedStringResource? = nil
)
```

For both controls, a non-`nil` `errorMessage` activates the error state.

### `DSSearchField`

```swift
DSSearchField(
    placeholder: LocalizedStringResource? = nil,
    clearAccessibilityLabel: LocalizedStringResource? = nil,
    text: Binding<String>
)
```

Omitted strings use localized package defaults.

### Form primitives

```swift
DSFormFieldLabel(
    title: LocalizedStringResource,
    helperText: LocalizedStringResource? = nil,
    errorMessage: LocalizedStringResource? = nil
)

DSFormFieldSurface(
    state: DSFormFieldState = .normal,
    isFocused: Bool = false,
    cornerRadius: CGFloat = DS.Sizes.TextField.cornerRadius,
    minimumHeight: CGFloat = DS.Sizes.TextField.minimumHeight,
    @ViewBuilder content: () -> Content
)
```

`DSFormFieldState` is `.normal` or `.error`. These are public composition primitives; most consumers should start with the higher-level fields above.

## Indicators and charts

### `DSProgressBar` and `DSProgressRing`

Both use the same initializer shape:

```swift
DSProgressBar(
    progress: Double,
    color: DSColorToken = .accentPrimary,
    accessibilityTitle: String? = nil
)

DSProgressRing(
    progress: Double,
    color: DSColorToken = .accentPrimary,
    accessibilityTitle: String? = nil
)
```

Rendered progress is normalized to `0...1`; negative, non-finite and over-range values render as defined by `DSProgressNormalization` (negative/non-finite → `0`, values above one → `1`).

### `DSProgressItem` and `DSConcentricProgressRing`

```swift
DSProgressItem(
    id: String,
    title: LocalizedStringResource,
    detail: LocalizedStringResource,
    value: Double,
    color: DSColorToken
)

DSConcentricProgressRing(
    items: [DSProgressItem],
    @ViewBuilder center: () -> Center
)
```

`DSProgressItem.displayProgress` is normalized; `percentage` exposes the original value multiplied by 100.

### `DSBadge`

```swift
DSBadge(
    _ title: LocalizedStringResource,
    color: DSColorToken = .accentPrimary
)
```

### `DSStatCard`

```swift
DSStatCard(
    title: LocalizedStringResource,
    value: LocalizedStringResource,
    detail: LocalizedStringResource? = nil,
    color: DSColorToken = .accentPrimary
)
```

### `DSBarChartItem` and `DSBarChart`

```swift
DSBarChartItem(
    id: String,
    label: LocalizedStringResource,
    value: Double,
    isHighlighted: Bool = false
)

DSBarChart(
    items: [DSBarChartItem],
    accessibilityTitle: String? = nil
)
```

Chart item values must be finite and non-negative; violating this contract triggers a precondition. Empty collections are supported. The chart groups its bars into a single accessibility element and uses `accessibilityTitle` when supplied.

## Navigation

### `DSTabBar`

```swift
DSTabBar(
    selection: Binding<Selection>,
    @ViewBuilder content: () -> Content
)
```

`Selection` must be `Hashable`. Supply ordinary SwiftUI tab content and tags; FormaDS applies semantic tab-bar styling.

## Feedback and presentation

### `DSBottomSheet`

```swift
DSBottomSheet(
    title: LocalizedStringResource,
    actionTitle: LocalizedStringResource? = nil,
    cancelTitle: LocalizedStringResource? = nil,
    onCancel: @escaping () -> Void,
    onAction: (() -> Void)? = nil,
    @ViewBuilder content: () -> Content
)
```

The action button requires both `actionTitle` and `onAction`. The cancel button is always shown; omitting `cancelTitle` uses the FormaDS-localized default.

```swift
.sheet(isPresented: $isPresented) {
    DSBottomSheet(
        title: "New item",
        actionTitle: "Save",
        cancelTitle: "Cancel",
        onCancel: { isPresented = false },
        onAction: { save() }
    ) {
        Text("Sheet content")
    }
}
```

### `DSEmptyState`

```swift
DSEmptyState(
    icon: DSIconToken,
    title: LocalizedStringResource,
    message: LocalizedStringResource,
    actionTitle: LocalizedStringResource? = nil,
    action: (() -> Void)? = nil
)
```

The action is shown only when its title and callback both exist.

### Confirmation dialog

`DSConfirmationDialogModifier` is internal. Consumers use the public view extension:

```swift
view.dsConfirmationDialog(
    isPresented: Binding<Bool>,
    title: LocalizedStringResource,
    message: LocalizedStringResource,
    destructiveTitle: LocalizedStringResource,
    cancelTitle: LocalizedStringResource? = nil,
    onConfirm: @escaping () -> Void
)
```

The omitted cancel title uses the FormaDS-localized default. Presentation uses SwiftUI's native confirmation dialog and destructive/cancel roles.

### Toast

```swift
DSToastData(
    id: UUID = UUID(),
    message: LocalizedStringResource,
    style: DSToastStyle = .information,
    actionTitle: LocalizedStringResource? = nil
)

view.dsToast(
    toast: Binding<DSToastData?>,
    duration: TimeInterval = 4,
    onAction: ((DSToastData) -> Void)? = nil
)
```

Styles are `.success`, `.error` and `.information`. A duration at or below zero disables automatic dismissal. VoiceOver also keeps the toast visible. The action is presented only when the data has an `actionTitle` and the modifier receives `onAction`. Replacing the bound toast cancels the previous dismissal task.

`DSToast` itself is also public for direct composition:

```swift
DSToast(
    data: DSToastData,
    dismissAccessibilityLabel: LocalizedStringResource? = nil,
    actionAccessibilityHint: LocalizedStringResource? = nil,
    onDismiss: @escaping () -> Void,
    onAction: (() -> Void)? = nil
)
```

## Foundations and modifiers

- `DSBackground()` renders the active theme; `DSAuroraBackground()` fixes Aurora.
- `DSIcon(_ token: DSIconToken, size: DSIconSize = .regular)` renders a decorative SF Symbol; sizes are `.small`, `.regular`, `.large`.
- `View.dsTheme(_:)` injects a `DSTheme`.
- `View.dsScreenPadding()` applies the semantic horizontal screen inset.
- `View.dsShadow(_:)` resolves a `DSShadowToken` from the active theme.
- `DSColorValue(hex:alpha:)` requires `#RRGGBB` and `alpha` in `0...1`.
- `DSGradientValue` requires a finite angle.
- `DSShadowValue` requires a finite, non-negative radius and finite offsets.
- `DSFontRegistry.registerFonts()` registers packaged fonts and returns whether registration succeeded.

## Showcase and tests

The Showcase contains galleries for foundations, backgrounds, effects, cards, themes, buttons/selection, forms, indicators, navigation and feedback. Package tests protect model contracts, tokens, themes, localization, accessibility descriptions, progress/chart behavior and toast policy. Interactive end-to-end flows remain candidates for a future Showcase UI-test target.
