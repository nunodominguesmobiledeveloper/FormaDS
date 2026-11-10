//
//  ColorsGalleryView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import SwiftUI
import FormaDS

struct ColorsGalleryView: View {

    // MARK: - Environment

    @Environment(\.dsTheme) private var theme
    @Environment(\.colorScheme) private var systemColorScheme

    // MARK: - State

    @State private var selectedAppearance: ColorScheme = .light
    @State private var compareAppearances = false

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                introduction

                appearancePicker

                Toggle(
                    "Compare Light and Dark",
                    isOn: $compareAppearances
                )

                LazyVStack(spacing: 12) {
                    ForEach(
                        DSColorToken.allCases,
                        id: \.self
                    ) { token in
                        colorRow(for: token)
                    }
                }
            }
            .padding(16)
        }
        .navigationTitle("Colors")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            selectedAppearance = systemColorScheme
        }
    }

    // MARK: - Introduction

    private var introduction: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("\(theme.name) Colors")
                .font(.title2.bold())

            Text(
                "Semantic color tokens for the current theme."
            )
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }
    }

    // MARK: - Appearance Picker

    private var appearancePicker: some View {
        Picker(
            "Preview Appearance",
            selection: $selectedAppearance
        ) {
            Text("Light")
                .tag(ColorScheme.light)

            Text("Dark")
                .tag(ColorScheme.dark)
        }
        .pickerStyle(.segmented)
        .disabled(compareAppearances)
    }

    // MARK: - Color Row

    private func colorRow(
        for token: DSColorToken
    ) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(token.rawValue)
                .font(.headline)

            if compareAppearances {
                HStack(spacing: 12) {
                    colorSample(
                        for: token,
                        appearance: .light
                    )

                    colorSample(
                        for: token,
                        appearance: .dark
                    )
                }
            } else {
                colorSample(
                    for: token,
                    appearance: selectedAppearance
                )
            }
        }
        .padding(14)
        .background(
            .regularMaterial,
            in: RoundedRectangle(cornerRadius: 16)
        )
    }

    // MARK: - Color Sample

    private func colorSample(
        for token: DSColorToken,
        appearance: ColorScheme
    ) -> some View {
        let value = theme.value(
            for: token,
            appearance: appearance
        )

        return VStack(alignment: .leading, spacing: 6) {
            RoundedRectangle(cornerRadius: 12)
                .fill(value.color)
                .frame(height: 64)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(
                            .primary.opacity(0.12),
                            lineWidth: 1
                        )
                }

            Text(
                appearance == .dark ? "Dark" : "Light"
            )
            .font(.caption.weight(.semibold))

            Text(value.hexString)
                .font(.caption.monospaced())

            if value.alpha < 1 {
                Text(
                    "Opacity: \(value.alphaPercentage.formatted(.number.precision(.fractionLength(0...2))))%"
                )
                .font(.caption2)
                .foregroundStyle(.secondary)
            }
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }
}

// MARK: - Previews

#Preview("Light") {
    NavigationStack {
        ColorsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Dark") {
    NavigationStack {
        ColorsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("Interactive") {
    NavigationStack {
        ColorsGalleryView()
    }
    .dsTheme(.aurora)
}
