//
//  DSCheckbox.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 28/10/2026.
//

import SwiftUI

// MARK: - Design System Checkbox

public struct DSCheckbox: View {

    // MARK: - Properties

    @Environment(\.locale) private var locale

    public let title: LocalizedStringResource
    public let selectedAccessibilityValue: LocalizedStringResource?
    public let notSelectedAccessibilityValue: LocalizedStringResource?

    @Binding private var isChecked: Bool

    // MARK: - Initialization

    public init(
        _ title: LocalizedStringResource,
        isChecked: Binding<Bool>,
        selectedAccessibilityValue: LocalizedStringResource? = nil,
        notSelectedAccessibilityValue: LocalizedStringResource? = nil
    ) {
        self.title = title
        self._isChecked = isChecked
        self.selectedAccessibilityValue = selectedAccessibilityValue
        self.notSelectedAccessibilityValue = notSelectedAccessibilityValue
    }

    // MARK: - Body

    public var body: some View {
        Button {
            isChecked.toggle()
        } label: {
            HStack(
                spacing: DS.Layout.itemSpacing
            ) {
                checkboxIndicator

                Text(title)
                    .font(DS.Typography.body)
                    .foregroundStyle(DS.Colors.textPrimary)
                    .fixedSize(
                        horizontal: false,
                        vertical: true
                    )

                Spacer(minLength: 0)
            }
            .frame(minHeight: DS.Sizes.IconButton.side)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel(title)
        .accessibilityValue(
            isChecked
                ? selectedAccessibilityValue ?? DSLocalizedString.selected(locale: locale)
                : notSelectedAccessibilityValue ?? DSLocalizedString.notSelected(locale: locale)
        )
        .accessibilityAddTraits(
            isChecked ? [.isSelected] : []
        )
    }

    // MARK: - Checkbox Indicator

    private var checkboxIndicator: some View {
        RoundedRectangle(
            cornerRadius: DS.Sizes.IconTile.cornerRadius,
            style: .continuous
        )
        .fill(
            isChecked
                ? DS.Colors.accentPrimary
                : DS.Colors.surfaceElevated
        )
        .overlay {
            RoundedRectangle(
                cornerRadius: DS.Sizes.IconTile.cornerRadius,
                style: .continuous
            )
            .strokeBorder(
                isChecked
                    ? DS.Colors.accentPrimary
                    : DS.Colors.borderCard,
                lineWidth: DS.Sizes.Card.borderWidth
            )
        }
        .overlay {
            if isChecked {
                DSIcon(.check)
                    .foregroundStyle(DS.Colors.textOnAccent)
            }
        }
        .frame(
            width: DS.Sizes.IconTile.side,
            height: DS.Sizes.IconTile.side
        )
        .accessibilityHidden(true)
    }
}

// MARK: - Preview

private struct DSCheckboxPreview: View {

    @State private var accepted = false

    var body: some View {
        DSCard {
            VStack(spacing: DS.Layout.itemSpacing) {
                DSCheckbox(
                    "Aceito os termos e condições",
                    isChecked: $accepted
                )

                Text(
                    accepted
                        ? "Termos aceites"
                        : "Por confirmar"
                )
                .font(DS.Typography.caption)
                .foregroundStyle(DS.Colors.textSecondary)
            }
        }
        .dsScreenPadding()
        .background {
            DSBackground().ignoresSafeArea()
        }
        .dsTheme(.aurora)
    }
}

#Preview("Checkbox — Light") {
    DSCheckboxPreview()
        .preferredColorScheme(.light)
}

#Preview("Checkbox — Dark") {
    DSCheckboxPreview()
        .preferredColorScheme(.dark)
}

#Preview("Checkbox — Interactive") {
    DSCheckboxPreview()
}
