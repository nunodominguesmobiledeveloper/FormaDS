//
//  SwiftUIView.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 31/10/2026.
//

import XCTest
@testable import FormaDS

// MARK: - Form Components Tests

final class FormComponentsTests: XCTestCase {

    // MARK: - Text Field Dimensions

    func testTextFieldDimensions() {
        XCTAssertEqual(
            DS.Sizes.TextField.minimumHeight,
            48
        )

        XCTAssertEqual(
            DS.Sizes.TextField.cornerRadius,
            14
        )

        XCTAssertEqual(
            DS.Sizes.TextField.horizontalPadding,
            14
        )
    }

    // MARK: - Search Field

    func testSearchFieldCornerRadius() {
        XCTAssertEqual(
            DS.Sizes.TextField.searchCornerRadius,
            16
        )
    }

    // MARK: - Border Width

    func testBorderWidths() {
        XCTAssertEqual(
            DS.Sizes.TextField.borderWidth,
            1
        )

        XCTAssertEqual(
            DS.Sizes.TextField.focusedBorderWidth,
            2
        )
    }

    // MARK: - Text Editor

    func testMultilineMinimumHeight() {
        XCTAssertEqual(
            DS.Sizes.TextField.multilineMinimumHeight,
            92
        )
    }

    // MARK: - Validation States

    func testNormalStateHasNoError() {
        XCTAssertFalse(
            DSFormFieldState.normal.hasError
        )
    }

    func testErrorStateHasError() {
        XCTAssertTrue(
            DSFormFieldState.error.hasError
        )
    }

    // MARK: - Dimensions Integrity

    func testFormDimensionsArePositive() {
        XCTAssertGreaterThan(
            DS.Sizes.TextField.minimumHeight,
            0
        )

        XCTAssertGreaterThan(
            DS.Sizes.TextField.cornerRadius,
            0
        )

        XCTAssertGreaterThan(
            DS.Sizes.TextField.multilineMinimumHeight,
            0
        )
    }
}
