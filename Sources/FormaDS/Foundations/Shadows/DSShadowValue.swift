//
//  DSShadowValue.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import SwiftUI

// MARK: - Shadow Value

public struct DSShadowValue: Sendable, Equatable {

    // MARK: - Properties

    public let color: DSColorValue
    public let radius: CGFloat
    public let x: CGFloat
    public let y: CGFloat

    // MARK: - Initialization

    public init(
        color: DSColorValue,
        radius: CGFloat,
        x: CGFloat = 0,
        y: CGFloat = 0
    ) {
        precondition(
            radius.isFinite && radius >= 0,
            "Shadow radius must be finite and non-negative."
        )

        precondition(
            x.isFinite && y.isFinite,
            "Shadow offsets must be finite."
        )

        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
}


