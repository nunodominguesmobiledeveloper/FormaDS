//
//  DSCardStyle.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import Foundation

// MARK: - Card Style

public enum DSCardStyle:
    String,
    CaseIterable,
    Hashable,
    Sendable {

    // MARK: - Variants

    case standard
    case elevated
    case selected

    // MARK: - Background Token

    public var backgroundColor: DSColorToken {
        switch self {
        case .standard:
            return .surfaceCard

        case .elevated:
            return .surfaceElevated

        case .selected:
            return .surfaceSelected
        }
    }

    // MARK: - Border Token

    public var borderColor: DSColorToken {
        .borderCard
    }
}
