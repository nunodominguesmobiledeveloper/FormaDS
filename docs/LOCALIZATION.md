# Localization contract

## Ownership

- FormaDS: generic component defaults and component-generated accessibility descriptions.
- FormaDSShowcase: gallery titles, demo data, sample messages and navigation labels.
- Consumer app: feature copy, screen titles, domain validation and business actions.

FormaDS and the Showcase each have a `Localizable.xcstrings` catalog with English (`en`) and European Portuguese (`pt-PT`). Package defaults resolve through `Bundle.module` and do not rely on the consumer's catalog.

## Public text types

Component titles, labels and placeholders generally use `LocalizedStringResource`. This lets a consumer supply a literal or a resource owned by its own module. Do not convert consumer resources into package keys.

Several optional parameters use `nil` to request a package-localized default:

- `DSSearchField.placeholder`
- `DSSearchField.clearAccessibilityLabel`
- `DSCheckbox.selectedAccessibilityValue`
- `DSCheckbox.notSelectedAccessibilityValue`
- `DSConfirmationDialog.cancelTitle`
- `DSToast.dismissAccessibilityLabel`
- `DSToast.actionAccessibilityHint`

Example:

```swift
DSSearchField(text: $query) // FormaDS-localized placeholder and clear label

DSSearchField(
    placeholder: "Filter projects",
    clearAccessibilityLabel: "Clear project filter",
    text: $query
)
```

## Verified coverage

Package tests verify the English and `pt-PT` defaults and confirm consumer overrides remain available. The Showcase catalog is a separate target resource. Manual verification is still appropriate for full-screen language changes and VoiceOver pronunciation.
