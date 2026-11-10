//
//  DSIconToken.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import Foundation

// MARK: - Semantic Icon Tokens
public enum DSIconToken: String, CaseIterable, Identifiable, Hashable, Sendable {
    
    // MARK: - Navigation
    case home
    case calendar
    case tasks
    case habits
    case finance
    case places
    case documents
    case statistics
    case settings
    case more
    
    // MARK: - Actions
    case add
    case edit
    case delete
    case search
    case filter
    case close
    case back
    case forward
    case share
    case refresh
    
    // MARK: - States & Feedback

    case check
    case completed
    case warning
    case error
    case information
    case notification

    // MARK: - Utilities

    case clock
    case location
    case heart
    case star
    case person
    case lock
    case visibility
    case visibilityOff
    
    // MARK: - Identification
    public var id: String {
        rawValue
    }
    
    // MARK: - SF Symbol Mapping
    public var systemName: String {
        switch self {
            // MARK: Navigation

            case .home:
                return "house"

            case .calendar:
                return "calendar"

            case .tasks:
                return "checklist"

            case .habits:
                return "repeat"

            case .finance:
                return "eurosign.circle"

            case .places:
                return "map"

            case .documents:
                return "doc.text"

            case .statistics:
                return "chart.bar"

            case .settings:
                return "gearshape"

            case .more:
                return "ellipsis"

            // MARK: Actions

            case .add:
                return "plus"

            case .edit:
                return "pencil"

            case .delete:
                return "trash"

            case .search:
                return "magnifyingglass"

            case .filter:
                return "line.3.horizontal.decrease"

            case .close:
                return "xmark"

            case .back:
                return "chevron.left"

            case .forward:
                return "chevron.right"

            case .share:
                return "square.and.arrow.up"

            case .refresh:
                return "arrow.clockwise"

            // MARK: States & Feedback

            case .check:
                return "checkmark"

            case .completed:
                return "checkmark.circle.fill"

            case .warning:
                return "exclamationmark.triangle"

            case .error:
                return "xmark.circle"

            case .information:
                return "info.circle"

            case .notification:
                return "bell"

            // MARK: Utilities

            case .clock:
                return "clock"

            case .location:
                return "location"

            case .heart:
                return "heart"

            case .star:
                return "star"

            case .person:
                return "person.crop.circle"

            case .lock:
                return "lock"

            case .visibility:
                return "eye"

            case .visibilityOff:
                return "eye.slash"
        }
    }
    
}
