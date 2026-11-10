//
//  ButtonsSelectionGalleryView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 28/10/2026.
//

import SwiftUI
import FormaDS

// MARK: - Buttons & Selection Gallery

struct ButtonsSelectionGalleryView: View {

    // MARK: - State

    @State private var buttonTapCount = 0
    @State private var selectedChip: ShowcaseChipOption = .today
    @State private var selectedPeriod = "day"
    @State private var notificationsEnabled = true
    @State private var termsAccepted = false

    // MARK: - Options

    private let periods: [DSSelectionOption<String>] = [
        .init(value: "day", title: "Day"),
        .init(value: "week", title: "Week"),
        .init(value: "month", title: "Month")
    ]

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: DS.Layout.sectionSpacing
            ) {
                introduction

                buttonsSection

                iconButtonsSection

                chipsSection

                segmentedSection

                toggleSection

                checkboxSection
            }
            .dsScreenPadding()
            .padding(.vertical, DS.Spacing.regular)
        }
        .background {
            DSBackground()
                .ignoresSafeArea()
        }
        .navigationTitle("Buttons & Selection")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Introduction

    private var introduction: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            Text("Buttons & Selection")
                .font(DS.Typography.titleSecondary)
                .foregroundStyle(DS.Colors.textPrimary)

            Text(
                "Reusable actions and state-driven selection controls."
            )
            .font(DS.Typography.subtitle)
            .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Buttons

    private var buttonsSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "Buttons",
                subtitle: "Primary, Secondary and Disabled"
            )

            DSCard {
                VStack(spacing: DS.Layout.contentSpacing) {
                    DSButton(
                        "Add task",
                        icon: .add
                    ) {
                        buttonTapCount += 1
                    }

                    DSButton(
                        "Cancel",
                        variant: .secondary
                    ) {
                        buttonTapCount += 1
                    }

                    DSButton(
                        "Small button",
                        size: .small
                    ) {
                        buttonTapCount += 1
                    }

                    DSButton("Unavailable") {
                        buttonTapCount += 1
                    }
                    .disabled(true)

                    Text(
                        "Button taps: \(buttonTapCount)"
                    )
                    .font(DS.Typography.caption)
                    .foregroundStyle(DS.Colors.textSecondary)
                }
            }
        }
    }

    // MARK: - Icon Buttons

    private var iconButtonsSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(title: "Icon Buttons")

            DSCard {
                HStack(spacing: DS.Layout.contentSpacing) {
                    DSIconButton(
                        .add,
                        accessibilityLabel: "Add",
                        variant: .primary
                    ) {
                        buttonTapCount += 1
                    }

                    DSIconButton(
                        .edit,
                        accessibilityLabel: "Edit"
                    ) {
                        buttonTapCount += 1
                    }

                    DSIconButton(
                        .close,
                        accessibilityLabel: "Close"
                    ) {
                        buttonTapCount += 1
                    }

                    Spacer(minLength: 0)
                }
            }
        }
    }

    // MARK: - Chips

    private var chipsSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "Chips",
                subtitle: "Single selection example"
            )

            DSCard {
                VStack(
                    alignment: .leading,
                    spacing: DS.Layout.itemSpacing
                ) {
                    HStack(spacing: DS.Layout.compactSpacing) {
                        ForEach(ShowcaseChipOption.allCases) { option in
                            DSChip(
                                option.title,
                                isSelected: selectedChip == option
                            ) {
                                selectedChip = option
                            }
                        }
                    }

                    Text("Filtro: \(Text(selectedChip.title))")
                        .font(DS.Typography.caption)
                        .foregroundStyle(DS.Colors.textSecondary)
                }
            }
        }
    }

    // MARK: - Segmented Control

    private var segmentedSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "Segmented Control",
                subtitle: "Exclusive selection"
            )

            DSCard {
                VStack(spacing: DS.Layout.itemSpacing) {
                    DSSegmentedControl(
                        options: periods,
                        selection: $selectedPeriod
                    )

                    Text(
                        "Period: \(selectedPeriod)"
                    )
                    .font(DS.Typography.caption)
                    .foregroundStyle(DS.Colors.textSecondary)
                }
            }
        }
    }

    // MARK: - Toggle

    private var toggleSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(title: "Toggle")

            DSCard {
                DSToggle(
                    "Notifications",
                    subtitle: "Receive alerts and reminders",
                    isOn: $notificationsEnabled
                )
            }
        }
    }

    // MARK: - Checkbox

    private var checkboxSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(title: "Checkbox")

            DSCard {
                VStack(spacing: DS.Layout.itemSpacing) {
                    DSCheckbox(
                        "I accept the terms and conditions",
                        isChecked: $termsAccepted
                    )

                    DSButton("Continue") {
                        buttonTapCount += 1
                    }
                    .disabled(!termsAccepted)
                }
            }
        }
    }
}

// MARK: - Chip Options

private enum ShowcaseChipOption: String, CaseIterable, Identifiable {
    case today
    case week
    case month

    var id: String {
        rawValue
    }

    var title: LocalizedStringResource {
        switch self {
        case .today:
            "Today"
        case .week:
            "Week"
        case .month:
            "Month"
        }
    }
}

// MARK: - Previews

#Preview("Selection — Light") {
    NavigationStack {
        ButtonsSelectionGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Selection — Dark") {
    NavigationStack {
        ButtonsSelectionGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("Selection — Accessibility") {
    NavigationStack {
        ButtonsSelectionGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.accessibility3)
}

#Preview("Selection — Interactive") {
    NavigationStack {
        ButtonsSelectionGalleryView()
    }
    .dsTheme(.aurora)
}
