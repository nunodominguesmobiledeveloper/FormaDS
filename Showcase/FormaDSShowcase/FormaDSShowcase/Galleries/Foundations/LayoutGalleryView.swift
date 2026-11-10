//
//  LayoutGalleryView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import SwiftUI
import FormaDS

// MARK: - Layout Gallery

struct LayoutGalleryView: View {

    // MARK: - Layout Samples

    private let samples: [LayoutSample] = [
        .init(
            name: "screenHorizontalPadding",
            value: DS.Layout.screenHorizontalPadding
        ),
        .init(
            name: "sectionSpacing",
            value: DS.Layout.sectionSpacing
        ),
        .init(
            name: "contentSpacing",
            value: DS.Layout.contentSpacing
        ),
        .init(
            name: "itemSpacing",
            value: DS.Layout.itemSpacing
        ),
        .init(
            name: "compactSpacing",
            value: DS.Layout.compactSpacing
        )
    ]

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: DS.Layout.sectionSpacing
            ) {
                introduction

                tokenScale

                layoutExample
            }
            .dsScreenPadding()
            .padding(.vertical, DS.Spacing.regular)
        }
        .background(DS.Colors.backgroundPrimary)
        .navigationTitle("Layout")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Introduction

    private var introduction: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            Text("Layout Foundations")
                .font(DS.Typography.titleSecondary)
                .foregroundStyle(DS.Colors.textPrimary)

            Text(
                "Semantic spacing rules for consistent screen composition."
            )
            .font(DS.Typography.subtitle)
            .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Token Scale

    private var tokenScale: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            Text("Layout Tokens")
                .font(DS.Typography.heading)
                .foregroundStyle(DS.Colors.textPrimary)

            ForEach(samples) { sample in
                HStack(spacing: DS.Layout.itemSpacing) {
                    Text(sample.name)
                        .font(DS.Typography.footnote)
                        .foregroundStyle(DS.Colors.textPrimary)

                    Spacer(minLength: DS.Spacing.xxSmall)

                    Text("\(Int(sample.value)) pt")
                        .font(DS.Typography.caption)
                        .foregroundStyle(DS.Colors.textSecondary)
                }
                .padding(DS.Spacing.small)
                .background(
                    DS.Colors.surfaceCard,
                    in: RoundedRectangle(
                        cornerRadius: DS.Radius.small
                    )
                )
            }
        }
    }

    // MARK: - Layout Example

    private var layoutExample: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.sectionSpacing
        ) {
            Text("Composition Example")
                .font(DS.Typography.heading)
                .foregroundStyle(DS.Colors.textPrimary)

            exampleSection(
                title: "Today's Tasks",
                descriptions: [
                    "Review project",
                    "Prepare presentation"
                ]
            )

            exampleSection(
                title: "Upcoming",
                descriptions: [
                    "Team meeting",
                    "Weekly planning"
                ]
            )
        }
    }

    // MARK: - Example Section

    private func exampleSection(
        title: LocalizedStringResource,
        descriptions: [LocalizedStringResource]
    ) -> some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            Text(title)
                .font(DS.Typography.heading)
                .foregroundStyle(DS.Colors.textPrimary)

            VStack(
                alignment: .leading,
                spacing: DS.Layout.itemSpacing
            ) {
                ForEach(descriptions.indices, id: \.self) { index in
                    let description = descriptions[index]
                    HStack(
                        spacing: DS.Layout.itemSpacing
                    ) {
                        DSIcon(.check)
                            .foregroundStyle(
                                DS.Colors.accentPrimary
                            )

                        Text(description)
                            .font(DS.Typography.body)
                            .foregroundStyle(
                                DS.Colors.textPrimary
                            )
                    }
                }
            }
            .padding(DS.Spacing.regular)
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .background(
                DS.Colors.surfaceCard,
                in: RoundedRectangle(
                    cornerRadius: DS.Radius.card
                )
            )
        }
    }
}

// MARK: - Layout Sample

private struct LayoutSample: Identifiable {

    let name: String
    let value: CGFloat

    var id: String {
        name
    }
}

// MARK: - Previews

#Preview("Layout — Light") {
    NavigationStack {
        LayoutGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Layout — Dark") {
    NavigationStack {
        LayoutGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("Layout — Accessibility") {
    NavigationStack {
        LayoutGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.accessibility3)
}
