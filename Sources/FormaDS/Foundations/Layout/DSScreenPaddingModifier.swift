//
//  DSScreenPaddingModifier.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import SwiftUI

// MARK: - Screen Padding Modifier
public struct DSScreenPaddingModifier: ViewModifier {
    
    // MARK: - Body
    public func body(content: Content) -> some View {
        content
            .padding(
                .horizontal,
                DS.Layout.screenHorizontalPadding
            )
    }
}


// MARK: - View Extension
public extension View {
    func dsScreenPadding() -> some View {
        modifier(DSScreenPaddingModifier())
    }
}


// MARK: - Previews

#Preview("Screen Padding — Light") {
    VStack(spacing: DS.Layout.contentSpacing) {
        Text("Screen Content")
            .font(DS.Typography.heading)

        Text("Margins are applied through FormaDS.")
            .font(DS.Typography.body)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .dsScreenPadding()
    .background(DS.Colors.backgroundPrimary)
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Screen Padding — Dark") {
    VStack(spacing: DS.Layout.contentSpacing) {
        Text("Screen Content")
            .font(DS.Typography.heading)

        Text("Margins are applied through FormaDS.")
            .font(DS.Typography.body)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .dsScreenPadding()
    .background(DS.Colors.backgroundPrimary)
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}
