//
//  DSGradientValue.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import SwiftUI

public struct DSGradientValue: Sendable, Equatable {
    // MARK: - Properties
    public let startColor: DSColorValue
    public let endColor: DSColorValue
    public let angleDegrees: Double
    
    public init(
        startColor: DSColorValue,
        endColor: DSColorValue,
        angleDegrees: Double
    ) {
        
        precondition(
            angleDegrees.isFinite,
            "Gradient angle must be finite"
        )
        
        self.startColor = startColor
        self.endColor = endColor
        self.angleDegrees = angleDegrees
    }
    
    
    // MARK: - Direction
    private var direction: (start: UnitPoint, end: UnitPoint) {
        let radians = angleDegrees * .pi / 180

        let dx = sin(radians)
        let dy = -cos(radians)

        return (
            start: UnitPoint(
                x: 0.5 - dx * 0.5,
                y: 0.5 - dy * 0.5
            ),
            end: UnitPoint(
                x: 0.5 + dx * 0.5,
                y: 0.5 + dy * 0.5
            )
        )
    }
    
    
    // MARK: - SwiftUI Gradient

    public var gradient: LinearGradient {
        LinearGradient(
            colors: [
                startColor.color,
                endColor.color
            ],
            startPoint: direction.start,
            endPoint: direction.end
        )
    }
}
