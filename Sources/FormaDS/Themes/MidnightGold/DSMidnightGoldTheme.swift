//
//  DSMidnightGoldTheme.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 09/11/2026.
//

import SwiftUI

// MARK: - Midnight Gold Theme

public extension DSTheme {

    static let midnightGold = DSTheme(
        id: "midnight-gold",
        name: "Midnight Gold",
        light: .midnightGoldLight,
        dark: .midnightGoldDark,
        lightEffects: .midnightGoldLightEffects,
        darkEffects: .midnightGoldDarkEffects,
        lightBackground: .midnightGoldLightBackground,
        darkBackground: .midnightGoldDarkBackground
    )
}

// MARK: - Color Palettes

private extension DSThemePalette {

    // MARK: Light Palette

    static let midnightGoldLight = DSThemePalette(
        values: [

            // Backgrounds

            .backgroundPrimary:
                .init(hex: "#F4F6FA"),

            .backgroundSheet:
                .init(hex: "#FFFFFF"),

            .backgroundTabBar:
                .init(hex: "#FFFFFF", alpha: 0.94),

            // Typography

            .textPrimary:
                .init(hex: "#0D1B2A"),

            .textSecondary:
                .init(hex: "#52657D"),

            .textLink:
                .init(hex: "#805600"),

            // Surfaces

            .surfaceCard:
                .init(hex: "#FFFFFF", alpha: 0.90),

            .surfaceElevated:
                .init(hex: "#FFFFFF", alpha: 0.98),

            .surfaceSelected:
                .init(hex: "#E7EDF6", alpha: 0.94),

            // Borders

            .borderCard:
                .init(hex: "#D4DDEA", alpha: 0.90),

            .borderSeparator:
                .init(hex: "#DFE6EF"),

            // Accents

            .accentPrimary:
                .init(hex: "#805600"),

            .accentSecondary:
                .init(hex: "#415A77"),

            .accentTertiary:
                .init(hex: "#B87800"),

            // States

            .stateSuccess:
                .init(hex: "#227A57"),

            .stateWarning:
                .init(hex: "#976000"),

            .stateError:
                .init(hex: "#B93F49"),

            // Text on Accent Colors

            .textOnAccent:
                .init(hex: "#FFFFFF"),

            .textOnPrimaryAction:
                .init(hex: "#FFFFFF"),

            // Progress

            .progressTrack:
                .init(hex: "#DFE6EF"),

            // Maps

            .mapWater:
                .init(hex: "#C7D9E9"),

            .mapPark:
                .init(hex: "#D9E5DA"),

            .mapRoad:
                .init(hex: "#FFFFFF"),

            .mapBackground:
                .init(hex: "#E7ECF2")
        ]
    )

    // MARK: Dark Palette

    static let midnightGoldDark = DSThemePalette(
        values: [

            // Backgrounds

            .backgroundPrimary:
                .init(hex: "#0A1422"),

            .backgroundSheet:
                .init(hex: "#132033"),

            .backgroundTabBar:
                .init(hex: "#132033", alpha: 0.94),

            // Typography

            .textPrimary:
                .init(hex: "#F5F7FC"),

            .textSecondary:
                .init(hex: "#BAC9DA"),

            .textLink:
                .init(hex: "#FFB703"),

            // Surfaces

            .surfaceCard:
                .init(hex: "#FFFFFF", alpha: 0.075),

            .surfaceElevated:
                .init(hex: "#FFFFFF", alpha: 0.12),

            .surfaceSelected:
                .init(hex: "#FFB703", alpha: 0.17),

            // Borders

            .borderCard:
                .init(hex: "#FFFFFF", alpha: 0.14),

            .borderSeparator:
                .init(hex: "#34465A"),

            // Accents

            .accentPrimary:
                .init(hex: "#FFB703"),

            .accentSecondary:
                .init(hex: "#87A6C5"),

            .accentTertiary:
                .init(hex: "#E7A440"),

            // States

            .stateSuccess:
                .init(hex: "#73D6A7"),

            .stateWarning:
                .init(hex: "#F5C76B"),

            .stateError:
                .init(hex: "#FF8996"),

            // Text on Accent Colors

            .textOnAccent:
                .init(hex: "#0A1422"),

            .textOnPrimaryAction:
                .init(hex: "#0A1422"),

            // Progress

            .progressTrack:
                .init(hex: "#34465A"),

            // Maps

            .mapWater:
                .init(hex: "#1C435C"),

            .mapPark:
                .init(hex: "#294C40"),

            .mapRoad:
                .init(hex: "#54667B"),

            .mapBackground:
                .init(hex: "#1A2C40")
        ]
    )
}

// MARK: - Effects

private extension DSEffectsPalette {

    // MARK: Light Effects

    static let midnightGoldLightEffects = DSEffectsPalette(
        primaryActionGradient: DSGradientValue(
            startColor: .init(hex: "#A16C00"),
            endColor: .init(hex: "#805600"),
            angleDegrees: 120
        ),
        primaryActionShadow: DSShadowValue(
            color: .init(hex: "#B87800", alpha: 0.22),
            radius: 24,
            x: 0,
            y: 8
        )
    )

    // MARK: Dark Effects

    static let midnightGoldDarkEffects = DSEffectsPalette(
        primaryActionGradient: DSGradientValue(
            startColor: .init(hex: "#FFCF56"),
            endColor: .init(hex: "#FFB703"),
            angleDegrees: 120
        ),
        primaryActionShadow: DSShadowValue(
            color: .init(hex: "#FFB703", alpha: 0.26),
            radius: 30,
            x: 0,
            y: 10
        )
    )
}

// MARK: - Backgrounds

private extension DSBackgroundValue {

    // MARK: Light Background

    static let midnightGoldLightBackground = DSBackgroundValue(
        glows: [
            DSRadialGlow(
                color: .init(
                    hex: "#9FB9D5",
                    alpha: 0.32
                ),
                centerX: 1.05,
                centerY: -0.05,
                radiusScale: 0.46
            ),

            DSRadialGlow(
                color: .init(
                    hex: "#C9D9ED",
                    alpha: 0.28
                ),
                centerX: -0.10,
                centerY: 0.52,
                radiusScale: 0.42
            ),

            DSRadialGlow(
                color: .init(
                    hex: "#F1D6A0",
                    alpha: 0.24
                ),
                centerX: 1.08,
                centerY: 0.98,
                radiusScale: 0.42
            )
        ]
    )

    // MARK: Dark Background

    static let midnightGoldDarkBackground = DSBackgroundValue(
        glows: [
            DSRadialGlow(
                color: .init(
                    hex: "#315B87",
                    alpha: 0.55
                ),
                centerX: 1.05,
                centerY: -0.05,
                radiusScale: 0.46
            ),

            DSRadialGlow(
                color: .init(
                    hex: "#24466E",
                    alpha: 0.42
                ),
                centerX: -0.10,
                centerY: 0.52,
                radiusScale: 0.42
            ),

            DSRadialGlow(
                color: .init(
                    hex: "#C48626",
                    alpha: 0.16
                ),
                centerX: 1.08,
                centerY: 0.98,
                radiusScale: 0.42
            )
        ]
    )
}
