//
//  GradientsGalleryView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import SwiftUI
import FormaDS

// MARK: - Gradients Gallery

struct GradientsGalleryView: View {

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

                activeGradientSection

                comparisonSection
            }
            .dsScreenPadding()
            .padding(.vertical, DS.Spacing.regular)
        }
        .background(DS.Colors.backgroundPrimary)
        .navigationTitle("Gradients")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Introduction

    private var introduction: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            Text("Gradients")
                .font(DS.Typography.titleSecondary)
                .foregroundStyle(DS.Colors.textPrimary)

            Text(
                "Theme-aware gradient styles for FormaDS."
            )
            .font(DS.Typography.subtitle)
            .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Active Gradient

    private var activeGradientSection: some View {
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

            Text("DS.Gradients.primaryAction")
                .font(DS.Typography.caption)
                .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Appearance Comparison

    private var comparisonSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            Text("Light & Dark")
                .font(DS.Typography.heading)
                .foregroundStyle(DS.Colors.textPrimary)

            appearanceSample(
                name: "Light",
                appearance: .light
            )

            appearanceSample(
                name: "Dark",
                appearance: .dark
            )
        }
    }

    // MARK: - Appearance Sample

    private func appearanceSample(
        name: String,
        appearance: ColorScheme
    ) -> some View {
        let value = theme.gradient(
            for: .primaryAction,
            appearance: appearance
        )

        return VStack(
            alignment: .leading,
            spacing: DS.Layout.itemSpacing
        ) {
            Text(name)
                .font(DS.Typography.body)
                .foregroundStyle(DS.Colors.textPrimary)

            RoundedRectangle(
                cornerRadius: DS.Radius.medium
            )
            .fill(value.gradient)
            .frame(height: DS.Sizes.Button.height)

            Text(
                "\(value.startColor.hexString) → \(value.endColor.hexString)"
            )
            .font(DS.Typography.caption)
            .foregroundStyle(DS.Colors.textSecondary)

            Text(
                "Direction: \(Int(value.angleDegrees))°"
            )
            .font(DS.Typography.footnote)
            .foregroundStyle(DS.Colors.textSecondary)
        }
        .padding(DS.Spacing.regular)
        .background(
            DS.Colors.surfaceCard,
            in: RoundedRectangle(
                cornerRadius: DS.Radius.card
            )
        )
    }
}

// MARK: - Previews

#Preview("Gradients — Light") {
    NavigationStack {
        GradientsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Gradients — Dark") {
    NavigationStack {
        GradientsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("Gradients — Accessibility") {
    NavigationStack {
        GradientsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.accessibility3)
}
