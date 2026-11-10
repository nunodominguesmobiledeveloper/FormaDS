//
//  DSThemePalette.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 25/10/2026.
//

import SwiftUI

// MARK: - Theme Palette
/// A complete mapping between FormaDS semantic color tokens and color values.
///
/// Custom themes must provide a value for every case in `DSColorToken.allCases`.
/// Incomplete palettes fail immediately during initialization so that missing
/// semantic colors cannot produce a partially themed interface.
public struct DSThemePalette: Sendable {
    
    // MARK: - Properties
    private let values: [DSColorToken: DSColorValue]
    
    
    // MARK: - Initialization
    /// Creates a complete semantic color palette.
    ///
    /// - Precondition: `values` contains every token in
    ///   `DSColorToken.allCases`.
    public init(
        values: [DSColorToken: DSColorValue]
    ) {
        let missingTokens = Self.missingTokens(in: values)

        precondition(
            missingTokens.isEmpty,
            "Theme palette must define every semantic color token. Missing: "
                + missingTokens.map(\.rawValue).joined(separator: ", ")
        )

        self.values = values
    }

    static func missingTokens(
        in values: [DSColorToken: DSColorValue]
    ) -> [DSColorToken] {
        let providedTokens = Set(values.keys)

        return DSColorToken.allCases
            .filter { !providedTokens.contains($0) }
            .sorted { $0.rawValue < $1.rawValue }
    }
    
    
    // MARK: - Value Resolution
    public func value(for token: DSColorToken) -> DSColorValue {
        guard let value = values[token] else {
            preconditionFailure(
                "Theme palette contract violation: missing color token "
                    + "'\(token.rawValue)'."
            )
        }

        return value
    }
    
    // MARK: - SwiftUI Color
    public func color(for token: DSColorToken) -> Color {
        value(for: token).color
    }
}
