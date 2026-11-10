//
//  DSThemeEnvironment.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import SwiftUI

// MARK: - Theme Environment Key

private struct DSThemeKey: EnvironmentKey {
    
    // MARK: - Default Theme
    static let defaultValue: DSTheme = .aurora
}

// MARK: - Environment Values
public extension EnvironmentValues {
    
    var dsTheme: DSTheme {
        get {
            self[DSThemeKey.self]
        }
        set {
            self[DSThemeKey.self] = newValue
        }
    }
}

