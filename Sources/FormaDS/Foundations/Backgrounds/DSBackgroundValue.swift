//
//  DSBackgroundValue.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import Foundation

// MARK: - Background Value
public struct DSBackgroundValue: Sendable, Equatable {
    
    // MARK: - Properties
    public let glows: [DSRadialGlow]
    
    // MARK: - Initialization
    public init(
        glows: [DSRadialGlow] = []
    ) {
        self.glows = glows
    }
}
