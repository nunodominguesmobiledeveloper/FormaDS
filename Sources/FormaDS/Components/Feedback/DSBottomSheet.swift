//
//  DSBottomSheet.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 06/11/2026.
//

import SwiftUI

// MARK: - Design System Bottom Sheet

public struct DSBottomSheet<Content: View>: View {

    // MARK: - Properties

    @Environment(\.locale) private var locale

    public let title: LocalizedStringResource
    public let actionTitle: LocalizedStringResource?
    public let cancelTitle: LocalizedStringResource?

    private let onCancel: () -> Void
    private let onAction: (() -> Void)?
    private let content: Content

    // MARK: - Initialization

    public init(
        title: LocalizedStringResource,
        actionTitle: LocalizedStringResource? = nil,
        cancelTitle: LocalizedStringResource? = nil,
        onCancel: @escaping () -> Void,
        onAction: (() -> Void)? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.actionTitle = actionTitle
        self.cancelTitle = cancelTitle
        self.onCancel = onCancel
        self.onAction = onAction
        self.content = content()
    }

    // MARK: - Body

    public var body: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            header

            ScrollView {
                content
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .dsScreenPadding()
                    .padding(.vertical, DS.Spacing.regular)
            }
        }
        .padding(.top, DS.Spacing.regular)
        .background(DS.Colors.backgroundSheet)
    }

    // MARK: - Header

    private var header: some View {
        HStack(spacing: DS.Layout.itemSpacing) {
            Button(cancelTitle ?? DSLocalizedString.cancel(locale: locale), action: onCancel)
                .foregroundStyle(DS.Colors.textLink)

            Spacer(minLength: DS.Spacing.xxSmall)

            Text(title)
                .font(DS.Typography.heading)
                .foregroundStyle(DS.Colors.textPrimary)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)

            Spacer(minLength: DS.Spacing.xxSmall)

            if let actionTitle, let onAction {
                Button(actionTitle, action: onAction)
                    .foregroundStyle(DS.Colors.textLink)
                    .fontWeight(.semibold)
            } else {
                Text(cancelTitle ?? DSLocalizedString.cancel(locale: locale))
                    .hidden()
            }
        }
        .font(DS.Typography.subtitle)
        .dsScreenPadding()
    }
}

// MARK: - Preview Host

private struct DSBottomSheetPreview: View {

    @State private var isPresented = true
    @State private var title = ""

    var body: some View {
        VStack {
            DSButton("Abrir sheet") {
                isPresented = true
            }
        }
        .dsScreenPadding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            DSBackground().ignoresSafeArea()
        }
        .dsTheme(.aurora)
        .sheet(isPresented: $isPresented) {
            DSBottomSheet(
                title: "Nova tarefa",
                actionTitle: "Guardar",
                onCancel: { isPresented = false },
                onAction: { isPresented = false }
            ) {
                DSTextField(
                    title: "Título",
                    placeholder: "O que precisas de fazer?",
                    text: $title
                )
            }
            .dsTheme(.aurora)
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
        }
    }
}

// MARK: - Previews

#Preview("Bottom Sheet — Light") {
    DSBottomSheetPreview()
        .preferredColorScheme(.light)
}

#Preview("Bottom Sheet — Dark") {
    DSBottomSheetPreview()
        .preferredColorScheme(.dark)
}
