//
//  ShadowsGalleryView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import SwiftUI
import FormaDS

// MARK: - Shadows Gallery

struct ShadowsGalleryView: View {

    // MARK: - Environment

    @Environment(\.dsTheme) private var theme

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: DS.Layout.sectionSpacing
            ) {
                introduction

                activeShadowSection

                comparisonSection
            }
            .dsScreenPadding()
            .padding(.vertical, DS.Spacing.regular)
        }
        .background(DS.Colors.backgroundPrimary)
        .navigationTitle("Shadows")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Introduction

    private var introduction: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            Text("Shadows")
                .font(DS.Typography.titleSecondary)
                .foregroundStyle(DS.Colors.textPrimary)

            Text("Semantic, theme-aware elevation effects.")
                .font(DS.Typography.subtitle)
                .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Active Shadow

    private var activeShadowSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            Text("Active Appearance")
                .font(DS.Typography.heading)
                .foregroundStyle(DS.Colors.textPrimary)

            Capsule()
                .fill(DS.Gradients.primaryAction)
                .frame(height: DS.Sizes.Button.height)
                .dsShadow(.primaryAction)
                .padding(.vertical, DS.Spacing.xLarge)

            Text(".dsShadow(.primaryAction)")
                .font(DS.Typography.caption)
                .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Comparison

    private var comparisonSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            Text("Light & Dark")
                .font(DS.Typography.heading)
                .foregroundStyle(DS.Colors.textPrimary)

            shadowSample(
                name: "Light",
                appearance: .light
            )

            shadowSample(
                name: "Dark",
                appearance: .dark
            )
        }
    }

    // MARK: - Sample

    private func shadowSample(
        name: String,
        appearance: ColorScheme
    ) -> some View {
        let shadow = theme.shadow(
            for: .primaryAction,
            appearance: appearance
        )

        let gradient = theme.gradient(
            for: .primaryAction,
            appearance: appearance
        )

        let background = theme.color(
            for: .backgroundPrimary,
            appearance: appearance
        )

        let textColor = theme.color(
            for: .textPrimary,
            appearance: appearance
        )

        return VStack(
            alignment: .leading,
            spacing: DS.Layout.itemSpacing
        ) {
            Text(name)
                .font(DS.Typography.body)
                .foregroundStyle(textColor)

            Capsule()
                .fill(gradient.gradient)
                .frame(height: DS.Sizes.Button.height)
                .shadow(
                    color: shadow.color.color,
                    radius: shadow.radius,
                    x: shadow.x,
                    y: shadow.y
                )
                .padding(.vertical, DS.Spacing.xLarge)

            Text(
                "Color: \(shadow.color.hexString)"
            )
            .font(DS.Typography.caption)
            .foregroundStyle(textColor)

            Text(
                "Opacity: \(shadow.color.alphaPercentage.formatted(.number.precision(.fractionLength(0...2))))%"
            )
            .font(DS.Typography.caption)
            .foregroundStyle(textColor)

            Text(
                "Radius: \(Int(shadow.radius)) · X: \(Int(shadow.x)) · Y: \(Int(shadow.y))"
            )
            .font(DS.Typography.caption)
            .foregroundStyle(textColor)
        }
        .padding(DS.Spacing.regular)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            background,
            in: RoundedRectangle(
                cornerRadius: DS.Radius.card
            )
        )
    }
}

// MARK: - Previews

#Preview("Shadows — Light") {
    NavigationStack {
        ShadowsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Shadows — Dark") {
    NavigationStack {
        ShadowsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("Shadows — Accessibility") {
    NavigationStack {
        ShadowsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.accessibility3)
}
