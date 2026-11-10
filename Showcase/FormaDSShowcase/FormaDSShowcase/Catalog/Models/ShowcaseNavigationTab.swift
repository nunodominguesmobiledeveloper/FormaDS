//
//  ShowcaseNavigationTab.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 09/11/2026.
//

import Foundation

// MARK: - Showcase Navigation Tab

enum ShowcaseNavigationTab:
    String,
    CaseIterable,
    Identifiable,
    Hashable,
    Sendable {

    // MARK: - Destinations

    case today
    case tasks
    case habits
    case finance
    case more

    // MARK: - Identification

    var id: String {
        rawValue
    }

    // MARK: - Title

    var title: LocalizedStringResource {
        switch self {
        case .today:
            return "Today"

        case .tasks:
            return "Tasks"

        case .habits:
            return "Habits"

        case .finance:
            return "Finance"

        case .more:
            return "More"
        }
    }

    // MARK: - SF Symbol

    var systemName: String {
        switch self {
        case .today:
            return "sun.max"

        case .tasks:
            return "checklist"

        case .habits:
            return "repeat"

        case .finance:
            return "eurosign.circle"

        case .more:
            return "ellipsis"
        }
    }
}
