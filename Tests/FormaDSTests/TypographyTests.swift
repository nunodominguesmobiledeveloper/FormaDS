//
//  TypographyTests.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import XCTest
@testable import FormaDS

// MARK: - Typography Tests

final class TypographyTests: XCTestCase {

    // MARK: - Font Registration

    func testFontResourcesCanBeRegistered() {
        XCTAssertTrue(
            DSFontRegistry.registerFonts()
        )
    }

    // MARK: - Available Fonts

    func testRequiredPostScriptNamesAreAvailable() {
        let requiredNames = [
            "Sora-Regular",
            "Sora-SemiBold",
            "Sora-Bold",
            "Manrope-Regular",
            "Manrope-Medium",
            "Manrope-SemiBold",
            "Manrope-Bold"
        ]

        for name in requiredNames {
            XCTAssertTrue(
                DSFontRegistry.isRegistered(
                    postScriptName: name
                ),
                "Missing PostScript name: \(name)"
            )
        }
    }

    // MARK: - Base Sizes

    func testTypographyScale() {
        XCTAssertEqual(
            DSTypographyToken.caption.baseSize,
            12
        )

        XCTAssertEqual(
            DSTypographyToken.footnote.baseSize,
            13
        )

        XCTAssertEqual(
            DSTypographyToken.subtitle.baseSize,
            15
        )

        XCTAssertEqual(
            DSTypographyToken.body.baseSize,
            17
        )

        XCTAssertEqual(
            DSTypographyToken.heading.baseSize,
            20
        )

        XCTAssertEqual(
            DSTypographyToken.titleSecondary.baseSize,
            24
        )

        XCTAssertEqual(
            DSTypographyToken.titlePrimary.baseSize,
            34
        )

        XCTAssertEqual(
            DSTypographyToken.displayNumber.baseSize,
            44
        )

        XCTAssertEqual(
            DSTypographyToken.button.baseSize,
            17
        )
    }

    // MARK: - Font Families

    func testBodyUsesManrope() {
        XCTAssertEqual(
            DSTypographyToken.body.postScriptName,
            "Manrope-Regular"
        )
    }

    func testHeadingsUseSora() {
        XCTAssertEqual(
            DSTypographyToken.titlePrimary.postScriptName,
            "Sora-Bold"
        )
    }

    func testButtonUsesManropeSemibold() {
        XCTAssertEqual(
            DSTypographyToken.button.postScriptName,
            "Manrope-SemiBold"
        )
    }

    // MARK: - Token Integrity

    func testAllTokensHaveValidBaseSizes() {
        for token in DSTypographyToken.allCases {
            XCTAssertGreaterThan(token.baseSize, 0)
            XCTAssertFalse(token.postScriptName.isEmpty)
        }
    }

    // MARK: - Public Namespace

    func testTypographyNamespaceIsAccessible() {
        _ = DS.Typography.caption
        _ = DS.Typography.footnote
        _ = DS.Typography.subtitle
        _ = DS.Typography.body
        _ = DS.Typography.heading
        _ = DS.Typography.titleSecondary
        _ = DS.Typography.titlePrimary
        _ = DS.Typography.displayNumber
        _ = DS.Typography.button
    }
}
