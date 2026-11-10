//
//  DSBackground.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import SwiftUI

import SwiftUI

// MARK: - Design System Background

public struct DSBackground: View {

    // MARK: - Environment

    @Environment(\.dsTheme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    // MARK: - Initialization

    public init() {}

    // MARK: - Body

    public var body: some View {
        GeometryReader { geometry in
            let background = theme.background(
                for: colorScheme
            )

            ZStack {
                // MARK: Base Color

                Rectangle()
                    .fill(
                        DS.Colors.backgroundPrimary
                    )

                // MARK: Radial Layers

                ForEach(
                    background.glows.indices,
                    id: \.self
                ) { index in
                    radialLayer(
                        background.glows[index],
                        size: geometry.size
                    )
                }
            }
            .frame(
                width: geometry.size.width,
                height: geometry.size.height
            )
        }
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }

    // MARK: - Radial Layer

    private func radialLayer(
        _ glow: DSRadialGlow,
        size: CGSize
    ) -> some View {
        let radius = max(
            size.width,
            size.height
        ) * glow.radiusScale

        let gradient = RadialGradient(
            stops: [
                .init(
                    color: glow.color.color,
                    location: 0
                ),
                .init(
                    color: glow.color.color.opacity(0),
                    location: 1
                )
            ],
            center: UnitPoint(
                x: glow.centerX,
                y: glow.centerY
            ),
            startRadius: 0,
            endRadius: radius
        )

        return Rectangle()
            .fill(gradient)
    }
}

// MARK: - Previews

#Preview("Background — Light") {
    DSBackground()
        .ignoresSafeArea()
        .dsTheme(.aurora)
        .preferredColorScheme(.light)
}

#Preview("Background — Dark") {
    DSBackground()
        .ignoresSafeArea()
        .dsTheme(.aurora)
        .preferredColorScheme(.dark)
}

#Preview("Background — With Content") {
    VStack(
        alignment: .leading,
        spacing: DS.Layout.contentSpacing
    ) {
        Text("LifeHub")
            .font(DS.Typography.titlePrimary)
            .foregroundStyle(
                DS.Colors.textPrimary
            )

        Text("O teu dia, organizado.")
            .font(DS.Typography.body)
            .foregroundStyle(
                DS.Colors.textSecondary
            )

        Spacer()
    }
    .frame(
        maxWidth: .infinity,
        maxHeight: .infinity,
        alignment: .topLeading
    )
    .dsScreenPadding()
    .padding(.top, DS.Spacing.large)
    .background {
        DSBackground()
            .ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}
