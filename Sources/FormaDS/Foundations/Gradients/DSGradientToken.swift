//
//  DSGradientToken.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import SwiftUI

// MARK: - Semantic Gradient Tokens

public enum DSGradientToken:
    String,
    CaseIterable,
    Hashable,
    Sendable {

    // MARK: - Actions

    case primaryAction
}

// MARK: - ShapeStyle Conformance

extension DSGradientToken: ShapeStyle {

    public func resolve(
        in environment: EnvironmentValues
    ) -> some ShapeStyle {
        let theme = environment.dsTheme
        let appearance = environment.colorScheme

        return theme.gradient(
            for: self,
            appearance: appearance
        ).gradient
    }
}

// MARK: - Previews

#Preview("Primary Gradient — Light") {
    Capsule()
        .fill(DS.Gradients.primaryAction)
        .frame(height: DS.Sizes.Button.height)
        .padding(DS.Spacing.large)
        .background(DS.Colors.backgroundPrimary)
        .dsTheme(.aurora)
        .preferredColorScheme(.light)
}

#Preview("Primary Gradient — Dark") {
    Capsule()
        .fill(DS.Gradients.primaryAction)
        .frame(height: DS.Sizes.Button.height)
        .padding(DS.Spacing.large)
        .background(DS.Colors.backgroundPrimary)
        .dsTheme(.aurora)
        .preferredColorScheme(.dark)
}
