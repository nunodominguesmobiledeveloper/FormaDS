//
//  DSAuroraBackground.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import SwiftUI

// MARK: - Aurora Background

@available(
    *,
    deprecated,
    message: "Use DSBackground().dsTheme(.aurora) instead."
)
public struct DSAuroraBackground: View {

    // MARK: - Initialization

    public init() {}

    // MARK: - Body

    public var body: some View {
        DSBackground()
            .dsTheme(.aurora)
    }
}

// MARK: - Previews

#Preview("Aurora — Light") {
    DSBackground()
        .ignoresSafeArea()
        .dsTheme(.aurora)
        .preferredColorScheme(.light)
}

#Preview("Aurora — Dark") {
    DSBackground()
        .ignoresSafeArea()
        .dsTheme(.aurora)
        .preferredColorScheme(.dark)
}
