//
//  DSEmptyState.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 06/11/2026.
//

import SwiftUI

// MARK: - Design System Empty State

public struct DSEmptyState: View {

    // MARK: - Properties

    public let icon: DSIconToken
    public let title: LocalizedStringResource
    public let message: LocalizedStringResource
    public let actionTitle: LocalizedStringResource?

    private let action: (() -> Void)?

    // MARK: - Initialization

    public init(
        icon: DSIconToken,
        title: LocalizedStringResource,
        message: LocalizedStringResource,
        actionTitle: LocalizedStringResource? = nil,
        action: (() -> Void)? = nil
    ) {
        self.icon = icon
        self.title = title
        self.message = message
        self.actionTitle = actionTitle
        self.action = action
    }

    // MARK: - Body

    public var body: some View {
        VStack(
            alignment: .center,
            spacing: DS.Layout.contentSpacing
        ) {
            DSIcon(icon, size: .large)
                .foregroundStyle(DS.Colors.accentPrimary)
                .frame(
                    width: DS.Sizes.IconButton.side,
                    height: DS.Sizes.IconButton.side
                )

            Text(title)
                .font(DS.Typography.heading)
                .foregroundStyle(DS.Colors.textPrimary)
                .multilineTextAlignment(.center)
                .accessibilityAddTraits(.isHeader)

            Text(message)
                .font(DS.Typography.subtitle)
                .foregroundStyle(DS.Colors.textSecondary)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)

            if let actionTitle, let action {
                DSButton(actionTitle, action: action)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(DS.Spacing.large)
    }
}

// MARK: - Previews

#Preview("Empty State — Light") {
    DSEmptyState(
        icon: .tasks,
        title: "Ainda não tens tarefas",
        message: "Adiciona a tua primeira tarefa para começares.",
        actionTitle: "Nova tarefa",
        action: {}
    )
    .dsScreenPadding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        DSBackground().ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Empty State — Dark") {
    DSEmptyState(
        icon: .habits,
        title: "Ainda não tens hábitos",
        message: "Cria um hábito e acompanha o teu progresso.",
        actionTitle: "Criar hábito",
        action: {}
    )
    .dsScreenPadding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        DSBackground().ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}
