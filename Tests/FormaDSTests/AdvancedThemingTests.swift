//
//  File.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 09/11/2026.
//

import XCTest
import SwiftUI
@testable import FormaDS

final class AdvancedThemingTests: XCTestCase {

    func testThemeIdentifiersAreDifferent() {
        XCTAssertNotEqual(
            DSTheme.aurora.id,
            DSTheme.horizon.id
        )
    }

    func testHorizonHasCorrectIdentity() {
        XCTAssertEqual(
            DSTheme.horizon.id,
            "horizon"
        )

        XCTAssertEqual(
            DSTheme.horizon.name,
            "Horizon"
        )
    }

    func testAuroraResolvesEveryColorToken() {
        assertEveryColorResolves(
            in: .aurora
        )
    }

    func testHorizonResolvesEveryColorToken() {
        assertEveryColorResolves(
            in: .horizon
        )
    }

    func testBuiltInThemesResolveEveryColorToken() {
        for theme in [
            DSTheme.aurora,
            DSTheme.horizon,
            DSTheme.midnightGold
        ] {
            assertEveryColorResolves(in: theme)
        }
    }

    func testPaletteReportsMissingTokensInStableOrder() {
        let values: [DSColorToken: DSColorValue] = [
            .textPrimary: .init(hex: "#000000")
        ]
        let missingTokens = DSThemePalette.missingTokens(in: values)

        XCTAssertFalse(missingTokens.contains(.textPrimary))
        XCTAssertEqual(
            missingTokens.map(\.rawValue),
            missingTokens.map(\.rawValue).sorted()
        )
        XCTAssertEqual(
            missingTokens.count,
            DSColorToken.allCases.count - 1
        )
    }

    func testBuiltInThemeTextContrastMeetsWCAGAA() {
        for theme in builtInThemes {
            for appearance in appearances {
                let background = theme.value(
                    for: .backgroundPrimary,
                    appearance: appearance
                )

                for token in [
                    DSColorToken.textPrimary,
                    .textSecondary,
                    .textLink
                ] {
                    assertContrast(
                        foreground: theme.value(for: token, appearance: appearance),
                        background: background,
                        minimum: 4.5,
                        context: "\(theme.id) \(appearance) \(token.rawValue)"
                    )
                }
            }
        }
    }

    func testBuiltInThemeActionContrastMeetsWCAGAA() {
        for theme in builtInThemes {
            for appearance in appearances {
                let text = theme.value(
                    for: .textOnPrimaryAction,
                    appearance: appearance
                )
                let gradient = theme.gradient(
                    for: .primaryAction,
                    appearance: appearance
                )

                for color in [gradient.startColor, gradient.endColor] {
                    assertContrast(
                        foreground: text,
                        background: color,
                        minimum: 4.5,
                        context: "\(theme.id) \(appearance) primary action"
                    )
                }
            }
        }
    }

    func testBuiltInThemeValuesAreFiniteAndWithinTheirContracts() {
        for theme in builtInThemes {
            for appearance in appearances {
                for token in DSColorToken.allCases {
                    let color = theme.value(for: token, appearance: appearance)

                    for component in [color.red, color.green, color.blue, color.alpha] {
                        XCTAssertTrue(
                            component.isFinite && (0...1).contains(component),
                            "Invalid color component for \(theme.id) \(appearance) \(token.rawValue)"
                        )
                    }
                }

                for token in DSGradientToken.allCases {
                    let gradient = theme.gradient(for: token, appearance: appearance)
                    XCTAssertTrue(
                        gradient.angleDegrees.isFinite,
                        "Invalid gradient angle for \(theme.id) \(appearance) \(token.rawValue)"
                    )
                }

                for token in DSShadowToken.allCases {
                    let shadow = theme.shadow(for: token, appearance: appearance)
                    XCTAssertTrue(shadow.radius.isFinite && shadow.radius >= 0)
                    XCTAssertTrue(shadow.x.isFinite)
                    XCTAssertTrue(shadow.y.isFinite)
                }
            }
        }
    }

    private func assertEveryColorResolves(
        in theme: DSTheme
    ) {
        for appearance in [
            ColorScheme.light,
            ColorScheme.dark
        ] {
            for token in DSColorToken.allCases {
                let value = theme.value(
                    for: token,
                    appearance: appearance
                )

                XCTAssertFalse(
                    value.hexString.isEmpty,
                    "Missing color for \(token)"
                )
            }
        }
    }

    private var builtInThemes: [DSTheme] {
        [.aurora, .horizon, .midnightGold]
    }

    private var appearances: [ColorScheme] {
        [.light, .dark]
    }

    private func assertContrast(
        foreground: DSColorValue,
        background: DSColorValue,
        minimum: Double,
        context: String
    ) {
        let ratio = contrastRatio(foreground, background)
        XCTAssertGreaterThanOrEqual(
            ratio,
            minimum,
            "Insufficient contrast for \(context): \(ratio):1"
        )
    }

    private func contrastRatio(
        _ first: DSColorValue,
        _ second: DSColorValue
    ) -> Double {
        let firstLuminance = relativeLuminance(first)
        let secondLuminance = relativeLuminance(second)

        return (max(firstLuminance, secondLuminance) + 0.05)
            / (min(firstLuminance, secondLuminance) + 0.05)
    }

    private func relativeLuminance(_ color: DSColorValue) -> Double {
        0.2126 * linearized(color.red)
            + 0.7152 * linearized(color.green)
            + 0.0722 * linearized(color.blue)
    }

    private func linearized(_ component: Double) -> Double {
        if component <= 0.04045 {
            return component / 12.92
        }

        return pow((component + 0.055) / 1.055, 2.4)
    }
}
