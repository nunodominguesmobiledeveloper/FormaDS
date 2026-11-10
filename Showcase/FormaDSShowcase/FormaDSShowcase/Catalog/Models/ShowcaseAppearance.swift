//
//  ShowcaseAppearance.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 25/10/2026.
//

import SwiftUI

// MARK: - Showcase Appearance
enum ShowcaseAppearance: String, CaseIterable, Identifiable {
    case system
    case light
    case dark
    
    // MARK: - Identification
    var id: String {
        rawValue
    }
    
    // MARK: - Presentation
    var title: LocalizedStringResource {
        switch self {
        case .system:
            return "System"
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        }
    }
    
    var symbol: String {
        switch self {
        case .system:
            return "iphone"
        case .light:
            return "sun.max"
        case .dark:
            return "moon"
        }
    }
    
    // MARK: - Color Scheme
    var colorScheme: ColorScheme? {
        switch self {
        case .system:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
