//
//  DSSelectionOption.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 28/10/2026.
//

import Foundation

// MARK: - Selection Option

/// An option whose identity and equality are defined exclusively by `value`.
///
/// Titles may change without changing the identity SwiftUI uses to preserve
/// selection and view state.
public struct DSSelectionOption<Value: Hashable & Sendable>:
    Identifiable,
    Hashable,
    Sendable {

    // MARK: - Properties

    public let value: Value
    public let title: LocalizedStringResource

    // MARK: - Identification

    public var id: Value {
        value
    }

    // MARK: - Initialization

    public init(
        value: Value,
        title: LocalizedStringResource
    ) {
        self.value = value
        self.title = title
    }

    public static func == (
        lhs: DSSelectionOption<Value>,
        rhs: DSSelectionOption<Value>
    ) -> Bool {
        lhs.value == rhs.value
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}
