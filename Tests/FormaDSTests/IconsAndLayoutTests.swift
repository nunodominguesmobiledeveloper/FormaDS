//
//  IconsAndLayoutTests.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import XCTest
@testable import FormaDS

// MARK: - Icons And Layout Tests

final class IconsAndLayoutTests: XCTestCase {

    // MARK: - Icon Tokens

    func testAllIconsHaveSystemNames() {
        for token in DSIconToken.allCases {
            XCTAssertFalse(
                token.systemName.isEmpty
            )
        }
    }

    func testCoreIconMappings() {
        XCTAssertEqual(
            DS.Icons.home.systemName,
            "house"
        )

        XCTAssertEqual(
            DS.Icons.calendar.systemName,
            "calendar"
        )

        XCTAssertEqual(
            DS.Icons.add.systemName,
            "plus"
        )
    }

    // MARK: - Icon Sizes

    func testIconSizesUseTypographyScale() {
        XCTAssertEqual(
            DSIconSize.small.pointSize,
            DSTypographyToken.subtitle.baseSize
        )

        XCTAssertEqual(
            DSIconSize.regular.pointSize,
            DSTypographyToken.body.baseSize
        )

        XCTAssertEqual(
            DSIconSize.large.pointSize,
            DSTypographyToken.heading.baseSize
        )
    }

    // MARK: - Layout

    func testScreenPaddingUsesSpacingTokens() {
        XCTAssertEqual(
            DS.Layout.screenHorizontalPadding,
            DS.Spacing.regular
        )
    }

    func testSectionSpacing() {
        XCTAssertEqual(
            DS.Layout.sectionSpacing,
            DS.Spacing.large
        )
    }

    func testContentSpacing() {
        XCTAssertEqual(
            DS.Layout.contentSpacing,
            DS.Spacing.regular
        )
    }

    func testRelatedItemSpacing() {
        XCTAssertEqual(
            DS.Layout.itemSpacing,
            DS.Spacing.small
        )
    }

    func testCompactSpacing() {
        XCTAssertEqual(
            DS.Layout.compactSpacing,
            DS.Spacing.xSmall
        )
    }
}
