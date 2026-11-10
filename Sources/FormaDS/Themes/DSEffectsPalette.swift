//
//  DSEffectsPalette.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import Foundation

// MARK: - Effects Palette

public struct DSEffectsPalette: Sendable {

    // MARK: - Properties

    public let primaryActionGradient: DSGradientValue
    public let primaryActionShadow: DSShadowValue

    // MARK: - Initialization

    public init(
        primaryActionGradient: DSGradientValue,
        primaryActionShadow: DSShadowValue
    ) {
        self.primaryActionGradient = primaryActionGradient
        self.primaryActionShadow = primaryActionShadow
    }

    // MARK: - Gradient Resolution

    public func gradient(
        for token: DSGradientToken
    ) -> DSGradientValue {
        switch token {
        case .primaryAction:
            return primaryActionGradient
        }
    }

    // MARK: - Shadow Resolution

    public func shadow(
        for token: DSShadowToken
    ) -> DSShadowValue {
        switch token {
        case .primaryAction:
            return primaryActionShadow
        }
    }
}
