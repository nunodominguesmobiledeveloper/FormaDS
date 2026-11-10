//
//  DSCard.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import SwiftUI

// MARK: - Design System Card
public struct DSCard<Content: View> : View {
    
    // MARK: - Properties
    public let style: DSCardStyle
    private let content: Content
    
    // MARK: - Initialization
    public init(
            style: DSCardStyle = .standard,
            @ViewBuilder content: () -> Content
    ) {
        self.style = style
        self.content = content()
    }
    
    
    // MARK: - Body
    public var body: some View {
        content
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .padding(DS.Sizes.Card.contentPadding)
            .background(
                style.backgroundColor,
                in: RoundedRectangle(
                    cornerRadius: DS.Radius.card,
                    style: .continuous
                )
            )
            .overlay {
                RoundedRectangle(
                    cornerRadius: DS.Radius.card,
                    style: .continuous
                )
                .strokeBorder(
                    style.borderColor,
                    lineWidth: DS.Sizes.Card.borderWidth
                )
            }
    }
}

// MARK: - Previews

#Preview("DSCard — Light") {
    VStack(spacing: DS.Layout.contentSpacing) {
        ForEach(DSCardStyle.allCases, id: \.self) { style in
            DSCard(style: style) {
                VStack(
                    alignment: .leading,
                    spacing: DS.Layout.compactSpacing
                ) {
                    Text(style.rawValue.capitalized)
                        .font(DS.Typography.heading)

                    Text("FormaDS reusable card")
                        .font(DS.Typography.body)
                }
                .foregroundStyle(DS.Colors.textPrimary)
            }
        }
    }
    .dsScreenPadding()
    .frame(maxHeight: .infinity)
    .background {
        DSBackground()
            .ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("DSCard — Dark") {
    VStack(spacing: DS.Layout.contentSpacing) {
        ForEach(DSCardStyle.allCases, id: \.self) { style in
            DSCard(style: style) {
                VStack(
                    alignment: .leading,
                    spacing: DS.Layout.compactSpacing
                ) {
                    Text(style.rawValue.capitalized)
                        .font(DS.Typography.heading)

                    Text("FormaDS reusable card")
                        .font(DS.Typography.body)
                }
                .foregroundStyle(DS.Colors.textPrimary)
            }
        }
    }
    .dsScreenPadding()
    .frame(maxHeight: .infinity)
    .background {
        DSBackground()
            .ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("DSCard — Accessibility") {
    DSCard {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.itemSpacing
        ) {
            Text("Cartão com texto acessível")
                .font(DS.Typography.heading)

            Text(
                "Este conteúdo deverá adaptar-se a tamanhos de texto maiores."
            )
            .font(DS.Typography.body)
        }
        .foregroundStyle(DS.Colors.textPrimary)
    }
    .dsScreenPadding()
    .background {
        DSBackground()
            .ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.accessibility3)
}
