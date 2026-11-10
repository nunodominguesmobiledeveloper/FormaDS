//
//  IconsGalleryView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import SwiftUI
import FormaDS

// MARK: - Icons Gallery

struct IconsGalleryView: View {

    // MARK: - State

    @State private var selectedSize: DSIconSize = .regular

    // MARK: - Grid

    private let columns = [
        GridItem(.adaptive(minimum: 110))
    ]

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: DS.Layout.sectionSpacing
            ) {
                introduction

                sizePicker

                iconGrid

                accessibilityNote
            }
            .dsScreenPadding()
            .padding(.vertical, DS.Spacing.regular)
        }
        .background(DS.Colors.backgroundPrimary)
        .navigationTitle("Icons")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Introduction

    private var introduction: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            Text("Semantic Icons")
                .font(DS.Typography.titleSecondary)
                .foregroundStyle(DS.Colors.textPrimary)

            Text(
                "A reusable vocabulary of SF Symbols."
            )
            .font(DS.Typography.subtitle)
            .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Size Picker

    private var sizePicker: some View {
        Picker(
            "Icon Size",
            selection: $selectedSize
        ) {
            Text("Small").tag(DSIconSize.small)
            Text("Regular").tag(DSIconSize.regular)
            Text("Large").tag(DSIconSize.large)
        }
        .pickerStyle(.segmented)
    }

    // MARK: - Grid

    private var iconGrid: some View {
        LazyVGrid(
            columns: columns,
            spacing: DS.Layout.contentSpacing
        ) {
            ForEach(DSIconToken.allCases) { token in
                iconSample(token)
            }
        }
    }

    // MARK: - Sample

    private func iconSample(
        _ token: DSIconToken
    ) -> some View {
        VStack(
            spacing: DS.Layout.itemSpacing
        ) {
            DSIcon(
                token,
                size: selectedSize
            )
            .foregroundStyle(DS.Colors.accentPrimary)
            .frame(
                maxWidth: .infinity,
                minHeight: DS.Sizes.IconButton.side
            )

            Text(token.rawValue)
                .font(DS.Typography.caption)
                .foregroundStyle(DS.Colors.textPrimary)
                .lineLimit(1)
                .minimumScaleFactor(0.8)

            Text(token.systemName)
                .font(DS.Typography.footnote)
                .foregroundStyle(DS.Colors.textSecondary)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
        .frame(maxWidth: .infinity)
        .padding(DS.Spacing.small)
        .background(
            DS.Colors.surfaceCard,
            in: RoundedRectangle(
                cornerRadius: DS.Radius.medium
            )
        )
    }

    // MARK: - Accessibility Note

    private var accessibilityNote: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            Text("Accessibility")
                .font(DS.Typography.heading)
                .foregroundStyle(DS.Colors.textPrimary)

            Text(
                "Icons are decorative by default. Interactive controls must provide descriptive accessibility labels."
            )
            .font(DS.Typography.body)
            .foregroundStyle(DS.Colors.textSecondary)
        }
    }
}

// MARK: - Previews

#Preview("Icons — Light") {
    NavigationStack {
        IconsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Icons — Dark") {
    NavigationStack {
        IconsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("Icons — Interactive") {
    NavigationStack {
        IconsGalleryView()
    }
    .dsTheme(.aurora)
}
