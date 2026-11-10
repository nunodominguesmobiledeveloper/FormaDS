//
//  DSTextField.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 31/10/2026.
//

import SwiftUI

// MARK: - Design System Text Field

public struct DSTextField: View {

    // MARK: - Environment

    @Environment(\.dsTheme)
    private var theme

    @Environment(\.colorScheme)
    private var colorScheme

    // MARK: - Binding

    @Binding private var text: String

    // MARK: - Focus

    @FocusState private var isFocused: Bool

    // MARK: - Properties

    public let title: LocalizedStringResource
    public let placeholder: LocalizedStringResource
    public let helperText: LocalizedStringResource?
    public let errorMessage: LocalizedStringResource?

    // MARK: - Initialization

    public init(
        title: LocalizedStringResource,
        placeholder: LocalizedStringResource,
        text: Binding<String>,
        helperText: LocalizedStringResource? = nil,
        errorMessage: LocalizedStringResource? = nil
    ) {
        self.title = title
        self.placeholder = placeholder
        self._text = text
        self.helperText = helperText
        self.errorMessage = errorMessage
    }

    // MARK: - Validation State

    private var fieldState: DSFormFieldState {
        errorMessage == nil ? .normal : .error
    }

    // MARK: - Cursor Color

    private var cursorColor: Color {
        theme.color(
            for: .accentPrimary,
            appearance: colorScheme
        )
    }

    // MARK: - Body

    public var body: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            DSFormFieldLabel(
                title: title,
                helperText: helperText
            )

            DSFormFieldSurface(
                state: fieldState,
                isFocused: isFocused
            ) {
                TextField(
                    "",
                    text: $text,
                    prompt: Text(placeholder)
                )
                .font(DS.Typography.body)
                .foregroundStyle(DS.Colors.textPrimary)
                .tint(cursorColor)
                .focused($isFocused)
                .accessibilityLabel(title)
            }

            if let errorMessage {
                Text(errorMessage)
                    .font(DS.Typography.caption)
                    .foregroundStyle(DS.Colors.stateError)
            }
        }
    }
}

// MARK: - Preview Host

private struct DSTextFieldPreview: View {

    @State private var title = ""
    @State private var project = "LifeHub"

    var body: some View {
        VStack(spacing: DS.Layout.sectionSpacing) {
            DSTextField(
                title: "Título",
                placeholder: "O que precisas de fazer?",
                text: $title,
                helperText: "Introduz o título da tarefa."
            )

            DSTextField(
                title: "Projeto",
                placeholder: "Nome do projeto",
                text: $project
            )

            DSTextField(
                title: "Campo obrigatório",
                placeholder: "Introduz um valor",
                text: .constant(""),
                errorMessage: "Este campo é obrigatório."
            )

            DSTextField(
                title: "Campo desativado",
                placeholder: "Indisponível",
                text: .constant("Não editável")
            )
            .disabled(true)
        }
        .dsScreenPadding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            DSBackground().ignoresSafeArea()
        }
        .dsTheme(.aurora)
    }
}

// MARK: - Previews

#Preview("Text Fields — Light") {
    DSTextFieldPreview()
        .preferredColorScheme(.light)
}

#Preview("Text Fields — Dark") {
    DSTextFieldPreview()
        .preferredColorScheme(.dark)
}

#Preview("Text Fields — Accessibility") {
    DSTextFieldPreview()
        .preferredColorScheme(.dark)
        .dynamicTypeSize(.accessibility3)
}

#Preview("Text Fields — Interactive") {
    DSTextFieldPreview()
}
