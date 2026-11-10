//
//  DSConfirmationDialog.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 06/11/2026.
//

import SwiftUI

// MARK: - Confirmation Dialog Modifier

struct DSConfirmationDialogModifier: ViewModifier {

    // MARK: - Binding

    @Binding private var isPresented: Bool

    // MARK: - Properties

    let title: LocalizedStringResource
    let message: LocalizedStringResource
    let destructiveTitle: LocalizedStringResource
    let cancelTitle: LocalizedStringResource?

    @Environment(\.locale) private var locale

    private let onConfirm: () -> Void

    // MARK: - Initialization

    init(
        isPresented: Binding<Bool>,
        title: LocalizedStringResource,
        message: LocalizedStringResource,
        destructiveTitle: LocalizedStringResource,
        cancelTitle: LocalizedStringResource? = nil,
        onConfirm: @escaping () -> Void
    ) {
        self._isPresented = isPresented
        self.title = title
        self.message = message
        self.destructiveTitle = destructiveTitle
        self.cancelTitle = cancelTitle
        self.onConfirm = onConfirm
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .confirmationDialog(
                title,
                isPresented: $isPresented,
                titleVisibility: .visible
            ) {
                Button(
                    destructiveTitle,
                    role: .destructive,
                    action: onConfirm
                )

                Button(cancelTitle ?? DSLocalizedString.cancel(locale: locale), role: .cancel) {}
            } message: {
                Text(message)
            }
    }
}

// MARK: - View Extension

public extension View {

    func dsConfirmationDialog(
        isPresented: Binding<Bool>,
        title: LocalizedStringResource,
        message: LocalizedStringResource,
        destructiveTitle: LocalizedStringResource,
        cancelTitle: LocalizedStringResource? = nil,
        onConfirm: @escaping () -> Void
    ) -> some View {
        modifier(
            DSConfirmationDialogModifier(
                isPresented: isPresented,
                title: title,
                message: message,
                destructiveTitle: destructiveTitle,
                cancelTitle: cancelTitle,
                onConfirm: onConfirm
            )
        )
    }
}

// MARK: - Preview Host

private struct DSConfirmationDialogPreview: View {

    @State private var showConfirmation = false

    var body: some View {
        DSButton(
            "Eliminar tarefa",
            variant: .secondary
        ) {
            showConfirmation = true
        }
        .dsConfirmationDialog(
            isPresented: $showConfirmation,
            title: "Eliminar tarefa?",
            message: "Esta ação não pode ser desfeita.",
            destructiveTitle: "Eliminar",
            onConfirm: {}
        )
        .dsScreenPadding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            DSBackground().ignoresSafeArea()
        }
        .dsTheme(.aurora)
    }
}

#Preview("Confirmation — Light") {
    DSConfirmationDialogPreview()
        .preferredColorScheme(.light)
}

#Preview("Confirmation — Dark") {
    DSConfirmationDialogPreview()
        .preferredColorScheme(.dark)
}
