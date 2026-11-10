//
//  DSThemeModifier.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import SwiftUI

// MARK: - Theme Modifier
public extension View {
    
    // MARK: - Apply Theme

    func dsTheme(
        _ theme: DSTheme
    ) -> some View {
        environment(
            \.dsTheme,
            theme
        )
    }
}


