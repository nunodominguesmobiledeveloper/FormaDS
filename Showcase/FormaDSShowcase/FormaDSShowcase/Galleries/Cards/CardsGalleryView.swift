//
//  CardsGalleryView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 28/10/2026.
//

import SwiftUI
import FormaDS

// MARK: - Cards Gallery

struct CardsGalleryView: View {

    // MARK: - State

    @State private var selectedCard = false

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: DS.Layout.sectionSpacing
            ) {
                introduction

                cardVariantsSection

                sectionHeaderExample

                rowExample

                iconTilesSection

                interactiveExample
            }
            .dsScreenPadding()
            .padding(.vertical, DS.Spacing.regular)
        }
        .background {
            DSBackground()
                .ignoresSafeArea()
        }
        .navigationTitle("Cards & Layout")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Introduction

    private var introduction: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            Text("Cards & Layout")
                .font(DS.Typography.titleSecondary)
                .foregroundStyle(DS.Colors.textPrimary)

            Text(
                "Reusable containers and content composition."
            )
            .font(DS.Typography.subtitle)
            .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Card Variants

    private var cardVariantsSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "Card Variants",
                subtitle: "Standard, elevated and selected surfaces"
            )

            ForEach(DSCardStyle.allCases, id: \.self) { style in
                DSCard(style: style) {
                    VStack(
                        alignment: .leading,
                        spacing: DS.Layout.compactSpacing
                    ) {
                        Text(style.rawValue.capitalized)
                            .font(DS.Typography.heading)
                            .foregroundStyle(DS.Colors.textPrimary)

                        Text("Reusable FormaDS surface")
                            .font(DS.Typography.body)
                            .foregroundStyle(DS.Colors.textSecondary)
                    }
                }
            }
        }
    }

    // MARK: - Section Header Example

    private var sectionHeaderExample: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "Section Headers",
                subtitle: "With or without actions"
            )

            DSCard {
                VStack(
                    alignment: .leading,
                    spacing: DS.Layout.contentSpacing
                ) {
                    DSSectionHeader(
                        title: "Upcoming events",
                        subtitle: "Events from your calendar"
                    )

                    DSSectionHeader(
                        title: "Your tasks",
                        actionTitle: "See all",
                        action: {}
                    )
                }
            }
        }
    }

    // MARK: - Row Example

    private var rowExample: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "Rows",
                subtitle: "Flexible leading, content and trailing"
            )

            DSCard {
                VStack(
                    spacing: DS.Layout.contentSpacing
                ) {
                    DSRow {
                        DSIconTile(.tasks)
                    } content: {
                        rowText(
                            title: "Finish presentation",
                            subtitle: "Today's task"
                        )
                    } trailing: {
                        DSIcon(.forward)
                            .foregroundStyle(DS.Colors.textSecondary)
                    }

                    DSRow {
                        DSIconTile(
                            .calendar,
                            color: .accentSecondary
                        )
                    } content: {
                        rowText(
                            title: "Team meeting",
                            subtitle: "Today at 2:30 PM"
                        )
                    }

                    DSRow {
                        DSIconTile(
                            .completed,
                            color: .stateSuccess
                        )
                    } content: {
                        rowText(
                            title: "Completed habits",
                            subtitle: "4 of 5 habits"
                        )
                    } trailing: {
                        Text("80%")
                            .font(DS.Typography.subtitle)
                            .foregroundStyle(DS.Colors.stateSuccess)
                    }
                }
            }
        }
    }

    // MARK: - Row Text

    private func rowText(
        title: LocalizedStringResource,
        subtitle: LocalizedStringResource
    ) -> some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            Text(title)
                .font(DS.Typography.body)
                .foregroundStyle(DS.Colors.textPrimary)

            Text(subtitle)
                .font(DS.Typography.caption)
                .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Icon Tiles

    private var iconTilesSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "Icon Tiles",
                subtitle: "Semantic icons and colors"
            )

            DSCard {
                HStack(
                    spacing: DS.Layout.contentSpacing
                ) {
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
            }
        }
    }

    // MARK: - Interactive Example

    private var interactiveExample: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "Interactive Preview",
                subtitle: "Change a card's visual state"
            )

            Button {
                selectedCard.toggle()
            } label: {
                DSCard(
                    style: selectedCard ? .selected : .standard
                ) {
                    DSRow {
                        DSIconTile(
                            selectedCard ? .completed : .tasks,
                            color: selectedCard
                                ? .stateSuccess
                                : .accentPrimary
                        )
                    } content: {
                        rowText(
                            title: "Select card",
                            subtitle: selectedCard
                                ? "Selecionado"
                                : "Not selected"
                        )
                    } trailing: {
                        DSIcon(
                            selectedCard ? .completed : .forward
                        )
                        .foregroundStyle(
                            selectedCard
                                ? DS.Colors.stateSuccess
                                : DS.Colors.textSecondary
                        )
                    }
                }
            }
            .buttonStyle(.plain)
            .accessibilityLabel("Select card")
            .accessibilityValue(
                selectedCard ? "Selecionado" : "Not selected"
            )
            .accessibilityAddTraits(
                selectedCard ? [.isSelected] : []
            )
        }
    }
}

// MARK: - Previews

#Preview("Cards — Light") {
    NavigationStack {
        CardsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Cards — Dark") {
    NavigationStack {
        CardsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("Cards — Accessibility") {
    NavigationStack {
        CardsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.accessibility3)
}

#Preview("Cards — Interactive") {
    NavigationStack {
        CardsGalleryView()
    }
    .dsTheme(.aurora)
}
