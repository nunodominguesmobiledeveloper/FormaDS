//
//  DSChip.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 28/10/2026.
//

import SwiftUI

// MARK: - Design System Chip

public struct DSChip: View {

    // MARK: - Properties

    public let title: LocalizedStringResource
    public let isSelected: Bool

    private let action: () -> Void

    // MARK: - Initialization

    public init(
        _ title: LocalizedStringResource,
        isSelected: Bool,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.isSelected = isSelected
        self.action = action
    }

    // MARK: - Body

    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(DS.Typography.subtitle)
                .foregroundStyle(
                    isSelected
                        ? DS.Colors.textPrimary
                        : DS.Colors.textSecondary
                )
                .padding(
                    .horizontal,
                    DS.Sizes.Chip.horizontalPadding
                )
                .padding(
                    .vertical,
                    DS.Spacing.xSmall
                )
                .frame(
                    minHeight: DS.Sizes.Chip.minimumHeight
                )
                .background(
                    isSelected
                        ? DS.Colors.surfaceSelected
                        : DS.Colors.surfaceElevated,
                    in: Capsule()
                )
                .overlay {
                    Capsule()
                        .strokeBorder(
                            isSelected
                                ? DS.Colors.accentPrimary
                                : DS.Colors.borderCard,
                            lineWidth: DS.Sizes.Card.borderWidth
                        )
                }
        }
        .buttonStyle(.plain)
        .accessibilityAddTraits(
            isSelected ? [.isSelected] : []
        )
    }
}

// MARK: - Interactive Preview

private struct DSChipPreview: View {

    @State private var selected = true

    var body: some View {
        DSChip(
            "Hoje",
            isSelected: selected
        ) {
            selected.toggle()
        }
        .padding(DS.Spacing.large)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            DSBackground().ignoresSafeArea()
        }
        .dsTheme(.aurora)
    }
}

#Preview("Chip — Light") {
    DSChipPreview()
        .preferredColorScheme(.light)
}

#Preview("Chip — Dark") {
    DSChipPreview()
        .preferredColorScheme(.dark)
}
