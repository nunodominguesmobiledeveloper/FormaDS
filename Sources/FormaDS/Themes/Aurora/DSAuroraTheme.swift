//
//  DSAuroraTheme.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 25/10/2026.
//

import SwiftUI

// MARK: - Aurora Theme
public extension DSTheme {

    static let aurora = DSTheme(
        id: "aurora",
        name: "Aurora",

        light: .auroraLight,
        dark: .auroraDark,

        lightEffects: .auroraLightEffects,
        darkEffects: .auroraDarkEffects,

        lightBackground: .auroraLightBackground,
        darkBackground: .auroraDarkBackground
    )
}

// MARK: - Aurora Palettes
private extension DSThemePalette {
    
    // MARK: - Dark Appearance
    static let auroraDark = DSThemePalette(
        values: [
            
            // MARK: - Backgrounds
            .backgroundPrimary: .init(hex: "#0B0B1E"),
            
            .backgroundSheet: .init(
                hex: "#161434",
                alpha: 0.94
            ),
            
            .backgroundTabBar: .init(
                hex: "#201E46",
                alpha: 0.74
            ),
            
            // MARK: - Text
            .textPrimary: .init(hex: "#FFFFFF"),
            
            .textSecondary: .init(hex: "#FFFFFF", alpha: 0.78),
            
            .textLink: .init(hex: "#C4B8FF"),
            
            // MARK: - Surfaces
            .surfaceCard: .init(
                hex: "#FFFFFF",
                alpha: 0.08
            ),
            
            .surfaceElevated: .init(
                hex: "#FFFFFF",
                alpha: 0.10
            ),
            
            .surfaceSelected: .init(
                hex: "#FFFFFF",
                alpha: 0.22
            ),
            
            // MARK: - Borders & Separators
            .borderCard: .init(
                hex: "#FFFFFF",
                alpha: 0.16
            ),
            
            .borderSeparator: .init(
                hex: "#FFFFFF",
                alpha: 0.12
            ),
            
            // MARK: - Accents
            .accentPrimary: .init(hex: "#A18BFF"),
            .accentSecondary: .init(hex: "#4FE3F0"),
            .accentTertiary: .init(hex: "#FF7DBA"),
            
            // MARK: - Semantic States
            .stateWarning: .init(hex: "#FFC285"),
            .stateSuccess: .init(hex: "#6EF0B8"),
            .stateError: .init(hex: "#FF9B9B"),
            
            // MARK: - Contrast
            .textOnAccent: .init(hex: "#0B0B1E"),
            .textOnPrimaryAction: .init(hex: "#0B0B1E"),
            
            // MARK: - Progress
            .progressTrack: .init(
                hex: "#FFFFFF",
                alpha: 0.16
            ),
            
            // MARK: - Map
                .mapWater: .init(hex: "#17204A"),
                .mapPark: .init(hex: "#173A3B"),
                .mapRoad: .init(
                    hex: "#FFFFFF",
                    alpha: 0.16
                ),
            .mapBackground: .init(hex: "#101330")
        ]
    )
    
    // MARK: - Light Appearance
    static let auroraLight = DSThemePalette(
        values: [

            // MARK: Backgrounds

            .backgroundPrimary: .init(hex: "#EEEBFF"),

            .backgroundSheet: .init(
                hex: "#FAF9FF",
                alpha: 0.96
            ),

            .backgroundTabBar: .init(
                hex: "#FFFFFF",
                alpha: 0.86
            ),

            // MARK: Text

            .textPrimary: .init(hex: "#14142B"),
            .textSecondary: .init(hex: "#4A4A66"),
            .textLink: .init(hex: "#4B2FD0"),

            // MARK: Surfaces

            .surfaceCard: .init(
                hex: "#FFFFFF",
                alpha: 0.72
            ),

            .surfaceElevated: .init(
                hex: "#14142B",
                alpha: 0.055
            ),

            .surfaceSelected: .init(hex: "#FFFFFF"),

            // MARK: Borders & Separators

            .borderCard: .init(
                hex: "#14142B",
                alpha: 0.08
            ),

            .borderSeparator: .init(
                hex: "#14142B",
                alpha: 0.10
            ),

            // MARK: Accents

            .accentPrimary: .init(hex: "#5B3DF5"),
            .accentSecondary: .init(hex: "#0A7B8A"),
            .accentTertiary: .init(hex: "#C2327D"),

            // MARK: Semantic States

            .stateWarning: .init(hex: "#9A3B00"),
            .stateSuccess: .init(hex: "#0B7A4B"),
            .stateError: .init(hex: "#C62828"),

            // MARK: Contrast

            .textOnAccent: .init(hex: "#FFFFFF"),

            .textOnPrimaryAction: .init(
                hex: "#FFFFFF"
            ),

            // MARK: Progress

            .progressTrack: .init(
                hex: "#14142B",
                alpha: 0.12
            ),

            // MARK: Map

            .mapWater: .init(hex: "#C8D6F5"),
            .mapPark: .init(hex: "#CDE8D2"),

            .mapRoad: .init(
                hex: "#14142B",
                alpha: 0.14
            ),

            .mapBackground: .init(hex: "#EFEBFA")
        ]
    )
}

// MARK: - Aurora Effect Palettes

private extension DSEffectsPalette {

    // MARK: - Light Effects

    static let auroraLightEffects = DSEffectsPalette(
        primaryActionGradient: DSGradientValue(
            startColor: DSColorValue(hex: "#5B3DF5"),
            endColor: DSColorValue(hex: "#7B4DFF"),
            angleDegrees: 120
        ),
        primaryActionShadow: DSShadowValue(
            color: DSColorValue(
                hex: "#5B3DF5",
                alpha: 0.35
            ),
            radius: 28,
            x: 0,
            y: 10
        )
    )

    // MARK: - Dark Effects

    static let auroraDarkEffects = DSEffectsPalette(
        primaryActionGradient: DSGradientValue(
            startColor: DSColorValue(hex: "#9C86FF"),
            endColor: DSColorValue(hex: "#4FE3F0"),
            angleDegrees: 120
        ),
        primaryActionShadow: DSShadowValue(
            color: DSColorValue(
                hex: "#7C5CFF",
                alpha: 0.50
            ),
            radius: 34,
            x: 0,
            y: 10
        )
    )
}


// MARK: - Aurora Background Configurations

private extension DSBackgroundValue {

    // MARK: - Light Background

    static let auroraLightBackground = DSBackgroundValue(
        glows: [

            // MARK: Upper Right Glow

            DSRadialGlow(
                color: DSColorValue(
                    hex: "#7C5CFF",
                    alpha: 0.32
                ),
                centerX: 1.05,
                centerY: -0.05,
                radiusScale: 0.46
            ),

            // MARK: Left Glow

            DSRadialGlow(
                color: DSColorValue(
                    hex: "#3DD9EB",
                    alpha: 0.22
                ),
                centerX: -0.10,
                centerY: 0.52,
                radiusScale: 0.42
            ),

            // MARK: Lower Right Glow

            DSRadialGlow(
                color: DSColorValue(
                    hex: "#FF6FB5",
                    alpha: 0.24
                ),
                centerX: 1.08,
                centerY: 0.98,
                radiusScale: 0.42
            )
        ]
    )

    // MARK: - Dark Background

    static let auroraDarkBackground = DSBackgroundValue(
        glows: [

            // MARK: Upper Right Glow

            DSRadialGlow(
                color: DSColorValue(
                    hex: "#7C5CFF",
                    alpha: 0.75
                ),
                centerX: 1.05,
                centerY: -0.05,
                radiusScale: 0.46
            ),

            // MARK: Left Glow

            DSRadialGlow(
                color: DSColorValue(
                    hex: "#3DD9EB",
                    alpha: 0.34
                ),
                centerX: -0.10,
                centerY: 0.52,
                radiusScale: 0.42
            ),

            // MARK: Lower Right Glow

            DSRadialGlow(
                color: DSColorValue(
                    hex: "#FF6FB5",
                    alpha: 0.38
                ),
                centerX: 1.08,
                centerY: 0.98,
                radiusScale: 0.42
            )
        ]
    )
}
