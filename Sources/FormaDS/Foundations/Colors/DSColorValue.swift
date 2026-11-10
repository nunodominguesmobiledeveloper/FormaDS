//
//  DSColorValue.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 25/10/2026.
//

import SwiftUI

// MARK: - Color Value

public struct DSColorValue: Sendable, Equatable {

    // MARK: - Properties

    public let hex: String

    public let red: Double
    public let green: Double
    public let blue: Double
    public let alpha: Double

    // MARK: - Initialization

    public init(
        hex: String,
        alpha: Double = 1.0
    ) {
        // MARK: Validate Hexadecimal

        let isValidFormat =
            hex.hasPrefix("#") &&
            hex.count == 7

        let rgb = isValidFormat
            ? UInt32(hex.dropFirst(), radix: 16)
            : nil

        precondition(
            rgb != nil,
            "Invalid hexadecimal color: \(hex). Expected #RRGGBB format."
        )

        precondition(
            alpha.isFinite && (0...1).contains(alpha),
            "Color alpha must be between 0 and 1."
        )

        let value = rgb!

        // MARK: Store Hexadecimal

        self.hex = hex.uppercased()

        // MARK: Extract RGB Components

        self.red = Double((value >> 16) & 0xFF) / 255.0
        self.green = Double((value >> 8) & 0xFF) / 255.0
        self.blue = Double(value & 0xFF) / 255.0

        // MARK: Store Opacity

        self.alpha = alpha
    }

    // MARK: - SwiftUI Color

    public var color: Color {
        Color(
            .sRGB,
            red: red,
            green: green,
            blue: blue,
            opacity: alpha
        )
    }

    // MARK: - Hexadecimal Representation

    public var hexString: String {
        hex
    }

    // MARK: - Opacity

    public var alphaPercentage: Double {
        alpha * 100.0
    }
}
