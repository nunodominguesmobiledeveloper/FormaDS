//
//  DSProgressItem.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 02/11/2026.
//

import SwiftUI

public struct DSProgressItem: Identifiable, Hashable, Sendable {
    
    // MARK: - Properties
    public let id: String
    public let title: LocalizedStringResource
    public let detail: LocalizedStringResource
    public let value: Double
    public let color: DSColorToken
    
    public init(
        id: String,
        title: LocalizedStringResource,
        detail: LocalizedStringResource,
        value: Double,
        color: DSColorToken
    ) {
        precondition(
            value.isFinite,
            "Progress must be a finite number"
        )
        
        self.id = id
        self.title = title
        self.detail = detail
        self.value = value
        self.color = color
    }
    
    // MARK: - Display Progress
    public var displayProgress: Double {
        min(max(value, 0), 1)
    }
    
    // MARK: - Percentage
    public var percentage: Double {
        value * 100
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


