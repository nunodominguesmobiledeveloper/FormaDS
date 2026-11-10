//
//  File.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 09/11/2026.
//

import XCTest
import SwiftUI
@testable import FormaDS

final class MidnightGoldThemeTests: XCTestCase {

    // MARK: - Identity

    func testThemeIdentity() {
        XCTAssertEqual(
            DSTheme.midnightGold.id,
            "midnight-gold"
        )

        XCTAssertEqual(
            DSTheme.midnightGold.name,
            "Midnight Gold"
        )
    }

    func testThemeIsDistinct() {
        XCTAssertNotEqual(
            DSTheme.midnightGold.id,
            DSTheme.aurora.id
        )

        XCTAssertNotEqual(
            DSTheme.midnightGold.id,
            DSTheme.horizon.id
        )
    }

    // MARK: - Light & Dark

    func testBackgroundDiffersBetweenAppearances() {
        let theme = DSTheme.midnightGold

        let light = theme.value(
            for: .backgroundPrimary,
            appearance: .light
        )

        let dark = theme.value(
            for: .backgroundPrimary,
            appearance: .dark
        )

        XCTAssertNotEqual(
            light.hexString,
            dark.hexString
        )
    }

    func testAccentDiffersBetweenAppearances() {
        let theme = DSTheme.midnightGold

        let light = theme.value(
            for: .accentPrimary,
            appearance: .light
        )

        let dark = theme.value(
            for: .accentPrimary,
            appearance: .dark
        )

        XCTAssertNotEqual(
            light.hexString,
            dark.hexString
        )
    }

    // MARK: - Semantic Tokens

    func testEverySemanticColorResolves() {
        let theme = DSTheme.midnightGold

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
                    "Missing \(token) in \(appearance)"
                )
            }
        }
    }
}
