//
//  DSBadge.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 02/11/2026.
//

import SwiftUI

// MARK: - Design System Badge

public struct DSBadge: View {

    // MARK: - Properties

    public let title: LocalizedStringResource
    public let color: DSColorToken

    // MARK: - Initialization

    public init(
        _ title: LocalizedStringResource,
        color: DSColorToken = .accentPrimary
    ) {
        self.title = title
        self.color = color
    }

    // MARK: - Body

    public var body: some View {
        Text(title)
            .font(DS.Typography.caption)
            .foregroundStyle(color)
            .padding(
                .horizontal,
                DS.Sizes.Indicators.Badge.horizontalPadding
            )
            .padding(
                .vertical,
                DS.Sizes.Indicators.Badge.verticalPadding
            )
            .background(
                DS.Colors.surfaceElevated,
                in: Capsule()
            )
            .accessibilityLabel(title)
    }
}

// MARK: - Previews

#Preview("Badges — Light") {
    DSBadgePreview()
        .preferredColorScheme(.light)
}

#Preview("Badges — Dark") {
    DSBadgePreview()
        .preferredColorScheme(.dark)
}

private struct DSBadgePreview: View {

    var body: some View {
        VStack(spacing: DS.Layout.contentSpacing) {
            DSBadge("Em atraso", color: .stateError)
            DSBadge("Concluído", color: .stateSuccess)
            DSBadge("Em curso", color: .accentPrimary)
            DSBadge("Importante", color: .stateWarning)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            DSBackground().ignoresSafeArea()
        }
        .dsTheme(.aurora)
    }
}
