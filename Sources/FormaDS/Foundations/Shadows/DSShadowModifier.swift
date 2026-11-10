//
//  DSShadowModifier.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import SwiftUI

// MARK: - Design System Shadow Modifier

struct DSShadowModifier: ViewModifier {

    // MARK: - Environment

    @Environment(\.dsTheme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    // MARK: - Properties

    let token: DSShadowToken

    // MARK: - Initialization

    init(
        token: DSShadowToken
    ) {
        self.token = token
    }

    // MARK: - Body

    func body(
        content: Content
    ) -> some View {
        let shadow = theme.shadow(
            for: token,
            appearance: colorScheme
        )

        content.shadow(
            color: shadow.color.color,
            radius: shadow.radius,
            x: shadow.x,
            y: shadow.y
        )
    }
}

// MARK: - View Extension

public extension View {

    func dsShadow(
        _ token: DSShadowToken
    ) -> some View {
        modifier(
            DSShadowModifier(token: token)
        )
    }
}

// MARK: - Previews

#Preview("Primary Shadow — Light") {
    Capsule()
        .fill(DS.Gradients.primaryAction)
        .frame(height: DS.Sizes.Button.height)
        .dsShadow(.primaryAction)
        .padding(DS.Spacing.xLarge)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DS.Colors.backgroundPrimary)
        .dsTheme(.aurora)
        .preferredColorScheme(.light)
}

#Preview("Primary Shadow — Dark") {
    Capsule()
        .fill(DS.Gradients.primaryAction)
        .frame(height: DS.Sizes.Button.height)
        .dsShadow(.primaryAction)
        .padding(DS.Spacing.xLarge)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DS.Colors.backgroundPrimary)
        .dsTheme(.aurora)
        .preferredColorScheme(.dark)
}
