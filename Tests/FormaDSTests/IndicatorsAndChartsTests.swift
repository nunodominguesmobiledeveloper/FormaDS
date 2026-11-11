//
//  IndicatorsAndChartsTests.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 02/11/2026.
//

import XCTest
@testable import FormaDS

// MARK: - Indicators And Charts Tests

final class IndicatorsAndChartsTests: XCTestCase {

    func testProgressNormalization() {
        XCTAssertEqual(DSProgressNormalization.normalize(0), 0)
        XCTAssertEqual(DSProgressNormalization.normalize(1), 1)
        XCTAssertEqual(DSProgressNormalization.normalize(-0.5), 0)
        XCTAssertEqual(DSProgressNormalization.normalize(0.5), 0.5)
        XCTAssertEqual(DSProgressNormalization.normalize(1.5), 1)
        XCTAssertEqual(DSProgressNormalization.normalize(.infinity), 0)
        XCTAssertEqual(DSProgressNormalization.normalize(-.infinity), 0)
        XCTAssertEqual(DSProgressNormalization.normalize(.nan), 0)
    }

    // MARK: - Progress Normalization

    func testNormalProgress() {
        let item = makeProgressItem(value: 0.75)

        XCTAssertEqual(
            item.displayProgress,
            0.75
        )

        XCTAssertEqual(
            item.percentage,
            75
        )
    }

    func testProgressAboveMaximum() {
        let item = makeProgressItem(value: 1.5)

        XCTAssertEqual(
            item.displayProgress,
            1
        )

        XCTAssertEqual(
            item.percentage,
            150
        )
    }

    func testProgressItemEqualityUsesIdentifierOnly() {
        let original = makeProgressItem(value: 0.25)
        let updated = makeProgressItem(value: 0.75)

        XCTAssertEqual(original, updated)
        XCTAssertEqual(Set([original, updated]).count, 1)
    }

    func testNegativeProgress() {
        let item = makeProgressItem(value: -0.25)

        XCTAssertEqual(
            item.displayProgress,
            0
        )

        XCTAssertEqual(
            item.percentage,
            -25
        )
    }

    func testProgressAccessibilityDescriptionUsesClampedPercentage() {
        let item = makeProgressItem(value: 1.5)

        XCTAssertEqual(
            item.accessibilityDescription(locale: Locale(identifier: "en_US")),
            "Tasks, Test data, 100%"
        )
    }

    // MARK: - Concentric Ring Geometry

    func testConcentricRingDimensions() {
        XCTAssertEqual(
            DS.Sizes.Indicators.ConcentricRings.side,
            170
        )

        XCTAssertEqual(
            DS.Sizes.Indicators.ConcentricRings.lineWidth,
            12
        )

        XCTAssertEqual(
            DS.Sizes.Indicators.ConcentricRings.outerRadius,
            76
        )

        XCTAssertEqual(
            DS.Sizes.Indicators.ConcentricRings.middleRadius,
            58
        )

        XCTAssertEqual(
            DS.Sizes.Indicators.ConcentricRings.innerRadius,
            40
        )
    }

    func testRingRadiiAreOrdered() {
        let rings = DS.Sizes.Indicators.ConcentricRings.self

        XCTAssertGreaterThan(
            rings.outerRadius,
            rings.middleRadius
        )

        XCTAssertGreaterThan(
            rings.middleRadius,
            rings.innerRadius
        )
    }

    func testConcentricRingCenterContentFitsInsideInnerRing() {
        let rings = DS.Sizes.Indicators.ConcentricRings.self

        XCTAssertEqual(
            DSConcentricProgressRingLayout.centerContentSide,
            rings.innerRadius * 2 - rings.lineWidth
        )
        XCTAssertGreaterThan(
            DSConcentricProgressRingLayout.centerContentSide,
            0
        )
        XCTAssertLessThan(
            DSConcentricProgressRingLayout.centerContentSide,
            rings.innerRadius * 2
        )
    }

    // MARK: - Progress Bar

    func testProgressBarHeight() {
        XCTAssertEqual(
            DS.Sizes.ProgressBar.height,
            10
        )
    }

    // MARK: - Chart Data

    func testChartItemIdentity() {
        let item = DSBarChartItem(
            id: "monday",
            label: "Seg",
            value: 5,
            isHighlighted: true
        )

        XCTAssertEqual(item.id, "monday")
        XCTAssertEqual(item.label, "Seg")
        XCTAssertEqual(item.value, 5)
        XCTAssertTrue(item.isHighlighted)
    }

    func testChartItemEqualityUsesIdentifierOnly() {
        let original = DSBarChartItem(
            id: "monday",
            label: "Monday",
            value: 2
        )
        let updated = DSBarChartItem(
            id: "monday",
            label: "Segunda-feira",
            value: 5,
            isHighlighted: true
        )

        XCTAssertEqual(original, updated)
        XCTAssertEqual(Set([original, updated]).count, 1)
    }

    func testWeeklyChartHeight() {
        XCTAssertEqual(
            DS.Sizes.Charts.weeklyPlotHeight,
            100
        )
    }

    func testChartValues() {
        let items: [DSBarChartItem] = [
            .init(id: "a", label: "Seg", value: 2),
            .init(id: "b", label: "Ter", value: 5),
            .init(id: "c", label: "Qua", value: 3)
        ]

        XCTAssertEqual(
            items.map(\.value).max(),
            5
        )

        XCTAssertEqual(
            items.reduce(0) { $0 + $1.value },
            10
        )
    }

    func testChartScaleHandlesEmptyAndSingleItemCollections() {
        XCTAssertEqual(DSBarChartScale.maximumValue(for: []), 1)

        let item = DSBarChartItem(id: "only", label: "Only", value: 42)
        XCTAssertEqual(DSBarChartScale.maximumValue(for: [item]), 42)
    }

    func testChartScaleHandlesZeroAndLargeValues() {
        XCTAssertEqual(
            DSBarChartScale.barHeight(value: 0, maximumValue: 1),
            0
        )
        XCTAssertEqual(
            DSBarChartScale.barHeight(
                value: 1_000_000,
                maximumValue: 1_000_000
            ),
            DS.Sizes.Charts.weeklyPlotHeight
        )
        XCTAssertEqual(
            DSBarChartScale.barHeight(value: 2, maximumValue: 1),
            DS.Sizes.Charts.weeklyPlotHeight
        )
    }

    func testChartScaleRejectsNonFiniteAndNegativeValues() {
        XCTAssertEqual(DSBarChartScale.barHeight(value: -1, maximumValue: 1), 0)
        XCTAssertEqual(DSBarChartScale.barHeight(value: .infinity, maximumValue: 1), 0)
        XCTAssertEqual(DSBarChartScale.barHeight(value: .nan, maximumValue: 1), 0)
        XCTAssertEqual(DSBarChartScale.barHeight(value: 1, maximumValue: .infinity), 0)
        XCTAssertEqual(DSBarChartScale.barHeight(value: 1, maximumValue: .nan), 0)
    }

    func testChartScalePreservesMinimumVisibleBarHeight() {
        XCTAssertEqual(
            DSBarChartScale.barHeight(value: 0.001, maximumValue: 100),
            DS.Sizes.Charts.minimumBarHeight
        )
    }

    // MARK: - Helper

    private func makeProgressItem(
        value: Double
    ) -> DSProgressItem {
        DSProgressItem(
            id: "tasks",
            title: "Tasks",
            detail: "Test data",
            value: value,
            color: .accentPrimary
        )
    }
}
