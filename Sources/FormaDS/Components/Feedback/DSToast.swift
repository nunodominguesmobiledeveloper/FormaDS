//
//  DSToast.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 06/11/2026.
//

import SwiftUI

// MARK: - Toast Style

public enum DSToastStyle: Hashable, Sendable {

    case success
    case error
    case information

    public var icon: DSIconToken {
        switch self {
        case .success:
            return .completed

        case .error:
            return .error

        case .information:
            return .information
        }
    }

    public var color: DSColorToken {
        switch self {
        case .success:
            return .stateSuccess

        case .error:
            return .stateError

        case .information:
            return .accentPrimary
        }
    }
}

// MARK: - Toast Data

public struct DSToastData: Identifiable, Sendable {

    public let id: UUID
    public let message: LocalizedStringResource
    public let style: DSToastStyle
    public let actionTitle: LocalizedStringResource?

    public init(
        id: UUID = UUID(),
        message: LocalizedStringResource,
        style: DSToastStyle = .information,
        actionTitle: LocalizedStringResource? = nil
    ) {
        self.id = id
        self.message = message
        self.style = style
        self.actionTitle = actionTitle
    }
}

// MARK: - Design System Toast

public struct DSToast: View {

    // MARK: - Properties

    @Environment(\.locale) private var locale

    public let data: DSToastData
    public let dismissAccessibilityLabel: LocalizedStringResource?
    public let actionAccessibilityHint: LocalizedStringResource?

    private let onDismiss: () -> Void
    private let onAction: (() -> Void)?

    // MARK: - Initialization

    public init(
        data: DSToastData,
        dismissAccessibilityLabel: LocalizedStringResource? = nil,
        actionAccessibilityHint: LocalizedStringResource? = nil,
        onDismiss: @escaping () -> Void,
        onAction: (() -> Void)? = nil
    ) {
        self.data = data
        self.dismissAccessibilityLabel = dismissAccessibilityLabel
        self.actionAccessibilityHint = actionAccessibilityHint
        self.onDismiss = onDismiss
        self.onAction = onAction
    }

    // MARK: - Body

    public var body: some View {
        HStack(spacing: DS.Layout.itemSpacing) {

            DSIcon(data.style.icon)
                .foregroundStyle(data.style.color)
                .accessibilityHidden(true)

            Text(data.message)
                .font(DS.Typography.subtitle)
                .foregroundStyle(DS.Colors.textPrimary)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .fixedSize(
                    horizontal: false,
                    vertical: true
                )

            if let actionTitle = data.actionTitle,
               let onAction {

                Button(actionTitle) {
                    onAction()
                }
                .font(DS.Typography.subtitle)
                .fontWeight(.semibold)
                .foregroundStyle(DS.Colors.accentPrimary)
                .buttonStyle(.plain)
                .accessibilityHint(
                    actionAccessibilityHint ?? DSLocalizedString.toastActionHint(locale: locale)
                )
            }

            Button(action: onDismiss) {
                DSIcon(.close)
                    .foregroundStyle(DS.Colors.textSecondary)
                    .frame(
                        width: 44,
                        height: 44
                    )
                    .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .accessibilityLabel(
                dismissAccessibilityLabel ?? DSLocalizedString.dismissNotification(locale: locale)
            )
        }
        .padding(
            .leading,
            DS.Spacing.regular
        )
        .padding(
            .trailing,
            DS.Spacing.xxSmall
        )
        .padding(
            .vertical,
            DS.Spacing.xSmall
        )
        .background(
            DS.Colors.backgroundSheet,
            in: RoundedRectangle(
                cornerRadius: DS.Radius.medium,
                style: .continuous
            )
        )
        .overlay {
            RoundedRectangle(
                cornerRadius: DS.Radius.medium,
                style: .continuous
            )
            .strokeBorder(
                DS.Colors.borderCard,
                lineWidth: 1
            )
        }
        .accessibilityElement(children: .contain)
    }
}

// MARK: - Previews

#Preview("Success with Undo — Dark") {
    DSToast(
        data: DSToastData(
            message: "Tarefa guardada",
            style: .success,
            actionTitle: "Desfazer"
        ),
        onDismiss: {},
        onAction: {}
    )
    .dsScreenPadding()
    .frame(
        maxWidth: .infinity,
        maxHeight: .infinity
    )
    .background {
        DSBackground().ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("Error — Light") {
    DSToast(
        data: DSToastData(
            message: "Não foi possível guardar",
            style: .error
        ),
        onDismiss: {}
    )
    .dsScreenPadding()
    .frame(
        maxWidth: .infinity,
        maxHeight: .infinity
    )
    .background {
        DSBackground().ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}
