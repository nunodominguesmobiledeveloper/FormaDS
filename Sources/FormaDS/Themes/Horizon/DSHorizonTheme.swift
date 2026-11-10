//
//  DSHorizonTheme.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 09/11/2026.
//

import SwiftUI

// MARK: - Horizon Theme

public extension DSTheme {

    static let horizon = DSTheme(
        id: "horizon",
        name: "Horizon",
        light: .horizonLight,
        dark: .horizonDark,
        lightEffects: .horizonLightEffects,
        darkEffects: .horizonDarkEffects,
        lightBackground: .horizonLightBackground,
        darkBackground: .horizonDarkBackground
    )
}

// MARK: - Color Palettes

private extension DSThemePalette {

    static let horizonLight = DSThemePalette(
        values: [
            .backgroundPrimary: .init(hex: "#EFF7FA"),
            .backgroundSheet: .init(hex: "#FFFFFF"),
            .backgroundTabBar: .init(hex: "#FFFFFF", alpha: 0.88),

            .textPrimary: .init(hex: "#112536"),
            .textSecondary: .init(hex: "#536879"),
            .textLink: .init(hex: "#077891"),

            .surfaceCard: .init(hex: "#FFFFFF", alpha: 0.84),
            .surfaceElevated: .init(hex: "#FFFFFF", alpha: 0.94),
            .surfaceSelected: .init(hex: "#D8F2F5", alpha: 0.92),

            .borderCard: .init(hex: "#BED8E2", alpha: 0.80),
            .borderSeparator: .init(hex: "#D6E8EF"),

            .accentPrimary: .init(hex: "#087C99"),
            .accentSecondary: .init(hex: "#16B8C9"),
            .accentTertiary: .init(hex: "#4C8DD7"),

            .stateWarning: .init(hex: "#AC690A"),
            .stateSuccess: .init(hex: "#147D58"),
            .stateError: .init(hex: "#C43D4B"),

            .textOnAccent: .init(hex: "#FFFFFF"),
            .textOnPrimaryAction: .init(hex: "#FFFFFF"),

            .progressTrack: .init(hex: "#D5E7EC"),

            .mapWater: .init(hex: "#B9E6F4"),
            .mapPark: .init(hex: "#CBE9D6"),
            .mapRoad: .init(hex: "#FFFFFF"),
            .mapBackground: .init(hex: "#E6F0ED")
        ]
    )

    static let horizonDark = DSThemePalette(
        values: [
            .backgroundPrimary: .init(hex: "#071D29"),
            .backgroundSheet: .init(hex: "#122D3A"),
            .backgroundTabBar: .init(hex: "#122D3A", alpha: 0.92),

            .textPrimary: .init(hex: "#F2FCFF"),
            .textSecondary: .init(hex: "#A5C1CF"),
            .textLink: .init(hex: "#40D8DE"),

            .surfaceCard: .init(hex: "#FFFFFF", alpha: 0.075),
            .surfaceElevated: .init(hex: "#FFFFFF", alpha: 0.11),
            .surfaceSelected: .init(hex: "#40D8DE", alpha: 0.18),

            .borderCard: .init(hex: "#FFFFFF", alpha: 0.15),
            .borderSeparator: .init(hex: "#315060"),

            .accentPrimary: .init(hex: "#40D8DE"),
            .accentSecondary: .init(hex: "#72B8FF"),
            .accentTertiary: .init(hex: "#B69AFF"),

            .stateWarning: .init(hex: "#F5C16E"),
            .stateSuccess: .init(hex: "#6CDEAC"),
            .stateError: .init(hex: "#FF8992"),

            .textOnAccent: .init(hex: "#071D29"),
            .textOnPrimaryAction: .init(hex: "#071D29"),

            .progressTrack: .init(hex: "#315060"),

            .mapWater: .init(hex: "#164B62"),
            .mapPark: .init(hex: "#205344"),
            .mapRoad: .init(hex: "#49616B"),
            .mapBackground: .init(hex: "#19343F")
        ]
    )
}

// MARK: - Effects

private extension DSEffectsPalette {

    static let horizonLightEffects = DSEffectsPalette(
        primaryActionGradient: DSGradientValue(
            startColor: .init(hex: "#087C99"),
            endColor: .init(hex: "#08758F"),
            angleDegrees: 120
        ),
        primaryActionShadow: DSShadowValue(
            color: .init(hex: "#087C99", alpha: 0.24),
            radius: 24,
            x: 0,
            y: 8
        )
    )

    static let horizonDarkEffects = DSEffectsPalette(
        primaryActionGradient: DSGradientValue(
            startColor: .init(hex: "#40D8DE"),
            endColor: .init(hex: "#72B8FF"),
            angleDegrees: 120
        ),
        primaryActionShadow: DSShadowValue(
            color: .init(hex: "#40D8DE", alpha: 0.22),
            radius: 28,
            x: 0,
            y: 10
        )
    )
}

// MARK: - Backgrounds

private extension DSBackgroundValue {

    static let horizonLightBackground = DSBackgroundValue(
        glows: [
            DSRadialGlow(
                color: .init(hex: "#8EDDEA", alpha: 0.36),
                centerX: 1.05,
                centerY: -0.05,
                radiusScale: 0.46
            ),
            DSRadialGlow(
                color: .init(hex: "#B6D9F4", alpha: 0.28),
                centerX: -0.10,
                centerY: 0.52,
                radiusScale: 0.42
            ),
            DSRadialGlow(
                color: .init(hex: "#A5E7D6", alpha: 0.25),
                centerX: 1.08,
                centerY: 0.98,
                radiusScale: 0.42
            )
        ]
    )

    static let horizonDarkBackground = DSBackgroundValue(
        glows: [
            DSRadialGlow(
                color: .init(hex: "#087C99", alpha: 0.55),
                centerX: 1.05,
                centerY: -0.05,
                radiusScale: 0.46
            ),
            DSRadialGlow(
                color: .init(hex: "#174F79", alpha: 0.42),
                centerX: -0.10,
                centerY: 0.52,
                radiusScale: 0.42
            ),
            DSRadialGlow(
                color: .init(hex: "#147F78", alpha: 0.28),
                centerX: 1.08,
                centerY: 0.98,
                radiusScale: 0.42
            )
        ]
    )
}
