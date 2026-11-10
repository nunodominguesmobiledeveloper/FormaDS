//
//  DSThemePalette.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 25/10/2026.
//

import SwiftUI

// MARK: - Theme Palette
public struct DSThemePalette: Sendable {
    
    // MARK: - Properties
    private let values: [DSColorToken: DSColorValue]
    
    
    // MARK: - Initialization
    public init(
        values: [DSColorToken : DSColorValue]
    ) {
        let requiredTokens = Set(DSColorToken.allCases)
        let providedTokens = Set(values.keys)
        
        let missingTokens = requiredTokens.subtracting(providedTokens)
        
        precondition(
            missingTokens.isEmpty,
            "Theme palette is missing tokens: \(missingTokens)"
        )
        
        self.values = values
    }
    
    
    // MARK: - Value Resolution
    public func value(for token: DSColorToken) -> DSColorValue {
        guard let value = values[token] else {
            preconditionFailure("Missing color token: \(token)")
        }

        return value
    }
    
    // MARK: - SwiftUI Color
    public func color(for token: DSColorToken) -> Color {
        value(for: token).color
    }
}

