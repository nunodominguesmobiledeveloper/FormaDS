//
//  DSFormFieldState.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 28/10/2026.
//

import Foundation

// MARK: - Form Field State
public enum DSFormFieldState: Hashable, Sendable {
    
    // MARK: - Cases
    case normal
    case error
    
    // MARK: - Properties
    public var hasError: Bool {
        self == .error
    }
}
