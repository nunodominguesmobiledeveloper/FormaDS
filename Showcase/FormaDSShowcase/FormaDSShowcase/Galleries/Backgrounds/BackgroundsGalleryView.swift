//
//  BackgroundsGalleryView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import SwiftUI
import FormaDS

// MARK: - Backgrounds Gallery

struct BackgroundsGalleryView: View {

    // MARK: - Environment

    @Environment(\.dsTheme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: DS.Layout.sectionSpacing
            ) {
                introduction

                activeBackgroundSection

                comparisonSection

                layersSection
            }
            .dsScreenPadding()
            .padding(.vertical, DS.Spacing.regular)
        }
        .background {
            DSBackground()
                .ignoresSafeArea()
        }
        .navigationTitle("Backgrounds")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Introduction

    private var introduction: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            Text("Backgrounds")
                .font(DS.Typography.titleSecondary)
                .foregroundStyle(
                    DS.Colors.textPrimary
                )

            Text(
                "Theme-aware backgrounds with layered radial gradients."
            )
            .font(DS.Typography.subtitle)
            .foregroundStyle(
                DS.Colors.textSecondary
            )
        }
    }

    // MARK: - Active Background

    private var activeBackgroundSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            sectionTitle("Active Appearance")

            backgroundSample(
                appearance: colorScheme,
                title: theme.name
            )
        }
    }

    // MARK: - Appearance Comparison

    private var comparisonSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            sectionTitle("Light & Dark")

            ViewThatFits(in: .horizontal) {
                HStack(
                    alignment: .top,
                    spacing: DS.Layout.itemSpacing
                ) {
                    backgroundSample(
                        appearance: .light,
                        title: String(localized: "Light")
                    )

                    backgroundSample(
                        appearance: .dark,
                        title: String(localized: "Dark")
                    )
                }

                VStack(
                    spacing: DS.Layout.itemSpacing
                ) {
                    backgroundSample(
                        appearance: .light,
                        title: String(localized: "Light")
                    )

                    backgroundSample(
                        appearance: .dark,
                        title: String(localized: "Dark")
                    )
                }
            }
        }
    }

    // MARK: - Background Sample

    private func backgroundSample(
        appearance: ColorScheme,
        title: String
    ) -> some View {
        ZStack(alignment: .topLeading) {
            DSBackground()

            VStack(
                alignment: .leading,
                spacing: DS.Layout.compactSpacing
            ) {
                Text(title)
                    .font(DS.Typography.heading)
                    .foregroundStyle(
                        DS.Colors.textPrimary
                    )

                Text("Aurora")
                    .font(DS.Typography.caption)
                    .foregroundStyle(
                        DS.Colors.textSecondary
                    )

                Spacer()

                Text("LifeHub")
                    .font(DS.Typography.titleSecondary)
                    .foregroundStyle(
                        DS.Colors.textPrimary
                    )
            }
            .padding(DS.Spacing.regular)
        }
        .frame(
            maxWidth: .infinity,
            minHeight: 260,
            maxHeight: 260
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: DS.Radius.card
            )
        )
        .overlay {
            RoundedRectangle(
                cornerRadius: DS.Radius.card
            )
            .strokeBorder(
                DS.Colors.borderCard,
                lineWidth: 1
            )
        }
        .environment(
            \.colorScheme,
            appearance
        )
    }

    // MARK: - Layers

    private var layersSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            sectionTitle("Radial Layers")

            appearanceLayers(
                appearance: .light,
                title: LocalizedStringResource("Light")
            )

            appearanceLayers(
                appearance: .dark,
                title: LocalizedStringResource("Dark")
            )
        }
    }

    // MARK: - Appearance Layers

    private func appearanceLayers(
        appearance: ColorScheme,
        title: LocalizedStringResource
    ) -> some View {
        let background = theme.background(
            for: appearance
        )

        return VStack(
            alignment: .leading,
            spacing: DS.Layout.itemSpacing
        ) {
            Text(title)
                .font(DS.Typography.heading)
                .foregroundStyle(
                    DS.Colors.textPrimary
                )

            ForEach(
                background.glows.indices,
                id: \.self
            ) { index in
                glowRow(
                    background.glows[index],
                    number: index + 1
                )
            }
        }
        .padding(DS.Spacing.regular)
        .background(
            DS.Colors.surfaceCard,
            in: RoundedRectangle(
                cornerRadius: DS.Radius.card
            )
        )
    }

    // MARK: - Glow Row

    private func glowRow(
        _ glow: DSRadialGlow,
        number: Int
    ) -> some View {
        HStack(
            alignment: .center,
            spacing: DS.Layout.itemSpacing
        ) {
            Circle()
                .fill(glow.color.color)
                .frame(
                    width: DS.Sizes.IconTile.side,
                    height: DS.Sizes.IconTile.side
                )

            VStack(
                alignment: .leading,
                spacing: DS.Layout.compactSpacing
            ) {
                Text("Layer \(number)")
                    .font(DS.Typography.body)
                    .foregroundStyle(
                        DS.Colors.textPrimary
                    )

                Text(
                    "\(glow.color.hexString) · \(glow.color.alphaPercentage.formatted(.number.precision(.fractionLength(0...2))))%"
                )
                .font(DS.Typography.caption)
                .foregroundStyle(
                    DS.Colors.textSecondary
                )

                Text(
                    "Center: \(Int(glow.centerX * 100))%, \(Int(glow.centerY * 100))%"
                )
                .font(DS.Typography.footnote)
                .foregroundStyle(
                    DS.Colors.textSecondary
                )
            }

            Spacer(minLength: 0)
        }
    }

    // MARK: - Section Title

    private func sectionTitle(
        _ title: LocalizedStringResource
    ) -> some View {
        Text(title)
            .font(DS.Typography.heading)
            .foregroundStyle(
                DS.Colors.textPrimary
            )
    }
}

// MARK: - Previews

#Preview("Backgrounds — Light") {
    NavigationStack {
        BackgroundsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Backgrounds — Dark") {
    NavigationStack {
        BackgroundsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("Backgrounds — Accessibility") {
    NavigationStack {
        BackgroundsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.accessibility3)
}
