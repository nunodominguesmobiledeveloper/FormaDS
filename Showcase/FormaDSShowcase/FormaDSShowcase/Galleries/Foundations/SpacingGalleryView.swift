//
//  SpacingGalleryView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

//
//  SpacingGalleryView.swift
//  FormaDSShowcase
//

import SwiftUI
import FormaDS

// MARK: - Spacing Gallery

struct SpacingGalleryView: View {

    // MARK: - Samples

    private let samples: [SpacingSample] = [
        .init(name: "xxSmall", value: DS.Spacing.xxSmall),
        .init(name: "xSmall", value: DS.Spacing.xSmall),
        .init(name: "small", value: DS.Spacing.small),
        .init(name: "regular", value: DS.Spacing.regular),
        .init(name: "large", value: DS.Spacing.large),
        .init(name: "xLarge", value: DS.Spacing.xLarge)
    ]

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: DS.Spacing.large
            ) {
                introduction

                scaleSection

                usageSection
            }
            .padding(DS.Spacing.regular)
        }
        .background(DS.Colors.backgroundPrimary)
        .navigationTitle("Spacing")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Introduction

    private var introduction: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Spacing.xSmall
        ) {
            Text("Spacing Scale")
                .font(.title2.bold())
                .foregroundStyle(DS.Colors.textPrimary)

            Text(
                "Consistent spacing tokens for layouts and components."
            )
            .font(.subheadline)
            .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Scale

    private var scaleSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Spacing.regular
        ) {
            Text("Base Scale")
                .font(.headline)
                .foregroundStyle(DS.Colors.textPrimary)

            ForEach(samples) { sample in
                sampleRow(sample)
            }
        }
    }

    // MARK: - Sample Row

    private func sampleRow(
        _ sample: SpacingSample
    ) -> some View {
        HStack(spacing: DS.Spacing.regular) {
            VStack(alignment: .leading) {
                Text(sample.name)
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(DS.Colors.textPrimary)

                Text("\(Int(sample.value)) pt")
                    .font(.caption.monospaced())
                    .foregroundStyle(DS.Colors.textSecondary)
            }
            .frame(width: 100, alignment: .leading)

            RoundedRectangle(
                cornerRadius: DS.Radius.small
            )
            .fill(DS.Colors.accentPrimary)
            .frame(
                width: sample.value * 4,
                height: DS.Spacing.regular
            )

            Spacer(minLength: 0)
        }
        .padding(DS.Spacing.small)
        .background(
            DS.Colors.surfaceCard,
            in: RoundedRectangle(
                cornerRadius: DS.Radius.medium
            )
        )
    }

    // MARK: - Usage Example

    private var usageSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Spacing.regular
        ) {
            Text("Layout Example")
                .font(.headline)
                .foregroundStyle(DS.Colors.textPrimary)

            VStack(spacing: DS.Spacing.regular) {
                exampleItem("First item")
                exampleItem("Second item")
                exampleItem("Third item")
            }
            .padding(DS.Spacing.regular)
            .background(
                DS.Colors.surfaceCard,
                in: RoundedRectangle(
                    cornerRadius: DS.Radius.card
                )
            )

            Text("VStack spacing: DS.Spacing.regular")
                .font(.caption.monospaced())
                .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Example Item

    private func exampleItem(
        _ title: LocalizedStringResource
    ) -> some View {
        Text(title)
            .font(.body)
            .foregroundStyle(DS.Colors.textPrimary)
            .frame(maxWidth: .infinity)
            .padding(DS.Spacing.small)
            .background(
                DS.Colors.surfaceElevated,
                in: RoundedRectangle(
                    cornerRadius: DS.Radius.small
                )
            )
    }
}

// MARK: - Spacing Sample

private struct SpacingSample: Identifiable {

    let name: String
    let value: CGFloat

    var id: String { name }
}

// MARK: - Previews

#Preview("Spacing — Light") {
    NavigationStack {
        SpacingGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Spacing — Dark") {
    NavigationStack {
        SpacingGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}
