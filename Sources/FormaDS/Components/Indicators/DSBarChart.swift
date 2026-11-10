//
//  DSBarChart.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 02/11/2026.
//

import SwiftUI

// MARK: - Design System Bar Chart

public struct DSBarChart: View {

    // MARK: - Properties

    public let items: [DSBarChartItem]
    public let accessibilityTitle: String?

    @Environment(\.locale) private var locale

    // MARK: - Initialization

    public init(
        items: [DSBarChartItem],
        accessibilityTitle: String? = nil
    ) {
        self.items = items
        self.accessibilityTitle = accessibilityTitle
    }

    // MARK: - Maximum Value

    private var maximumValue: Double {
        max(items.map(\.value).max() ?? 0, 1)
    }

    // MARK: - Body

    public var body: some View {
        HStack(
            alignment: .bottom,
            spacing: DS.Layout.compactSpacing
        ) {
            ForEach(items) { item in
                barColumn(for: item)
            }
        }
        .frame(maxWidth: .infinity)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(accessibilityTitleText)
        .accessibilityValue(accessibilitySummary)
    }

    // MARK: - Bar Column

    private func barColumn(
        for item: DSBarChartItem
    ) -> some View {
        VStack(
            spacing: DS.Layout.compactSpacing
        ) {
            Spacer(minLength: 0)

            if item.value > 0 {
                RoundedRectangle(
                    cornerRadius: DS.Radius.small,
                    style: .continuous
                )
                .fill(
                    item.isHighlighted
                        ? DS.Colors.accentPrimary
                        : DS.Colors.surfaceSelected
                )
                .frame(
                    height: height(for: item)
                )
            }

            Text(item.label)
                .font(DS.Typography.caption)
                .foregroundStyle(
                    item.isHighlighted
                        ? DS.Colors.textPrimary
                        : DS.Colors.textSecondary
                )
                .lineLimit(1)
        }
        .frame(
            maxWidth: .infinity,
            minHeight:
                DS.Sizes.Charts.weeklyPlotHeight
                + DS.Spacing.large
        )
    }

    // MARK: - Height Calculation

    private func height(
        for item: DSBarChartItem
    ) -> CGFloat {
        guard item.value > 0 else {
            return 0
        }

        let proportion = item.value / maximumValue

        return max(
            DS.Sizes.Charts.minimumBarHeight,
            CGFloat(proportion) *
                DS.Sizes.Charts.weeklyPlotHeight
        )
    }

    private var accessibilityTitleText: Text {
        if let accessibilityTitle {
            Text(verbatim: accessibilityTitle)
        } else {
            Text(DSLocalizedString.barChart(locale: locale))
        }
    }

    // MARK: - Accessibility Summary

    private var accessibilitySummary: String {
        items
            .map { item in
                var label = item.label
                label.locale = locale
                return "\(String(localized: label)): \(item.value.formatted(.number.locale(locale)))"
            }
            .formatted(.list(type: .and).locale(locale))
    }
}

// MARK: - Preview Data

private enum DSBarChartPreviewData {

    static let week: [DSBarChartItem] = [
        .init(id: "seg", label: "Seg", value: 2),
        .init(id: "ter", label: "Ter", value: 5),
        .init(id: "qua", label: "Qua", value: 3),
        .init(id: "qui", label: "Qui", value: 4),
        .init(id: "sex", label: "Sex", value: 6, isHighlighted: true),
        .init(id: "sab", label: "Sáb", value: 1),
        .init(id: "dom", label: "Dom", value: 0)
    ]
}

// MARK: - Previews

private struct DSBarChartPreview: View {

    var body: some View {
        DSCard {
            VStack(
                alignment: .leading,
                spacing: DS.Layout.contentSpacing
            ) {
                Text("Esta semana")
                    .font(DS.Typography.heading)
                    .foregroundStyle(DS.Colors.textPrimary)

                DSBarChart(
                    items: DSBarChartPreviewData.week,
                    accessibilityTitle: "Tarefas concluídas por dia"
                )
            }
        }
        .dsScreenPadding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            DSBackground().ignoresSafeArea()
        }
        .dsTheme(.aurora)
    }
}

#Preview("Bar Chart — Light") {
    DSBarChartPreview()
        .preferredColorScheme(.light)
}

#Preview("Bar Chart — Dark") {
    DSBarChartPreview()
        .preferredColorScheme(.dark)
}

#Preview("Bar Chart — Accessibility") {
    DSBarChartPreview()
        .preferredColorScheme(.dark)
        .dynamicTypeSize(.accessibility3)
}
