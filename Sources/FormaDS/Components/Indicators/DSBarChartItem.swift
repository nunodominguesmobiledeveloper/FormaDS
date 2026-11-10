//
//  DSBarChartItem.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 02/11/2026.
//

import Foundation

// MARK: - Bar Chart Item

/// A chart entry whose identity and equality are defined exclusively by `id`.
///
/// Labels, values, and highlighting may change without replacing the
/// corresponding chart element in SwiftUI.
public struct DSBarChartItem:
    Identifiable,
    Hashable,
    Sendable {

    // MARK: - Properties

    public let id: String
    public let label: LocalizedStringResource
    public let value: Double
    public let isHighlighted: Bool

    // MARK: - Initialization

    public init(
        id: String,
        label: LocalizedStringResource,
        value: Double,
        isHighlighted: Bool = false
    ) {
        precondition(
            value.isFinite && value >= 0,
            "Chart values must be finite and non-negative."
        )

        self.id = id
        self.label = label
        self.value = value
        self.isHighlighted = isHighlighted
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
