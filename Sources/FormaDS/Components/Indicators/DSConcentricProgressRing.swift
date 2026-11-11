//
//  DSConcentricProgressRing.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 02/11/2026.
//

import SwiftUI

enum DSConcentricProgressRingLayout {
    static let centerContentSide =
        DS.Sizes.Indicators.ConcentricRings.innerRadius * 2
        - DS.Sizes.Indicators.ConcentricRings.lineWidth
}

// MARK: - Concentric Progress Ring

public struct DSConcentricProgressRing<Center: View>: View {

    // MARK: - Properties

    public let items: [DSProgressItem]

    @Environment(\.locale) private var locale

    private let center: Center

    // MARK: - Initialization

    public init(
        items: [DSProgressItem],
        @ViewBuilder center: () -> Center
    ) {
        precondition(
            items.count <= 3,
            "DSConcentricProgressRing supports up to 3 items."
        )

        self.items = items
        self.center = center()
    }

    // MARK: - Body

    public var body: some View {
        ZStack {
            ForEach(
                Array(items.enumerated()),
                id: \.element.id
            ) { entry in
                ring(
                    entry.element,
                    radius: radius(for: entry.offset)
                )
            }

            center
                .frame(
                    maxWidth: DSConcentricProgressRingLayout.centerContentSide,
                    maxHeight: DSConcentricProgressRingLayout.centerContentSide
                )
        }
        .frame(
            width: DS.Sizes.Indicators.ConcentricRings.side,
            height: DS.Sizes.Indicators.ConcentricRings.side
        )
        .accessibilityElement(children: .combine)
        .accessibilityValue(accessibilitySummary)
    }

    // MARK: - Accessibility

    private var accessibilitySummary: String {
        items
            .map { $0.accessibilityDescription(locale: locale) }
            .formatted(.list(type: .and).locale(locale))
    }

    // MARK: - Radius Resolution

    private func radius(
        for index: Int
    ) -> CGFloat {
        switch index {
        case 0:
            return DS.Sizes.Indicators.ConcentricRings.outerRadius

        case 1:
            return DS.Sizes.Indicators.ConcentricRings.middleRadius

        default:
            return DS.Sizes.Indicators.ConcentricRings.innerRadius
        }
    }

    // MARK: - Ring

    private func ring(
        _ item: DSProgressItem,
        radius: CGFloat
    ) -> some View {
        let diameter = radius * 2

        return ZStack {
            Circle()
                .stroke(
                    DS.Colors.progressTrack,
                    lineWidth:
                        DS.Sizes.Indicators.ConcentricRings.lineWidth
                )

            Circle()
                .trim(
                    from: 0,
                    to: item.displayProgress
                )
                .stroke(
                    item.color,
                    style: StrokeStyle(
                        lineWidth:
                            DS.Sizes.Indicators.ConcentricRings.lineWidth,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
        }
        .frame(
            width: diameter,
            height: diameter
        )
        .accessibilityHidden(true)
    }
}

// MARK: - Preview Data

private enum DSConcentricPreviewData {

    static let items: [DSProgressItem] = [
        DSProgressItem(
            id: "tasks",
            title: "Tasks",
            detail: "6 of 8 done",
            value: 0.75,
            color: .accentPrimary
        ),
        DSProgressItem(
            id: "habits",
            title: "Habits",
            detail: "2 of 3 done",
            value: 2.0 / 3.0,
            color: .accentSecondary
        ),
        DSProgressItem(
            id: "budget",
            title: "Budget",
            detail: "56% used",
            value: 0.56,
            color: .accentTertiary
        )
    ]
}

// MARK: - Previews

#Preview("Concentric Rings — Light") {
    DSConcentricPreview()
        .preferredColorScheme(.light)
}

#Preview("Concentric Rings — Dark") {
    DSConcentricPreview()
        .preferredColorScheme(.dark)
}

private struct DSConcentricPreview: View {

    var body: some View {
        DSCard {
            DSConcentricProgressRing(
                items: DSConcentricPreviewData.items
            ) {
                VStack(spacing: DS.Spacing.xxSmall) {
                    Text("2")
                        .font(DS.Typography.titleSecondary)

                    Text("tasks left")
                        .font(DS.Typography.caption)
                }
                .foregroundStyle(DS.Colors.textPrimary)
            }
            .frame(maxWidth: .infinity)
        }
        .dsScreenPadding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            DSBackground().ignoresSafeArea()
        }
        .dsTheme(.aurora)
    }
}
