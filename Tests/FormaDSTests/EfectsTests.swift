//
//  EfectsTests.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import XCTest
import SwiftUI
@testable import FormaDS

// MARK: - Effects Tests

final class EffectsTests: XCTestCase {

    // MARK: - Light Gradient

    func testAuroraLightPrimaryGradient() {
        let gradient = DSTheme.aurora.gradient(
            for: .primaryAction,
            appearance: .light
        )

        XCTAssertEqual(
            gradient.startColor.hexString,
            "#5B3DF5"
        )

        XCTAssertEqual(
            gradient.endColor.hexString,
            "#7B4DFF"
        )

        XCTAssertEqual(
            gradient.angleDegrees,
            120
        )
    }

    // MARK: - Dark Gradient

    func testAuroraDarkPrimaryGradient() {
        let gradient = DSTheme.aurora.gradient(
            for: .primaryAction,
            appearance: .dark
        )

        XCTAssertEqual(
            gradient.startColor.hexString,
            "#9C86FF"
        )

        XCTAssertEqual(
            gradient.endColor.hexString,
            "#4FE3F0"
        )

        XCTAssertEqual(
            gradient.angleDegrees,
            120
        )
    }

    // MARK: - Light Shadow

    func testAuroraLightPrimaryShadow() {
        let shadow = DSTheme.aurora.shadow(
            for: .primaryAction,
            appearance: .light
        )

        XCTAssertEqual(
            shadow.color.hexString,
            "#5B3DF5"
        )

        XCTAssertEqual(
            shadow.color.alpha,
            0.35,
            accuracy: 0.0001
        )

        XCTAssertEqual(shadow.radius, 28)
        XCTAssertEqual(shadow.x, 0)
        XCTAssertEqual(shadow.y, 10)
    }

    // MARK: - Dark Shadow

    func testAuroraDarkPrimaryShadow() {
        let shadow = DSTheme.aurora.shadow(
            for: .primaryAction,
            appearance: .dark
        )

        XCTAssertEqual(
            shadow.color.hexString,
            "#7C5CFF"
        )

        XCTAssertEqual(
            shadow.color.alpha,
            0.50,
            accuracy: 0.0001
        )

        XCTAssertEqual(shadow.radius, 34)
        XCTAssertEqual(shadow.x, 0)
        XCTAssertEqual(shadow.y, 10)
    }

    // MARK: - Different Appearances

    func testEffectsChangeWithAppearance() {
        let light = DSTheme.aurora.effects(for: .light)
        let dark = DSTheme.aurora.effects(for: .dark)

        XCTAssertNotEqual(
            light.primaryActionGradient,
            dark.primaryActionGradient
        )

        XCTAssertNotEqual(
            light.primaryActionShadow,
            dark.primaryActionShadow
        )
    }

    // MARK: - Public Namespaces

    func testPublicEffectTokens() {
        XCTAssertEqual(
            DS.Gradients.primaryAction,
            DSGradientToken.primaryAction
        )

        XCTAssertEqual(
            DS.Shadows.primaryAction,
            DSShadowToken.primaryAction
        )
    }

    // MARK: - Palette Completeness

    func testEffectsAreAvailableInBothAppearances() {
        for appearance in [ColorScheme.light, .dark] {

            for token in DSGradientToken.allCases {
                let gradient = DSTheme.aurora.gradient(
                    for: token,
                    appearance: appearance
                )

                XCTAssertFalse(
                    gradient.startColor.hexString.isEmpty
                )
            }

            for token in DSShadowToken.allCases {
                let shadow = DSTheme.aurora.shadow(
                    for: token,
                    appearance: appearance
                )

                XCTAssertGreaterThanOrEqual(
                    shadow.radius,
                    0
                )
            }
        }
    }
}
