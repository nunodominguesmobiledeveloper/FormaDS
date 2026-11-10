//
//  ShowcaseThemeOption.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 09/11/2026.
//

import Foundation
import FormaDS

// MARK: - Showcase Theme Option

enum ShowcaseThemeOption:
    String,
    CaseIterable,
    Identifiable,
    Hashable,
    Sendable {

    // MARK: - Themes

    case aurora
    case horizon
    case midnightGold

    // MARK: - Identity

    var id: String {
        rawValue
    }

    // MARK: - Title

    var title: LocalizedStringResource {
        switch self {
        case .aurora:
            return "Aurora"

        case .horizon:
            return "Horizon"

        case .midnightGold:
            return "Midnight Gold"
        }
    }

    // MARK: - Subtitle

    var subtitle: LocalizedStringResource {
        switch self {
        case .aurora:
            return "Violet, cyan and glass"

        case .horizon:
            return "Teal, blue and calm surfaces"

        case .midnightGold:
            return "Midnight blue and elegant gold"
        }
    }

    // MARK: - Design System Theme

    var theme: DSTheme {
        switch self {
        case .aurora:
            return .aurora

        case .horizon:
            return .horizon

        case .midnightGold:
            return .midnightGold
        }
    }
}
