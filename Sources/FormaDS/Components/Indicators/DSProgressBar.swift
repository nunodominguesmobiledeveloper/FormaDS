//
//  DSProgressBar.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 02/11/2026.
//

import SwiftUI

public struct DSProgressBar: View {
    
    // MARK: - Properties
    public let progress: Double
    public let color: DSColorToken
    public let accessibilityTitle: String?

    @Environment(\.locale) private var locale
    
    
    // MARK: - Initialization
    public init(
        progress: Double,
        color: DSColorToken = .accentPrimary,
        accessibilityTitle: String? = nil
    ) {
        self.progress = progress
        self.color = color
        self.accessibilityTitle = accessibilityTitle
    }
    
    
    private var accessibilityTitleText: Text {
        if let accessibilityTitle {
            Text(verbatim: accessibilityTitle)
        } else {
            Text(DSLocalizedString.progress(locale: locale))
        }
    }

    // MARK: - Normalized Progress
    private var normalizedProgress: Double {
        DSProgressNormalization.normalize(progress)
    }
    
    
    // MARK: - Body
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(DS.Colors.progressTrack)
                
                Capsule()
                    .fill(color)
                    .frame(
                        width: geometry.size.width * normalizedProgress
                    )
            }
        }
        .frame(height: DS.Sizes.ProgressBar.height)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(accessibilityTitleText)
        .accessibilityValue(
            normalizedProgress
                .formatted(.percent.precision(.fractionLength(0)))
        )
    }
}

// MARK: - Previews

private struct DSProgressBarPreview: View {

    @State private var progress = 0.65

    var body: some View {
        VStack(spacing: DS.Layout.sectionSpacing) {
            DSProgressBar(progress: 0)

            DSProgressBar(progress: 0.25)

            DSProgressBar(
                progress: progress,
                color: .accentTertiary,
                accessibilityTitle: "Orçamento utilizado"
            )

            DSProgressBar(
                progress: 1,
                color: .stateSuccess
            )

            DSProgressBar(
                progress: 1.2,
                color: .stateWarning
            )

            Slider(value: $progress, in: 0...1)
                .tint(DS.Colors.accentPrimary)
        }
        .dsScreenPadding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            DSBackground().ignoresSafeArea()
        }
        .dsTheme(.aurora)
    }
}

#Preview("Progress Bars — Light") {
    DSProgressBarPreview()
        .preferredColorScheme(.light)
}

#Preview("Progress Bars — Dark") {
    DSProgressBarPreview()
        .preferredColorScheme(.dark)
}

#Preview("Progress Bars — Interactive") {
    DSProgressBarPreview()
}
