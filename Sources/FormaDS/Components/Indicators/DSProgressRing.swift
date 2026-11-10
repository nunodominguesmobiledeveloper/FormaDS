//
//  DSProgressRing.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 02/11/2026.
//

import SwiftUI

public struct DSProgressRing: View {
    
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
        ZStack {
            Circle()
                .stroke(
                    DS.Colors.progressTrack,
                    lineWidth: DS.Sizes.Indicators.ProgressRing.lineWidth
                )
            
            Circle()
                .trim(from: 0, to: normalizedProgress)
                .stroke(
                    color,
                    style: StrokeStyle(
                        lineWidth: DS.Sizes.Indicators.ProgressRing.lineWidth,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
        }
        .frame(
            width: DS.Sizes.Indicators.ProgressRing.side,
            height: DS.Sizes.Indicators.ProgressRing.side
        )
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(accessibilityTitleText)
        .accessibilityValue(
            normalizedProgress
                .formatted(.percent.precision(.fractionLength(0)))
        )
    }
}

// MARK: - Previews

private struct DSProgressRingPreview: View {

    @State private var progress = 0.75

    var body: some View {
        VStack(spacing: DS.Layout.sectionSpacing) {
            DSProgressRing(
                progress: progress,
                color: .accentPrimary,
                accessibilityTitle: "Tarefas concluídas"
            )

            Text(
                progress.formatted(.percent)
            )
            .font(DS.Typography.titleSecondary)
            .foregroundStyle(DS.Colors.textPrimary)

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

#Preview("Progress Ring — Light") {
    DSProgressRingPreview()
        .preferredColorScheme(.light)
}

#Preview("Progress Ring — Dark") {
    DSProgressRingPreview()
        .preferredColorScheme(.dark)
}

#Preview("Progress Ring — Interactive") {
    DSProgressRingPreview()
}
