//
//  DSIcon.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import SwiftUI

// MARK: - Icon Size
public enum DSIconSize: CaseIterable, Sendable {
    case small
    case regular
    case large

    // MARK: - Point Size
    public var pointSize: CGFloat {
        switch self {
        case .small:
            return DSTypographyToken.subtitle.baseSize
        case .regular:
            return DSTypographyToken.body.baseSize
        case .large:
            return DSTypographyToken.heading.baseSize
        }
    }
}


// MARK: - Design System Icon
public struct DSIcon: View {
    
    // MARK: - Properties
    public let token: DSIconToken
    public let size: DSIconSize
    
    public init(
        _ token: DSIconToken,
        size: DSIconSize = .regular
    ) {
        self.token = token
        self.size = size
    }
    
    // MARK: - Body
    public var body: some View {
        Image(systemName: token.systemName)
            .font(.system(size: size.pointSize))
            .accessibilityHidden(true)
    }
}

// MARK: - Previews

#Preview("Icons — Light") {
    HStack(spacing: DS.Spacing.large) {
        DSIcon(.home, size: .small)
        DSIcon(.calendar)
        DSIcon(.completed, size: .large)
    }
    .foregroundStyle(DS.Colors.accentPrimary)
    .padding(DS.Spacing.large)
    .background(DS.Colors.backgroundPrimary)
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Icons — Dark") {
    HStack(spacing: DS.Spacing.large) {
        DSIcon(.home, size: .small)
        DSIcon(.calendar)
        DSIcon(.completed, size: .large)
    }
    .foregroundStyle(DS.Colors.accentPrimary)
    .padding(DS.Spacing.large)
    .background(DS.Colors.backgroundPrimary)
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}
