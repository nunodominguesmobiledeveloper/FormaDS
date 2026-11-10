//
//  DSTheme.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 25/10/2026.
//

import SwiftUI

// MARK: - Design System Theme

public struct DSTheme: Sendable {

    // MARK: - Identification

    public let id: String
    public let name: String

    // MARK: - Color Palettes

    public let light: DSThemePalette
    public let dark: DSThemePalette

    // MARK: - Effects Palettes

    public let lightEffects: DSEffectsPalette
    public let darkEffects: DSEffectsPalette

    // MARK: - Backgrounds

    public let lightBackground: DSBackgroundValue
    public let darkBackground: DSBackgroundValue

    // MARK: - Initialization

    public init(
        id: String,
        name: String,
        light: DSThemePalette,
        dark: DSThemePalette,
        lightEffects: DSEffectsPalette,
        darkEffects: DSEffectsPalette,
        lightBackground: DSBackgroundValue,
        darkBackground: DSBackgroundValue
    ) {
        self.id = id
        self.name = name

        self.light = light
        self.dark = dark

        self.lightEffects = lightEffects
        self.darkEffects = darkEffects

        self.lightBackground = lightBackground
        self.darkBackground = darkBackground
    }

    // MARK: - Color Palette Resolution

    public func palette(
        for colorScheme: ColorScheme
    ) -> DSThemePalette {
        switch colorScheme {
        case .dark:
            return dark

        default:
            return light
        }
    }

    // MARK: - Color Resolution

    public func color(
        for token: DSColorToken,
        appearance: ColorScheme
    ) -> Color {
        palette(for: appearance)
            .color(for: token)
    }

    // MARK: - Color Value Resolution

    public func value(
        for token: DSColorToken,
        appearance: ColorScheme
    ) -> DSColorValue {
        palette(for: appearance)
            .value(for: token)
    }

    // MARK: - Effects Palette Resolution

    public func effects(
        for colorScheme: ColorScheme
    ) -> DSEffectsPalette {
        switch colorScheme {
        case .dark:
            return darkEffects

        default:
            return lightEffects
        }
    }

    // MARK: - Gradient Resolution

    public func gradient(
        for token: DSGradientToken,
        appearance: ColorScheme
    ) -> DSGradientValue {
        effects(for: appearance)
            .gradient(for: token)
    }

    // MARK: - Shadow Resolution

    public func shadow(
        for token: DSShadowToken,
        appearance: ColorScheme
    ) -> DSShadowValue {
        effects(for: appearance)
            .shadow(for: token)
    }

    // MARK: - Background Resolution

    public func background(
        for colorScheme: ColorScheme
    ) -> DSBackgroundValue {
        switch colorScheme {
        case .dark:
            return darkBackground

        default:
            return lightBackground
        }
    }
}
