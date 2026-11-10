//
//  DSTypographyToken.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import SwiftUI

// MARK: - Typography Tokens

public enum DSTypographyToken:
    String,
    CaseIterable,
    Identifiable,
    Sendable {

    // MARK: - Body Text

    case caption
    case footnote
    case subtitle
    case body

    // MARK: - Headings

    case heading
    case titleSecondary
    case titlePrimary

    // MARK: - Display & Controls

    case displayNumber
    case button

    // MARK: - Identification

    public var id: String {
        rawValue
    }

    // MARK: - Base Font Size

    public var baseSize: CGFloat {
        switch self {
        case .caption:
            return 12

        case .footnote:
            return 13

        case .subtitle:
            return 15

        case .body, .button:
            return 17

        case .heading:
            return 20

        case .titleSecondary:
            return 24

        case .titlePrimary:
            return 34

        case .displayNumber:
            return 44
        }
    }

    // MARK: - PostScript Name

    public var postScriptName: String {
        switch self {
        case .caption,
             .footnote,
             .subtitle,
             .body:
            return "Manrope-Regular"

        case .button:
            return "Manrope-SemiBold"

        case .heading,
             .titleSecondary:
            return "Sora-SemiBold"

        case .titlePrimary,
             .displayNumber:
            return "Sora-Bold"
        }
    }

    // MARK: - Dynamic Type Reference

    public var relativeTextStyle: Font.TextStyle {
        switch self {
        case .caption:
            return .caption

        case .footnote:
            return .footnote

        case .subtitle:
            return .subheadline

        case .body, .button:
            return .body

        case .heading:
            return .title3

        case .titleSecondary:
            return .title2

        case .titlePrimary,
             .displayNumber:
            return .largeTitle
        }
    }

    // MARK: - Fallback Weight

    public var fallbackWeight: Font.Weight {
        switch self {
        case .caption,
             .footnote,
             .subtitle,
             .body:
            return .regular

        case .button,
             .heading,
             .titleSecondary:
            return .semibold

        case .titlePrimary,
             .displayNumber:
            return .bold
        }
    }

    // MARK: - SwiftUI Font

    public var font: Font {
        DSFontRegistry.font(
            postScriptName: postScriptName,
            size: baseSize,
            relativeTo: relativeTextStyle,
            fallbackWeight: fallbackWeight
        )
    }
}
