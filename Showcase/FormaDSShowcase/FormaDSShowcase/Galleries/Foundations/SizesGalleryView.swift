//
//  SizesGalleryView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import SwiftUI
import FormaDS


// MARK: - Sizes Gallery
struct SizesGalleryView: View {
    
    // MARK: - Samples
    private let samples: [SizeSample] = [
        .init(
            name: "Button",
            property: "height",
            value: DS.Sizes.Button.height
        ),
        .init(
            name: "Button",
            property: "smallHeight",
            value: DS.Sizes.Button.smallHeight
        ),
        .init(
            name: "IconButton",
            property: "side",
            value: DS.Sizes.IconButton.side
        ),
        .init(
            name: "IconTile",
            property: "side",
            value: DS.Sizes.IconTile.side
        ),
        .init(
            name: "Chip",
            property: "minimumHeight",
            value: DS.Sizes.Chip.minimumHeight
        ),
        .init(
            name: "SegmentedControl",
            property: "minimumSegmentHeight",
            value: DS.Sizes.SegmentedControl.minimumSegmentHeight
        ),
        .init(
            name: "TextField",
            property: "minimumHeight",
            value: DS.Sizes.TextField.minimumHeight
        ),
        .init(
            name: "ProgressBar",
            property: "height",
            value: DS.Sizes.ProgressBar.height
        ),
        .init(
            name: "TabBar",
            property: "height",
            value: DS.Sizes.TabBar.height
        ),
    ]
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: DS.Spacing.large
            ) {
                introduction
                
                LazyVStack(
                    alignment: .leading,
                    spacing: DS.Spacing.regular
                ) {
                    
                    ForEach(samples) { sample in
                        sizeRow(sample)
                    }
                }
                
                accessibilityNote
            }
            .padding(DS.Spacing.regular)
        }
        .background(DS.Colors.backgroundPrimary)
        .navigationTitle("Sizes")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    // MARK: - Introduction
    private var introduction: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Spacing.xSmall
        ) {
            Text("Component Dimensions")
                .font(.title2.bold())
                .foregroundStyle(DS.Colors.textPrimary)
            
            Text("Reference dimensions used by FormDS components.")
                .font(.subheadline)
                .foregroundStyle(DS.Colors.textSecondary)
        }
    }
    
    
    // MARK: - Size Row
    private func sizeRow(_ sample: SizeSample) -> some View {
        VStack(
            alignment: .leading,
            spacing: DS.Spacing.small
        ) {
            HStack {
                
                VStack(
                    alignment: .leading,
                    spacing: DS.Spacing.xxSmall
                ) {
                    Text(sample.name)
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(DS.Colors.textPrimary)
                    
                    Text(sample.property)
                        .font(.caption.monospaced())
                        .foregroundStyle(DS.Colors.textSecondary)
                }
                
                Spacer()
                
                Text("\(Int(sample.value)) pt")
                    .font(.caption.monospaced())
                    .foregroundStyle(DS.Colors.textPrimary)
            }
            
            RoundedRectangle(
                cornerRadius: DS.Radius.small
            )
            .fill(DS.Colors.accentPrimary)
            .frame(height: sample.value)
        }
        .padding(DS.Spacing.regular)
        .background(
            DS.Colors.surfaceCard,
            in: RoundedRectangle(
                cornerRadius: DS.Radius.card
            )
        )
    }
    
    private var accessibilityNote: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Spacing.xSmall
        ) {
            Label(
                "Accessibility",
                systemImage: "accessibility"
            )
            .font(.headline)
            .foregroundStyle(DS.Colors.textPrimary)
            
            Text(
                "These are reference dimensions. Interactive components must support accessible hit areas and allow content to grow when needed."
            )
            .font(.subheadline)
            .foregroundStyle(DS.Colors.textSecondary)
        }
        .padding(DS.Spacing.regular)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            DS.Colors.surfaceElevated,
            in: RoundedRectangle(
                cornerRadius: DS.Radius.medium
            )
        )
    }
}


// MARK: - Size Sample
private struct SizeSample: Identifiable {
    
    let name: String
    let property: String
    let value: CGFloat
    
    var id: String {
        "\(name).\(property)"
    }
}

// MARK: - Previews

#Preview("Sizes — Light") {
    NavigationStack {
        SizesGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Sizes — Dark") {
    NavigationStack {
        SizesGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}
