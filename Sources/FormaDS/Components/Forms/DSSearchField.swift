//
//  DSSearchField.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 31/10/2026.
//

import SwiftUI

// MARK: - Design System Search Field

public struct DSSearchField: View {

    // MARK: - Binding

    @Binding private var text: String

    // MARK: - Focus

    @FocusState private var isFocused: Bool

    @Environment(\.locale) private var locale

    // MARK: - Properties

    public let placeholder: LocalizedStringResource?
    public let clearAccessibilityLabel: LocalizedStringResource?

    // MARK: - Initialization

    public init(
        placeholder: LocalizedStringResource? = nil,
        clearAccessibilityLabel: LocalizedStringResource? = nil,
        text: Binding<String>
    ) {
        self.placeholder = placeholder
        self.clearAccessibilityLabel = clearAccessibilityLabel
        self._text = text
    }

    // MARK: - Body

    public var body: some View {
        DSFormFieldSurface(
            isFocused: isFocused,
            cornerRadius:
                DS.Sizes.TextField.searchCornerRadius
        ) {
            HStack(
                spacing: DS.Layout.itemSpacing
            ) {
                searchIcon

                searchInput

                clearButton
            }
        }
        .accessibilityElement(children: .contain)
    }

    // MARK: - Search Icon

    private var searchIcon: some View {
        DSIcon(.search)
            .foregroundStyle(DS.Colors.textSecondary)
    }

    // MARK: - Search Input

    private var searchInput: some View {
        TextField(
            "",
            text: $text,
            prompt: Text(placeholder ?? DSLocalizedString.searchPlaceholder(locale: locale))
        )
        .font(DS.Typography.body)
        .foregroundStyle(DS.Colors.textPrimary)
        .tint(DS.Colors.accentPrimary)
        .textInputAutocapitalization(.never)
        .autocorrectionDisabled()
        .submitLabel(.search)
        .focused($isFocused)
        .accessibilityLabel(placeholder ?? DSLocalizedString.searchPlaceholder(locale: locale))
        .frame(maxWidth: .infinity)
    }

    // MARK: - Clear Button

    @ViewBuilder
    private var clearButton: some View {
        if !text.isEmpty {
            Button {
                text = ""
            } label: {
                DSIcon(.close)
                    .foregroundStyle(
                        DS.Colors.textSecondary
                    )
                    .padding(DS.Spacing.xSmall)
            }
            .buttonStyle(.plain)
            .accessibilityLabel(
                clearAccessibilityLabel ?? DSLocalizedString.clearSearch(locale: locale)
            )
        }
    }
}

// MARK: - Preview Host

private struct DSSearchFieldPreview: View {

    // MARK: - State

    @State private var searchText = ""

    private let items = [
        "Preparar apresentação",
        "Rever documentação",
        "Comprar alimentos",
        "Treinar no ginásio"
    ]

    // MARK: - Filtered Items

    private var filteredItems: [String] {
        guard !searchText.isEmpty else {
            return items
        }

        return items.filter {
            $0.localizedCaseInsensitiveContains(searchText)
        }
    }

    // MARK: - Body

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSearchField(
                placeholder: "Pesquisar tarefas...",
                text: $searchText
            )

            DSCard {
                VStack(
                    alignment: .leading,
                    spacing: DS.Layout.itemSpacing
                ) {
                    ForEach(filteredItems, id: \.self) { item in
                        Text(item)
                            .font(DS.Typography.body)
                            .foregroundStyle(
                                DS.Colors.textPrimary
                            )
                    }

                    if filteredItems.isEmpty {
                        Text("Sem resultados")
                            .font(DS.Typography.body)
                            .foregroundStyle(
                                DS.Colors.textSecondary
                            )
                    }
                }
            }
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

#Preview("Search — Light") {
    DSSearchFieldPreview()
        .preferredColorScheme(.light)
}

#Preview("Search — Dark") {
    DSSearchFieldPreview()
        .preferredColorScheme(.dark)
}

#Preview("Search — Interactive") {
    DSSearchFieldPreview()
}
