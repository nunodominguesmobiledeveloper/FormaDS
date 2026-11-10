//
//  DSIconButton.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 28/10/2026.
//

import SwiftUI

// MARK: - Design System Icon Button

public struct DSIconButton: View {

    // MARK: - Properties

    public let icon: DSIconToken
    public let accessibilityLabel: LocalizedStringResource
    public let variant: DSButtonVariant

    private let action: () -> Void

    // MARK: - Initialization

    public init(
        _ icon: DSIconToken,
        accessibilityLabel: LocalizedStringResource,
        variant: DSButtonVariant = .secondary,
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.accessibilityLabel = accessibilityLabel
        self.variant = variant
        self.action = action
    }

    // MARK: - Body

    public var body: some View {
        Button(action: action) {
            DSIcon(icon)
                .foregroundStyle(
                    variant == .primary
                        ? DS.Colors.textOnPrimaryAction
                        : DS.Colors.textPrimary
                )
                .frame(
                    minWidth: DS.Sizes.IconButton.side,
                    minHeight: DS.Sizes.IconButton.side
                )
                .background {
                    buttonBackground
                }
                .contentShape(Circle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel(accessibilityLabel)
    }

    // MARK: - Background

    @ViewBuilder
    private var buttonBackground: some View {
        switch variant {
        case .primary:
            Circle()
                .fill(DS.Gradients.primaryAction)
                .dsShadow(.primaryAction)

        case .secondary:
            Circle()
                .fill(DS.Colors.surfaceElevated)
                .overlay {
                    Circle()
                        .strokeBorder(
                            DS.Colors.borderCard,
                            lineWidth: DS.Sizes.Card.borderWidth
                        )
                }
        }
    }
}

// MARK: - Previews

#Preview("Icon Buttons — Light") {
    HStack(spacing: DS.Layout.contentSpacing) {
        DSIconButton(
            .add,
            accessibilityLabel: "Adicionar",
            variant: .primary
        ) {}

        DSIconButton(
            .edit,
            accessibilityLabel: "Editar"
        ) {}

        DSIconButton(
            .close,
            accessibilityLabel: "Fechar"
        ) {}
    }
    .padding(DS.Spacing.large)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        DSBackground().ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Icon Buttons — Dark") {
    HStack(spacing: DS.Layout.contentSpacing) {
        DSIconButton(
            .add,
            accessibilityLabel: "Adicionar",
            variant: .primary
        ) {}

        DSIconButton(
            .delete,
            accessibilityLabel: "Eliminar"
        ) {}
    }
    .padding(DS.Spacing.large)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        DSBackground().ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}
