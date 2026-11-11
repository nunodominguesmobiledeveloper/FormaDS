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

Record the consumer repository/target, Xcode version, device or simulator, exact build command, screenshots for all six theme/appearance combinations, APIs exercised and localization results. The consumer must not use `@testable import`, Showcase types or source-path workarounds.

Do not create a `1.0.0` tag until this independent integration succeeds and the repository owner approves the release.
