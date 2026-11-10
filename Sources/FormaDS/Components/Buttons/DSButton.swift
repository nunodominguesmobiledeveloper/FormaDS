//
//  DSButton.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 28/10/2026.
//

import SwiftUI

// MARK: - Design System Button
public struct DSButton: View {

    // MARK: - Environment

    @Environment(\.isEnabled)
    private var isEnabled

    // MARK: - Properties

    public let title: LocalizedStringResource
    public let icon: DSIconToken?
    public let variant: DSButtonVariant
    public let size: DSButtonSize

    private let action: () -> Void

    // MARK: - Initialization

    public init(
        _ title: LocalizedStringResource,
        icon: DSIconToken? = nil,
        variant: DSButtonVariant = .primary,
        size: DSButtonSize = .regular,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.variant = variant
        self.size = size
        self.action = action
    }

    // MARK: - Body

    public var body: some View {
        Button(action: action) {
            label
                .frame(
                    maxWidth: .infinity,
                    minHeight: size.minimumHeight
                )
                .padding(
                    .horizontal,
                    DS.Sizes.Button.horizontalPadding
                )
                .background {
                    buttonBackground
                }
        }
        .buttonStyle(.plain)
    }

    // MARK: - Label

    private var label: some View {
        HStack(
            spacing: DS.Layout.compactSpacing
        ) {
            if let icon {
                DSIcon(icon)
            }

            Text(title)
                .font(DS.Typography.button)
                .fixedSize(
                    horizontal: false,
                    vertical: true
                )
        }
        .foregroundStyle(
            foregroundColor
        )
        .padding(.vertical, DS.Spacing.xSmall)
        .frame(maxWidth: .infinity)
    }

    // MARK: - Foreground Color

    private var foregroundColor: DSColorToken {
        guard isEnabled else {
            return .textSecondary
        }

        switch variant {
        case .primary:
            return .textOnPrimaryAction

        case .secondary:
            return .textPrimary
        }
    }

    // MARK: - Background

    @ViewBuilder
    private var buttonBackground: some View {
        if !isEnabled {
            Capsule()
                .fill(DS.Colors.surfaceElevated)

        } else {
            switch variant {
            case .primary:
                Capsule()
                    .fill(DS.Gradients.primaryAction)
                    .dsShadow(.primaryAction)

            case .secondary:
                Capsule()
                    .fill(DS.Colors.surfaceElevated)
                    .overlay {
                        Capsule()
                            .strokeBorder(
                                DS.Colors.borderCard,
                                lineWidth: DS.Sizes.Card.borderWidth
                            )
                    }
            }
        }
    }
}

// MARK: - Previews

#Preview("Buttons — Light") {
    VStack(spacing: DS.Layout.contentSpacing) {
        DSButton("Adicionar tarefa", icon: .add) {}

        DSButton(
            "Cancelar",
            variant: .secondary
        ) {}

        DSButton(
            "Guardar",
            size: .small
        ) {}

        DSButton("Indisponível") {}
            .disabled(true)
    }
    .dsScreenPadding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .padding(DS.Spacing.large)
    .background {
        DSBackground().ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Buttons — Dark") {
    VStack(spacing: DS.Layout.contentSpacing) {
        DSButton("Adicionar tarefa", icon: .add) {}

        DSButton(
            "Cancelar",
            variant: .secondary
        ) {}

        DSButton("Indisponível") {}
            .disabled(true)
    }
    .dsScreenPadding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        DSBackground().ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
    .ignoresSafeArea()
}

#Preview("Buttons — Accessibility") {
    DSButton(
        "Adicionar uma nova tarefa ao calendário",
        icon: .add
    ) {}
    .dsScreenPadding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        DSBackground().ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.accessibility3)
}
