//
//  FoundationMetricsTests.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import Foundation

import XCTest
@testable import FormaDS

// MARK: - Foundation Metrics Tests
final class FoundationMetricsTests: XCTestCase {
    
    // MARK: - Spacing
    func testSpacingScale() {
        XCTAssertEqual(DS.Spacing.xxSmall, 4)
        XCTAssertEqual(DS.Spacing.xSmall, 8)
        XCTAssertEqual(DS.Spacing.small, 12)
        XCTAssertEqual(DS.Spacing.regular, 16)
        XCTAssertEqual(DS.Spacing.large, 24)
        XCTAssertEqual(DS.Spacing.xLarge, 32)
    }
    
    // MARK: - Radius

    func testRadiusScale() {
        XCTAssertEqual(DS.Radius.small, 12)
        XCTAssertEqual(DS.Radius.medium, 20)
        XCTAssertEqual(DS.Radius.large, 28)
    }

    func testSemanticCardRadius() {
        XCTAssertEqual(
            DS.Radius.card,
            DS.Radius.large
        )
    }
    
    func testButtonDimensions() {
        XCTAssertEqual(
            DS.Sizes.Button.height,
            52
        )

        XCTAssertEqual(
            DS.Sizes.Button.smallHeight,
            44
        )

        XCTAssertEqual(
            DS.Sizes.IconButton.side,
            44
        )
    }

    // MARK: - Selection

    func testSelectionDimensions() {
        XCTAssertEqual(
            DS.Sizes.Chip.minimumHeight,
            44
        )

        XCTAssertEqual(
            DS.Sizes.SegmentedControl.minimumSegmentHeight,
            44
        )
    }

    // MARK: - Forms

    func testTextFieldDimensions() {
        XCTAssertEqual(
            DS.Sizes.TextField.minimumHeight,
            48
        )
    }

    // MARK: - Indicators

    func testProgressBarHeight() {
        XCTAssertEqual(
            DS.Sizes.ProgressBar.height,
            10
        )
    }

    // MARK: - Navigation

    func testTabBarHeight() {
        XCTAssertEqual(
            DS.Sizes.TabBar.height,
            68
        )
    }

    // MARK: - Icon Tile

    func testIconTileSize() {
        XCTAssertEqual(
            DS.Sizes.IconTile.side,
            34
        )
    }
}
