//
//  DSTextEditor.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 31/10/2026.
//

import SwiftUI

// MARK: - Design System Text Editor

public struct DSTextEditor: View {

    // MARK: - Binding

    @Binding private var text: String
    
    // MARK: - Theme

    @Environment(\.dsTheme)
    private var theme

    @Environment(\.colorScheme)
    private var colorScheme

    // MARK: - Cursor Color

    private var cursorColor: Color {
        theme.color(
            for: .accentPrimary,
            appearance: colorScheme
        )
    }

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
                isFocused: isFocused,
                minimumHeight:
                    DS.Sizes.TextField.multilineMinimumHeight
            ) {
                editorContent
            }

            if let errorMessage {
                Text(errorMessage)
                    .font(DS.Typography.caption)
                    .foregroundStyle(DS.Colors.stateError)
            }
        }
    }

    // MARK: - Editor Content

    private var editorContent: some View {
        TextEditor(text: $text)
            .font(DS.Typography.body)
            .foregroundStyle(DS.Colors.textPrimary)
            .tint(cursorColor)
            .scrollContentBackground(.hidden)
            .frame(
                minHeight: DS.Sizes.TextField.multilineMinimumHeight
            )
            .focused($isFocused)
            .accessibilityLabel(title)
            .overlay(alignment: .topLeading) {
                if text.isEmpty {
                    Text(placeholder)
                        .font(DS.Typography.body)
                        .foregroundStyle(DS.Colors.textSecondary)
                        .padding(.top, DS.Spacing.small)
                        .allowsHitTesting(false)
                        .accessibilityHidden(true)
                }
            }
    }
}

// MARK: - Preview Host

private struct DSTextEditorPreview: View {

    // MARK: - State

    @State private var notes = ""

    // MARK: - Body

    var body: some View {
        VStack(spacing: DS.Layout.contentSpacing) {
            DSTextEditor(
                title: "Notas",
                placeholder: "Acrescentar detalhes...",
                text: $notes,
                helperText: "Podes escrever várias linhas."
            )

            DSTextEditor(
                title: "Descrição",
                placeholder: "Campo obrigatório",
                text: .constant(""),
                errorMessage: "Adiciona uma descrição."
            )
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

#Preview("Text Editor — Light") {
    DSTextEditorPreview()
        .preferredColorScheme(.light)
}

#Preview("Text Editor — Dark") {
    DSTextEditorPreview()
        .preferredColorScheme(.dark)
}

#Preview("Text Editor — Accessibility") {
    DSTextEditorPreview()
        .preferredColorScheme(.dark)
        .dynamicTypeSize(.accessibility3)
}

#Preview("Text Editor — Interactive") {
    DSTextEditorPreview()
}
