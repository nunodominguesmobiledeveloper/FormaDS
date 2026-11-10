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
}
