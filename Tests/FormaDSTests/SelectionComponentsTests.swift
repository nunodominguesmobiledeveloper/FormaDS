//
//  SelectionComponents.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 28/10/2026.
//

import XCTest
@testable import FormaDS

// MARK: - Selection Components Tests

final class SelectionComponentsTests: XCTestCase {

    // MARK: - Button Sizes

    func testButtonSizes() {
        XCTAssertEqual(
            DSButtonSize.regular.minimumHeight,
            DS.Sizes.Button.height
        )

        XCTAssertEqual(
            DSButtonSize.small.minimumHeight,
            DS.Sizes.Button.smallHeight
        )
    }

    // MARK: - Button Variants

    func testButtonVariants() {
        XCTAssertEqual(
            Set(DSButtonVariant.allCases),
            Set([.primary, .secondary])
        )
    }

    // MARK: - Icon Button

    func testIconButtonSize() {
        XCTAssertEqual(
            DS.Sizes.IconButton.side,
            44
        )
    }

    // MARK: - Chip

    func testChipDimensions() {
        XCTAssertEqual(
            DS.Sizes.Chip.minimumHeight,
            40
        )

        XCTAssertEqual(
            DS.Sizes.Chip.horizontalPadding,
            14
        )
    }

    // MARK: - Segmented Control

    func testSegmentedControlDimensions() {
        XCTAssertEqual(
            DS.Sizes.SegmentedControl.minimumSegmentHeight,
            40
        )

        XCTAssertEqual(
            DS.Sizes.SegmentedControl.cornerRadius,
            14
        )

        XCTAssertEqual(
            DS.Sizes.SegmentedControl.contentPadding,
            3
        )

        XCTAssertEqual(
            DS.Sizes.SegmentedControl.selectedCornerRadius,
            11
        )
    }

    // MARK: - Selection Options

    func testSelectionOptionIdentity() {
        let option = DSSelectionOption(
            value: "week",
            title: "Semana"
        )

        XCTAssertEqual(option.id, "week")
        XCTAssertEqual(option.title, "Semana")
    }

    func testSelectionOptionsSupportEnums() {
        enum Period: Hashable, Sendable {
            case day
            case week
        }

        let options: [DSSelectionOption<Period>] = [
            .init(value: .day, title: "Dia"),
            .init(value: .week, title: "Semana")
        ]

        XCTAssertEqual(options.count, 2)
        XCTAssertEqual(options[1].value, .week)
    }
}
