//
//  ShowcaseLanguage.swift
//  FormaDSShowcase
//

import Foundation

// MARK: - Showcase Language

enum ShowcaseLanguage: String, CaseIterable, Identifiable {
    case english = "en"
    case portuguesePortugal = "pt-PT"

    var id: String {
        rawValue
    }

    var title: LocalizedStringResource {
        switch self {
        case .english:
            "English"
        case .portuguesePortugal:
            "Português (Portugal)"
        }
    }

    var locale: Locale {
        Locale(identifier: rawValue)
    }
}
