//
//  DSAuroraBackground.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import SwiftUI

// MARK: - Aurora Background

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
    DSAuroraBackground()
        .ignoresSafeArea()
        .preferredColorScheme(.light)
}

#Preview("Aurora — Dark") {
    DSAuroraBackground()
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
}
