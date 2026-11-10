//
//  DSFormFieldLabel.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 31/10/2026.
//

import SwiftUI

// MARK: - Form Field Label

public struct DSFormFieldLabel: View {

    // MARK: - Properties

    public let title: LocalizedStringResource
    public let helperText: LocalizedStringResource?
    public let errorMessage: LocalizedStringResource?

    // MARK: - Initialization

    public init(
        title: LocalizedStringResource,
        helperText: LocalizedStringResource? = nil,
        errorMessage: LocalizedStringResource? = nil
    ) {
        self.title = title
        self.helperText = helperText
        self.errorMessage = errorMessage
    }

    // MARK: - Body

    public var body: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            Text(title)
                .font(DS.Typography.footnote)
                .foregroundStyle(DS.Colors.textSecondary)

            if let errorMessage {
                Text(errorMessage)
                    .font(DS.Typography.caption)
                    .foregroundStyle(DS.Colors.stateError)

            } else if let helperText {
                Text(helperText)
                    .font(DS.Typography.caption)
                    .foregroundStyle(DS.Colors.textSecondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Previews

#Preview("Label — Light") {
    VStack(spacing: DS.Layout.contentSpacing) {
        DSFormFieldLabel(
            title: "Título"
        )

        DSFormFieldLabel(
            title: "Descrição",
            helperText: "Informação opcional"
        )

        DSFormFieldLabel(
            title: "Título",
            errorMessage: "Este campo é obrigatório."
        )
    }
    .dsScreenPadding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        DSBackground().ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Label — Dark") {
    DSFormFieldLabel(
        title: "Título",
        errorMessage: "Este campo é obrigatório."
    )
    .dsScreenPadding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        DSBackground().ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}
