//
//  DSIconTile.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 28/10/2026.
//

import SwiftUI

// MARK: - Design System Icon Tile

public struct DSIconTile: View {

    // MARK: - Properties

    public let icon: DSIconToken
    public let color: DSColorToken

    // MARK: - Dynamic Type

    @ScaledMetric(relativeTo: .body)
    private var side = DS.Sizes.IconTile.side

    // MARK: - Initialization

    public init(
        _ icon: DSIconToken,
        color: DSColorToken = .accentPrimary
    ) {
        self.icon = icon
        self.color = color
    }

    // MARK: - Body

    public var body: some View {
        DSIcon(icon, size: .regular)
            .foregroundStyle(color)
            .frame(
                width: side,
                height: side
            )
            .background(
                DS.Colors.surfaceElevated,
                in: RoundedRectangle(
                    cornerRadius: DS.Sizes.IconTile.cornerRadius,
                    style: .continuous
                )
            )
            .accessibilityHidden(true)
    }
}

// MARK: - Previews

#Preview("Icon Tile — Light") {
    HStack(spacing: DS.Layout.contentSpacing) {
        DSIconTile(.tasks)

        DSIconTile(
            .calendar,
            color: .accentSecondary
        )

        DSIconTile(
            .completed,
            color: .stateSuccess
        )

        DSIconTile(
            .warning,
            color: .stateWarning
        )
    }
    .padding(DS.Spacing.large)
    .background {
        DSBackground()
            .ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Icon Tile — Dark") {
    HStack(spacing: DS.Layout.contentSpacing) {
        DSIconTile(.tasks)

        DSIconTile(
            .calendar,
            color: .accentSecondary
        )

        DSIconTile(
            .completed,
            color: .stateSuccess
        )
    }
    .padding(DS.Spacing.large)
    .background {
        DSBackground()
            .ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("Icon Tile — Accessibility") {
    DSIconTile(.calendar)
        .padding(DS.Spacing.large)
        .background {
            DSBackground()
                .ignoresSafeArea()
        }
        .dsTheme(.aurora)
        .preferredColorScheme(.dark)
        .dynamicTypeSize(.accessibility3)
}
