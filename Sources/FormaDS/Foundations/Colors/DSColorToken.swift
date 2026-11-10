//
//  DSColorToken.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 25/10/2026.
//

import SwiftUI

// MARK: - Semantic Color Tokens

public enum DSColorToken: String, CaseIterable, Hashable, Sendable {

    // MARK: - Backgrounds

    case backgroundPrimary
    case backgroundSheet
    case backgroundTabBar

    // MARK: - Text

    case textPrimary
    case textSecondary
    case textLink

    // MARK: - Surfaces

    case surfaceCard
    case surfaceElevated
    case surfaceSelected

    // MARK: - Borders & Separators

    case borderCard
    case borderSeparator

    // MARK: - Accents

    case accentPrimary
    case accentSecondary
    case accentTertiary

    // MARK: - Semantic States

    case stateWarning
    case stateSuccess
    case stateError

    // MARK: - Contrast

    case textOnAccent
    case textOnPrimaryAction

    // MARK: - Progress

    case progressTrack

    // MARK: - Map

    case mapWater
    case mapPark
    case mapRoad
    case mapBackground
}

// MARK: - ShapeStyle Conformance

extension DSColorToken: ShapeStyle {

    public func resolve(
        in environment: EnvironmentValues
    ) -> some ShapeStyle {
        let theme = environment.dsTheme
        let colorScheme = environment.colorScheme

        return theme.color(
            for: self,
            appearance: colorScheme
        )
    }
}

// MARK: - Previews

#Preview("Semantic Colors — Light") {
    VStack(spacing: 16) {
        Text("Primary accent")
            .foregroundStyle(DS.Colors.accentPrimary)

        RoundedRectangle(cornerRadius: 12)
            .fill(DS.Colors.surfaceCard)
            .frame(height: 64)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(
                        DS.Colors.borderCard,
                        lineWidth: 1
                    )
            }

        Text("Secondary text")
            .foregroundStyle(DS.Colors.textSecondary)
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(DS.Colors.backgroundPrimary)
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Semantic Colors — Dark") {
    VStack(spacing: 16) {
        Text("Primary accent")
            .foregroundStyle(DS.Colors.accentPrimary)

        RoundedRectangle(cornerRadius: 12)
            .fill(DS.Colors.surfaceCard)
            .frame(height: 64)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(
                        DS.Colors.borderCard,
                        lineWidth: 1
                    )
            }

        Text("Secondary text")
            .foregroundStyle(DS.Colors.textSecondary)
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(DS.Colors.backgroundPrimary)
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}
