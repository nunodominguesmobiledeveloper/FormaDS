//
//  RadiusGalleryView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import SwiftUI
import FormaDS

// MARK: - Radius Gallery

struct RadiusGalleryView: View {

    // MARK: - Samples

    private let samples: [RadiusSample] = [
        .init(name: "small", value: DS.Radius.small),
        .init(name: "medium", value: DS.Radius.medium),
        .init(name: "large", value: DS.Radius.large),
        .init(name: "card", value: DS.Radius.card)
    ]

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: DS.Spacing.large
            ) {
                introduction

                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ],
                    spacing: DS.Spacing.regular
                ) {
                    ForEach(samples) { sample in
                        radiusSample(sample)
                    }
                }

                capsuleExample
            }
            .padding(DS.Spacing.regular)
        }
        .background(DS.Colors.backgroundPrimary)
        .navigationTitle("Radius")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Introduction

    private var introduction: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Spacing.xSmall
        ) {
            Text("Corner Radius")
                .font(.title2.bold())
                .foregroundStyle(DS.Colors.textPrimary)

            Text(
                "Consistent corner shapes for reusable components."
            )
            .font(.subheadline)
            .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Radius Sample

    private func radiusSample(
        _ sample: RadiusSample
    ) -> some View {
        VStack(
            alignment: .leading,
            spacing: DS.Spacing.small
        ) {
            RoundedRectangle(
                cornerRadius: sample.value
            )
            .fill(DS.Colors.accentPrimary)
            .frame(height: 90)

            Text(sample.name)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(DS.Colors.textPrimary)

            Text("\(Int(sample.value)) pt")
                .font(.caption.monospaced())
                .foregroundStyle(DS.Colors.textSecondary)
        }
        .padding(DS.Spacing.small)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            DS.Colors.surfaceCard,
            in: RoundedRectangle(
                cornerRadius: DS.Radius.card
            )
        )
    }

    // MARK: - Capsule Example

    private var capsuleExample: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Spacing.small
        ) {
            Text("Fully Rounded")
                .font(.headline)
                .foregroundStyle(DS.Colors.textPrimary)

            Text(
                "Use Capsule() instead of an arbitrary infinite radius."
            )
            .font(.subheadline)
            .foregroundStyle(DS.Colors.textSecondary)

            Text("Capsule")
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(DS.Colors.textOnAccent)
                .padding(.horizontal, DS.Spacing.large)
                .padding(.vertical, DS.Spacing.small)
                .background(
                    DS.Colors.accentPrimary,
                    in: Capsule()
                )
        }
    }
}

// MARK: - Radius Sample

private struct RadiusSample: Identifiable {

    let name: String
    let value: CGFloat

    var id: String { name }
}

// MARK: - Previews

#Preview("Radius — Light") {
    NavigationStack {
        RadiusGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Radius — Dark") {
    NavigationStack {
        RadiusGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}
