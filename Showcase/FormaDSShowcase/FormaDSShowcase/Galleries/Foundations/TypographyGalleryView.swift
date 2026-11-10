//
//  TypographyGalleryView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import SwiftUI
import FormaDS

// MARK: - Typography Gallery

struct TypographyGalleryView: View {

    // MARK: - State

    @State private var previewSize: TypographyPreviewSize = .standard

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: DS.Spacing.large
            ) {
                introduction

                fontStatusSection

                typographyScaleSection

                dynamicTypeSection
            }
            .padding(DS.Spacing.regular)
        }
        .background(DS.Colors.backgroundPrimary)
        .navigationTitle("Typography")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Introduction

    private var introduction: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Spacing.xSmall
        ) {
            Text("Typography")
                .font(DS.Typography.titleSecondary)
                .foregroundStyle(DS.Colors.textPrimary)

            Text(
                "Semantic type styles with Sora, Manrope and Dynamic Type."
            )
            .font(DS.Typography.subtitle)
            .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Font Registration

    private var fontStatusSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Spacing.small
        ) {
            Text("Font Registration")
                .font(DS.Typography.heading)
                .foregroundStyle(DS.Colors.textPrimary)

            ForEach(
                TypographyFontVariant.allCases
            ) { variant in
                fontStatusRow(variant)
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

    // MARK: - Font Status Row

    private func fontStatusRow(
        _ variant: TypographyFontVariant
    ) -> some View {
        let registered = DSFontRegistry.isRegistered(
            postScriptName: variant.postScriptName
        )

        return HStack(spacing: DS.Spacing.xSmall) {
            Image(
                systemName: registered
                    ? "checkmark.circle.fill"
                    : "exclamationmark.triangle.fill"
            )
            .foregroundStyle(
                registered
                    ? DS.Colors.stateSuccess
                    : DS.Colors.stateError
            )

            Text(variant.postScriptName)
                .font(DS.Typography.footnote)
                .foregroundStyle(DS.Colors.textPrimary)

            Spacer(minLength: DS.Spacing.xxSmall)

            Text(registered ? "Available" : "Missing")
                .font(DS.Typography.caption)
                .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Typography Scale

    private var typographyScaleSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Spacing.regular
        ) {
            Text("Type Scale")
                .font(DS.Typography.heading)
                .foregroundStyle(DS.Colors.textPrimary)

            ForEach(DSTypographyToken.allCases) { token in
                typographySample(token)
            }
        }
    }

    // MARK: - Typography Sample

    private func typographySample(
        _ token: DSTypographyToken
    ) -> some View {
        VStack(
            alignment: .leading,
            spacing: DS.Spacing.small
        ) {
            HStack {
                Text(token.rawValue)
                    .font(DS.Typography.caption)
                    .foregroundStyle(DS.Colors.accentPrimary)

                Spacer()

                Text("\(Int(token.baseSize)) pt")
                    .font(DS.Typography.caption)
                    .foregroundStyle(DS.Colors.textSecondary)
            }

            Text(sampleText(for: token))
                .font(token.font)
                .foregroundStyle(DS.Colors.textPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)

            Text(token.postScriptName)
                .font(DS.Typography.caption)
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

    // MARK: - Sample Content

    private func sampleText(
        for token: DSTypographyToken
    ) -> LocalizedStringResource {
        switch token {
        case .caption:
            return "Last updated at 10:30 AM"

        case .footnote:
            return "Additional task details"

        case .subtitle:
            return "Organize your day with clarity"

        case .body:
            return "You have three pending tasks today."

        case .heading:
            return "Your habits"

        case .titleSecondary:
            return "Weekly summary"

        case .titlePrimary:
            return "Good morning!"

        case .displayNumber:
            return "75%"

        case .button:
            return "Add task"
        }
    }

    // MARK: - Dynamic Type Section

    private var dynamicTypeSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Spacing.regular
        ) {
            Text("Dynamic Type")
                .font(DS.Typography.heading)
                .foregroundStyle(DS.Colors.textPrimary)

            Text(
                "Preview how text responds to larger accessibility settings."
            )
            .font(DS.Typography.subtitle)
            .foregroundStyle(DS.Colors.textSecondary)

            Picker(
                "Text Size",
                selection: $previewSize
            ) {
                ForEach(
                    TypographyPreviewSize.allCases
                ) { size in
                    Text(size.title)
                        .tag(size)
                }
            }
            .pickerStyle(.segmented)

            dynamicTypeExample
                .dynamicTypeSize(previewSize.dynamicTypeSize)
        }
    }

    // MARK: - Dynamic Type Example

    private var dynamicTypeExample: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Spacing.regular
        ) {
            Text("Daily planning")
                .font(DS.Typography.titleSecondary)
                .foregroundStyle(DS.Colors.textPrimary)

            Text(
                "Organize tasks, track habits, and stay focused on priorities."
            )
            .font(DS.Typography.body)
            .foregroundStyle(DS.Colors.textSecondary)
            .fixedSize(horizontal: false, vertical: true)

            Text("Continue")
                .font(DS.Typography.button)
                .foregroundStyle(DS.Colors.textOnAccent)
                .frame(maxWidth: .infinity)
                .padding(DS.Spacing.regular)
                .background(
                    DS.Colors.accentPrimary,
                    in: Capsule()
                )
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

// MARK: - Font Variants

private enum TypographyFontVariant:
    String,
    CaseIterable,
    Identifiable {

    case soraRegular = "Sora-Regular"
    case soraSemiBold = "Sora-SemiBold"
    case soraBold = "Sora-Bold"
    case manropeRegular = "Manrope-Regular"
    case manropeMedium = "Manrope-Medium"
    case manropeSemiBold = "Manrope-SemiBold"
    case manropeBold = "Manrope-Bold"

    var id: String { rawValue }

    var postScriptName: String { rawValue }
}

// MARK: - Preview Sizes

private enum TypographyPreviewSize:
    String,
    CaseIterable,
    Identifiable {

    case standard
    case large
    case accessibility

    var id: String { rawValue }

    var title: LocalizedStringResource {
        switch self {
        case .standard:
            return "Normal"

        case .large:
            return "Large"

        case .accessibility:
            return "Accessibility"
        }
    }

    var dynamicTypeSize: DynamicTypeSize {
        switch self {
        case .standard:
            return .medium

        case .large:
            return .xxxLarge

        case .accessibility:
            return .accessibility3
        }
    }
}

// MARK: - Previews

#Preview("Light Mode") {
    NavigationStack {
        TypographyGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    NavigationStack {
        TypographyGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("Accessibility") {
    NavigationStack {
        TypographyGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.accessibility3)
}

#Preview("Interactive") {
    NavigationStack {
        TypographyGalleryView()
    }
    .dsTheme(.aurora)
}
