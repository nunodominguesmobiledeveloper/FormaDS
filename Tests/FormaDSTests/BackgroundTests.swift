//
//  BackgroundTests.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import XCTest
import SwiftUI
@testable import FormaDS

// MARK: - Background Tests

final class BackgroundTests: XCTestCase {

    // MARK: - Layer Count

    func testAuroraHasThreeLayers() {
        let light = DSTheme.aurora.background(
            for: .light
        )

        let dark = DSTheme.aurora.background(
            for: .dark
        )

        XCTAssertEqual(light.glows.count, 3)
        XCTAssertEqual(dark.glows.count, 3)
    }

    // MARK: - Light Background

    func testAuroraLightColors() {
        let background = DSTheme.aurora.background(
            for: .light
        )

        XCTAssertEqual(
            background.glows[0].color.hexString,
            "#7C5CFF"
        )

        XCTAssertEqual(
            background.glows[1].color.hexString,
            "#3DD9EB"
        )

        XCTAssertEqual(
            background.glows[2].color.hexString,
            "#FF6FB5"
        )

        XCTAssertEqual(
            background.glows[0].color.alpha,
            0.32,
            accuracy: 0.0001
        )

        XCTAssertEqual(
            background.glows[1].color.alpha,
            0.22,
            accuracy: 0.0001
        )

        XCTAssertEqual(
            background.glows[2].color.alpha,
            0.24,
            accuracy: 0.0001
        )
    }

    // MARK: - Dark Background

    func testAuroraDarkOpacities() {
        let background = DSTheme.aurora.background(
            for: .dark
        )

        XCTAssertEqual(
            background.glows[0].color.alpha,
            0.75,
            accuracy: 0.0001
        )

        XCTAssertEqual(
            background.glows[1].color.alpha,
            0.34,
            accuracy: 0.0001
        )

        XCTAssertEqual(
            background.glows[2].color.alpha,
            0.38,
            accuracy: 0.0001
        )
    }

    // MARK: - Glow Positions

    func testUpperRightGlowPosition() {
        let background = DSTheme.aurora.background(
            for: .dark
        )

        let glow = background.glows[0]

        XCTAssertEqual(
            glow.centerX,
            1.05,
            accuracy: 0.0001
        )

        XCTAssertEqual(
            glow.centerY,
            -0.05,
            accuracy: 0.0001
        )
    }

    func testOtherGlowPositions() {
        let background = DSTheme.aurora.background(
            for: .dark
        )

        XCTAssertEqual(
            background.glows[1].centerX,
            -0.10,
            accuracy: 0.0001
        )

        XCTAssertEqual(
            background.glows[1].centerY,
            0.52,
            accuracy: 0.0001
        )

        XCTAssertEqual(
            background.glows[2].centerX,
            1.08,
            accuracy: 0.0001
        )

        XCTAssertEqual(
            background.glows[2].centerY,
            0.98,
            accuracy: 0.0001
        )
    }

    // MARK: - Base Background Colors

    func testAuroraBaseColors() {
        let light = DSTheme.aurora.value(
            for: .backgroundPrimary,
            appearance: .light
        )

        let dark = DSTheme.aurora.value(
            for: .backgroundPrimary,
            appearance: .dark
        )

        XCTAssertEqual(
            light.hexString,
            "#EEEBFF"
        )

        XCTAssertEqual(
            dark.hexString,
            "#0B0B1E"
        )
    }

    // MARK: - Background Differences

    func testAppearanceBackgroundsDiffer() {
        let light = DSTheme.aurora.background(
            for: .light
        )

        let dark = DSTheme.aurora.background(
            for: .dark
        )

        XCTAssertNotEqual(light, dark)
    }

    // MARK: - Minimal Background

    func testBackgroundCanHaveNoGlows() {
        let background = DSBackgroundValue()

        XCTAssertTrue(background.glows.isEmpty)
    }
}
