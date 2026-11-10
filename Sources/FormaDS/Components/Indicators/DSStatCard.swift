//
//  DSStat.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 02/11/2026.
//

import SwiftUI

// MARK: - Design System Stat Card

public struct DSStatCard: View {

    // MARK: - Properties

    public let title: LocalizedStringResource
    public let value: LocalizedStringResource
    public let detail: LocalizedStringResource?
    public let color: DSColorToken

    // MARK: - Initialization

    public init(
        title: LocalizedStringResource,
        value: LocalizedStringResource,
        detail: LocalizedStringResource? = nil,
        color: DSColorToken = .accentPrimary
    ) {
        self.title = title
        self.value = value
        self.detail = detail
        self.color = color
    }

    // MARK: - Body

    public var body: some View {
        DSCard {
            VStack(
                alignment: .leading,
                spacing: DS.Layout.itemSpacing
            ) {
                Text(title)
                    .font(DS.Typography.caption)
                    .foregroundStyle(DS.Colors.textSecondary)

                Text(value)
                    .font(DS.Typography.displayNumber)
                    .foregroundStyle(color)
                    .minimumScaleFactor(0.8)
                    .lineLimit(1)

                if let detail {
                    Text(detail)
                        .font(DS.Typography.subtitle)
                        .foregroundStyle(DS.Colors.textSecondary)
                        .fixedSize(
                            horizontal: false,
                            vertical: true
                        )
                }
            }
        }
        .accessibilityElement(children: .combine)
    }
}

// MARK: - Previews

private struct DSStatCardPreview: View {

    var body: some View {
        VStack(spacing: DS.Layout.contentSpacing) {
            DSStatCard(
                title: "Tasks done",
                value: "12",
                detail: "This week"
            )

            DSStatCard(
                title: "Habit consistency",
                value: "80%",
                detail: "4 active habits",
                color: .accentSecondary
            )

            DSStatCard(
                title: "Focus time",
                value: "2h 30m",
                color: .accentTertiary
            )
        }
        .dsScreenPadding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            DSBackground().ignoresSafeArea()
        }
        .dsTheme(.aurora)
    }
}

#Preview("Stat Cards — Light") {
    DSStatCardPreview()
        .preferredColorScheme(.light)
}

#Preview("Stat Cards — Dark") {
    DSStatCardPreview()
        .preferredColorScheme(.dark)
}

#Preview("Stat Cards — Accessibility") {
    DSStatCardPreview()
        .preferredColorScheme(.dark)
        .dynamicTypeSize(.accessibility3)
}
