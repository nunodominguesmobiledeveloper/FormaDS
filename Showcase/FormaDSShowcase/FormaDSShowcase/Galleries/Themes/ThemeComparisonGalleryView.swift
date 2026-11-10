//
//  ThemeComparisonGalleryView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 09/11/2026.
//

import SwiftUI
import FormaDS

// MARK: - Theme Comparison Gallery

struct ThemeComparisonGalleryView: View {

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: DS.Layout.sectionSpacing
            ) {
                introduction

                ThemeSample(
                    title: "Aurora",
                    subtitle: "Violet, cyan and glass",
                    theme: .aurora
                )

                ThemeSample(
                    title: "Horizon",
                    subtitle: "Teal, blue and calm",
                    theme: .horizon
                )

                ThemeSample(
                    title: "Midnight Gold",
                    subtitle: "Midnight blue and gold",
                    theme: .midnightGold
                )
            }
            .dsScreenPadding()
            .padding(.vertical, DS.Spacing.regular)
        }
        .navigationTitle("Theme Comparison")
        .navigationBarTitleDisplayMode(.inline)
        .background {
            DSBackground()
                .ignoresSafeArea()
        }
    }

    // MARK: - Introduction

    private var introduction: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            Text("Advanced Theming")
                .font(DS.Typography.titleSecondary)
                .foregroundStyle(DS.Colors.textPrimary)

            Text(
                "The same components with three visual identities."
            )
            .font(DS.Typography.body)
            .foregroundStyle(DS.Colors.textSecondary)
        }
    }
}

// MARK: - Theme Sample

private struct ThemeSample: View {

    // MARK: - Properties

    let title: LocalizedStringResource
    let subtitle: LocalizedStringResource
    let theme: DSTheme

    // MARK: - State

    @State private var showMessage = false

    // MARK: - Body

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            header

            DSCard {
                VStack(
                    alignment: .leading,
                    spacing: DS.Layout.contentSpacing
                ) {
                    Text("Your progress")
                        .font(DS.Typography.subtitle)
                        .foregroundStyle(
                            DS.Colors.textSecondary
                        )

                    Text("75%")
                        .font(DS.Typography.displayNumber)
                        .foregroundStyle(
                            DS.Colors.textPrimary
                        )

                    DSProgressBar(progress: 0.75)

                    DSButton("New task") {
                        showMessage.toggle()
                    }

                    if showMessage {
                        Text("Demo action")
                            .font(DS.Typography.caption)
                            .foregroundStyle(
                                DS.Colors.accentPrimary
                            )
                    }
                }
            }
        }
        .padding(DS.Spacing.regular)
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .background {
            DSBackground()
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: DS.Radius.large,
                        style: .continuous
                    )
                )
        }
        .dsTheme(theme)
    }

    // MARK: - Header

    private var header: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            Text(title)
                .font(DS.Typography.heading)
                .foregroundStyle(
                    DS.Colors.textPrimary
                )

            Text(subtitle)
                .font(DS.Typography.caption)
                .foregroundStyle(
                    DS.Colors.textSecondary
                )
        }
    }
}

// MARK: - Previews

#Preview("Themes — Light") {
    NavigationStack {
        ThemeComparisonGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Themes — Dark") {
    NavigationStack {
        ThemeComparisonGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}
