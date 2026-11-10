//
//  IndicatorsGalleryView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Suningues on 02/11/2026.
//

import SwiftUI
import FormaDS

// MARK: - Indicators Gallery

struct IndicatorsGalleryView: View {

    // MARK: - State

    @State private var tasksCompleted = 6.0

    // MARK: - Sample Data

    private var progressItems: [DSProgressItem] {
        [
            .init(
                id: "tasks",
                title: "Tasks",
                detail: "\(Int(tasksCompleted)) of 8 done",
                value: tasksCompleted / 8,
                color: .accentPrimary
            ),
            .init(
                id: "habits",
                title: "Habits",
                detail: "2 of 3 done",
                value: 2.0 / 3.0,
                color: .accentSecondary
            ),
            .init(
                id: "budget",
                title: "Budget",
                detail: "56% used",
                value: 0.56,
                color: .accentTertiary
            )
        ]
    }

    private let weeklyData: [DSBarChartItem] = [
        .init(id: "seg", label: "Mon", value: 2),
        .init(id: "ter", label: "Tue", value: 5),
        .init(id: "qua", label: "Wed", value: 3),
        .init(id: "qui", label: "Thu", value: 4),
        .init(id: "sex", label: "Fri", value: 6, isHighlighted: true),
        .init(id: "sab", label: "Sat", value: 1),
        .init(id: "dom", label: "Sun", value: 0)
    ]

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: DS.Layout.sectionSpacing
            ) {
                introduction
                todayProgressSection
                progressBarSection
                badgesSection
                statisticsSection
                weeklyChartSection
            }
            .dsScreenPadding()
            .padding(.vertical, DS.Spacing.regular)
        }
        .background {
            DSBackground().ignoresSafeArea()
        }
        .navigationTitle("Indicators & Charts")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Introduction

    private var introduction: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            Text("Indicators & Charts")
                .font(DS.Typography.titleSecondary)
                .foregroundStyle(DS.Colors.textPrimary)

            Text("Progress, statistics and visual data.")
                .font(DS.Typography.subtitle)
                .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Today Progress

    private var todayProgressSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "Today Overview",
                subtitle: "Three concentric progress rings"
            )

            DSCard {
                VStack(spacing: DS.Layout.contentSpacing) {
                    ViewThatFits(in: .horizontal) {
                        HStack(
                            spacing: DS.Layout.itemSpacing
                        ) {
                            concentricRings

                            progressLegend
                        }
                        .fixedSize(
                            horizontal: true,
                            vertical: false
                        )

                        VStack(
                            spacing: DS.Layout.contentSpacing
                        ) {
                            concentricRings

                            progressLegend
                        }
                    }
                    .frame(maxWidth: .infinity)

                    Slider(
                        value: $tasksCompleted,
                        in: 0...8,
                        step: 1
                    )
                    .tint(DS.Colors.accentPrimary)

                    Text(
                        "Tasks completed: \(Int(tasksCompleted)) of 8"
                    )
                    .font(DS.Typography.caption)
                    .foregroundStyle(DS.Colors.textSecondary)
                }
            }
        }
    }

    // MARK: - Concentric Rings

    private var concentricRings: some View {
        DSConcentricProgressRing(
            items: progressItems
        ) {
            VStack(
                spacing: DS.Spacing.xxSmall
            ) {
                Text("\(8 - Int(tasksCompleted))")
                    .font(DS.Typography.titleSecondary)

                Text("tasks left")
                    .font(DS.Typography.caption)
            }
            .foregroundStyle(DS.Colors.textPrimary)
            .accessibilityLabel(
                "\(8 - Int(tasksCompleted)) tasks remaining"
            )
        }
    }

    // MARK: - Progress Legend

    private var progressLegend: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            ForEach(progressItems) { item in
                HStack(
                    alignment: .top,
                    spacing: DS.Layout.compactSpacing
                ) {
                    Circle()
                        .fill(item.color)
                        .frame(
                            width: DS.Spacing.xSmall,
                            height: DS.Spacing.xSmall
                        )
                        .padding(.top, DS.Spacing.xxSmall)
                        .accessibilityHidden(true)

                    VStack(
                        alignment: .leading,
                        spacing: DS.Spacing.xxSmall
                    ) {
                        Text(item.title)
                            .font(DS.Typography.subtitle)
                            .foregroundStyle(
                                DS.Colors.textPrimary
                            )

                        Text(item.detail)
                            .font(DS.Typography.caption)
                            .foregroundStyle(
                                DS.Colors.textSecondary
                            )
                    }
                }
            }
        }
    }

    // MARK: - Progress Bar

    private var progressBarSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(title: "Progress Bars")

            DSCard {
                VStack(
                    alignment: .leading,
                    spacing: DS.Layout.itemSpacing
                ) {
                    Text("Monthly budget")
                        .font(DS.Typography.body)
                        .foregroundStyle(DS.Colors.textPrimary)

                    DSProgressBar(
                        progress: 0.56,
                        color: .accentTertiary,
                        accessibilityTitle: "Budget used"
                    )

                    Text("56% utilizado")
                        .font(DS.Typography.caption)
                        .foregroundStyle(DS.Colors.textSecondary)
                }
            }
        }
    }

    // MARK: - Badges

    private var badgesSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(title: "Badges")

            DSCard {
                HStack(
                    spacing: DS.Layout.itemSpacing
                ) {
                    DSBadge("Em atraso", color: .stateError)

                    DSBadge(
                        "Completed",
                        color: .stateSuccess
                    )
                }
            }
        }
    }

    // MARK: - Statistics

    private var statisticsSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(title: "Statistics")

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
        }
    }

    // MARK: - Weekly Chart

    private var weeklyChartSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "This week",
                subtitle: "Completed tasks per day"
            )

            DSCard {
                DSBarChart(
                    items: weeklyData,
                    accessibilityTitle:
                        "Tasks completed over the last seven days"
                )
            }
        }
    }
}

// MARK: - Previews

#Preview("Indicators — Light") {
    NavigationStack {
        IndicatorsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Indicators — Dark") {
    NavigationStack {
        IndicatorsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("Indicators — Accessibility") {
    NavigationStack {
        IndicatorsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.accessibility3)
}

#Preview("Indicators — Interactive") {
    NavigationStack {
        IndicatorsGalleryView()
    }
    .dsTheme(.aurora)
}
