//
//  DSButtonStyle.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 28/10/2026.
//

import CoreGraphics

// MARK: - Button Variant
public enum DSButtonVariant:
    String,
        CaseIterable,
        Hashable,
        Sendable {
    
    case primary
    case secondary
}


// MARK: - Button Size
public enum DSButtonSize: String, CaseIterable, Hashable, Sendable {
    case regular
    case small
    
    // MARK: - Minimum Height
    public var minimumHeight: CGFloat {
        switch self {
        case .regular:
                return DS.Sizes.Button.height
            case .small:
                return DS.Sizes.Button.smallHeight
        }
    }
}
