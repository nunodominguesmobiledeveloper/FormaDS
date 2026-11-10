//
//  DSRadialGlow.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import Foundation

// MARK: - Radial Glow
public struct DSRadialGlow: Sendable, Equatable {
    
    // MARK: - Properties
    public let color: DSColorValue
    public let centerX: Double
    public let centerY: Double
    public let radiusScale: Double
    
    
    // MARK: - Initialization
    public init(
        color: DSColorValue,
        centerX: Double,
        centerY: Double,
        radiusScale: Double
    ) {
        
        precondition(
            radiusScale.isFinite && radiusScale > 0,
            "Radial glow radius scale must be positive and finite."
        )
        
        self.color = color
        self.centerX = centerX
        self.centerY = centerY
        self.radiusScale = radiusScale
    }
}
