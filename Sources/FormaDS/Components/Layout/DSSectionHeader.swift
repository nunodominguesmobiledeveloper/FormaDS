//
//  DSSectionHeader.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import SwiftUI

// MARK: - Design System Section Header

public struct DSSectionHeader: View {

    // MARK: - Environment

    @Environment(\.dynamicTypeSize)
    private var dynamicTypeSize

    // MARK: - Properties

    public let title: LocalizedStringResource
    public let subtitle: LocalizedStringResource?
    public let actionTitle: LocalizedStringResource?

    private let action: (() -> Void)?

    // MARK: - Initialization

    public init(
        title: LocalizedStringResource,
        subtitle: LocalizedStringResource? = nil,
        actionTitle: LocalizedStringResource? = nil,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.actionTitle = actionTitle
        self.action = action
    }

    // MARK: - Body

    public var body: some View {
        Group {
            if dynamicTypeSize.isAccessibilitySize {
                accessibilityLayout
            } else {
                regularLayout
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: - Regular Layout

    private var regularLayout: some View {
        HStack(
            alignment: .top,
            spacing: DS.Layout.itemSpacing
        ) {
            textContent
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )

            actionContent
        }
    }

    // MARK: - Accessibility Layout

    private var accessibilityLayout: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.itemSpacing
        ) {
            textContent

            actionContent
                .frame(
                    maxWidth: .infinity,
                    alignment: .trailing
                )
        }
    }

    // MARK: - Text Content

    private var textContent: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            Text(title)
                .font(DS.Typography.heading)
                .foregroundStyle(DS.Colors.textPrimary)
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityAddTraits(.isHeader)

            if let subtitle {
                Text(subtitle)
                    .font(DS.Typography.subtitle)
                    .foregroundStyle(DS.Colors.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }

    // MARK: - Action Content

    @ViewBuilder
    private var actionContent: some View {
        if let actionTitle, let action {
            Button(action: action) {
                Text(actionTitle)
                    .font(DS.Typography.subtitle)
                    .foregroundStyle(DS.Colors.textLink)
                    .padding(.vertical, DS.Spacing.xSmall)
            }
            .buttonStyle(.plain)
        }
    }
}

// MARK: - Previews

#Preview("Light") {
    VStack(spacing: DS.Layout.sectionSpacing) {
        DSSectionHeader(
            title: "Próximos eventos",
            subtitle: "Os eventos do teu calendário",
            actionTitle: "Ver todos",
            action: {}
        )

        DSSectionHeader(
            title: "As tuas tarefas",
            actionTitle: "Ver todas",
            action: {}
        )
    }
    .dsScreenPadding()
    .background {
        DSBackground()
            .ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Dark") {
    DSSectionHeader(
        title: "Próximos eventos",
        subtitle: "Os eventos do teu calendário",
        actionTitle: "Ver todos",
        action: {}
    )
    .dsScreenPadding()
    .background {
        DSBackground()
            .ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("Accessibility") {
    DSSectionHeader(
        title: "Próximos eventos da semana",
        subtitle: "Consulta os próximos acontecimentos",
        actionTitle: "Ver todos",
        action: {}
    )
    .dsScreenPadding()
    .background {
        DSBackground()
            .ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.accessibility3)
}
