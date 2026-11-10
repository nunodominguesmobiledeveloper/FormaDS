//
//  File.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 28/10/2026.
//

import XCTest
import SwiftUI
@testable import FormaDS

// MARK: - Card Components Tests

final class CardComponentsTests: XCTestCase {

    // MARK: - Card Dimensions

    func testCardDimensions() {
        XCTAssertEqual(
            DS.Sizes.Card.borderWidth,
            1
        )

        XCTAssertEqual(
            DS.Sizes.Card.contentPadding,
            DS.Spacing.regular
        )

        XCTAssertEqual(
            DS.Radius.card,
            28
        )
    }

    // MARK: - Icon Tile Dimensions

    func testIconTileDimensions() {
        XCTAssertEqual(
            DS.Sizes.IconTile.side,
            34
        )

        XCTAssertEqual(
            DS.Sizes.IconTile.cornerRadius,
            10
        )
    }

    // MARK: - Card Styles

    func testStandardCardStyle() {
        XCTAssertEqual(
            DSCardStyle.standard.backgroundColor,
            .surfaceCard
        )

        XCTAssertEqual(
            DSCardStyle.standard.borderColor,
            .borderCard
        )
    }

    func testElevatedCardStyle() {
        XCTAssertEqual(
            DSCardStyle.elevated.backgroundColor,
            .surfaceElevated
        )
    }

    func testSelectedCardStyle() {
        XCTAssertEqual(
            DSCardStyle.selected.backgroundColor,
            .surfaceSelected
        )
    }

    // MARK: - Style Completeness

    func testCardStylesHaveUniqueIdentifiers() {
        let identifiers = DSCardStyle.allCases.map(\.rawValue)

        XCTAssertEqual(
            identifiers.count,
            Set(identifiers).count
        )
    }

    // MARK: - Semantic Colors

    func testCardColorsExistInAurora() {
        for appearance in [
            ColorScheme.light,
            ColorScheme.dark
        ] {
            for style in DSCardStyle.allCases {
                let background = DSTheme.aurora.value(
                    for: style.backgroundColor,
                    appearance: appearance
                )

                let border = DSTheme.aurora.value(
                    for: style.borderColor,
                    appearance: appearance
                )

                XCTAssertFalse(background.hexString.isEmpty)
                XCTAssertFalse(border.hexString.isEmpty)
            }
        }
    }
}
