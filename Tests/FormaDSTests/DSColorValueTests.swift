//
//  DSColorValueTests.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import XCTest
@testable import FormaDS

final class DSColorValueTests: XCTestCase {

    // MARK: - Hexadecimal Representation

    func testHexadecimalRepresentation() {
        let color = DSColorValue(hex: "#A18BFF")

        XCTAssertEqual(color.hex, "#A18BFF")
        XCTAssertEqual(color.hexString, "#A18BFF")
    }

    // MARK: - Hexadecimal Normalization

    func testLowercaseHexadecimalIsNormalized() {
        let color = DSColorValue(hex: "#a18bff")

        XCTAssertEqual(color.hexString, "#A18BFF")
    }

    // MARK: - RGB Conversion

    func testRGBConversion() {
        let color = DSColorValue(hex: "#FF8000")

        XCTAssertEqual(
            color.red,
            1.0,
            accuracy: 0.0001
        )

        XCTAssertEqual(
            color.green,
            128.0 / 255.0,
            accuracy: 0.0001
        )

        XCTAssertEqual(
            color.blue,
            0.0,
            accuracy: 0.0001
        )
    }

    // MARK: - Opacity

    func testOpacityIsPreserved() {
        let color = DSColorValue(
            hex: "#FFFFFF",
            alpha: 0.055
        )

        XCTAssertEqual(
            color.alpha,
            0.055,
            accuracy: 0.0001
        )

        XCTAssertEqual(
            color.alphaPercentage,
            5.5,
            accuracy: 0.0001
        )
    }

    // MARK: - Default Opacity

    func testDefaultOpacityIsOpaque() {
        let color = DSColorValue(hex: "#5B3DF5")

        XCTAssertEqual(color.alpha, 1.0)
    }
}
