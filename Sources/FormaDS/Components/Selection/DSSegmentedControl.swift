//
//  DSSegmentdControl.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 28/10/2026.
//

import SwiftUI

// MARK: - Design System Segmented Control

public struct DSSegmentedControl<
    Value: Hashable & Sendable
>: View {

    // MARK: - Properties

    public let options: [DSSelectionOption<Value>]

    @Binding private var selection: Value

    // MARK: - Initialization

    public init(
        options: [DSSelectionOption<Value>],
        selection: Binding<Value>
    ) {
        self.options = options
        self._selection = selection
    }

    // MARK: - Body

    public var body: some View {
        HStack(spacing: 0) {
            ForEach(options) { option in
                segment(for: option)
            }
        }
        .padding(
            DS.Sizes.SegmentedControl.contentPadding
        )
        .background(
            DS.Colors.surfaceElevated,
            in: RoundedRectangle(
                cornerRadius:
                    DS.Sizes.SegmentedControl.cornerRadius,
                style: .continuous
            )
        )
    }

    // MARK: - Segment

    private func segment(
        for option: DSSelectionOption<Value>
    ) -> some View {
        let isSelected = selection == option.value

        return Button {
            selection = option.value
        } label: {
            Text(option.title)
                .font(DS.Typography.subtitle)
                .foregroundStyle(
                    isSelected
                        ? DS.Colors.textPrimary
                        : DS.Colors.textSecondary
                )
                .frame(
                    maxWidth: .infinity,
                    minHeight:
                        DS.Sizes.SegmentedControl.minimumSegmentHeight
                )
                .padding(.horizontal, DS.Spacing.xSmall)
                .background(
                    isSelected
                        ? DS.Colors.surfaceSelected
                        : DS.Colors.surfaceElevated,
                    in: RoundedRectangle(
                        cornerRadius:
                            DS.Sizes.SegmentedControl.selectedCornerRadius,
                        style: .continuous
                    )
                )
        }
        .buttonStyle(.plain)
        .accessibilityAddTraits(
            isSelected ? [.isSelected] : []
        )
    }
}

// MARK: - Preview

private struct DSSegmentedControlPreview: View {

    @State private var selection = "day"

    private let options: [DSSelectionOption<String>] = [
        .init(value: "day", title: "Dia"),
        .init(value: "week", title: "Semana"),
        .init(value: "month", title: "Mês")
    ]

    var body: some View {
        VStack(spacing: DS.Layout.contentSpacing) {
            DSSegmentedControl(
                options: options,
                selection: $selection
            )

            Text("Selecionado: \(selection)")
                .font(DS.Typography.body)
                .foregroundStyle(DS.Colors.textPrimary)
        }
        .dsScreenPadding()
        .background {
            DSBackground().ignoresSafeArea()
        }
        .dsTheme(.aurora)
    }
}

#Preview("Segmented — Light") {
    DSSegmentedControlPreview()
        .preferredColorScheme(.light)
}

#Preview("Segmented — Dark") {
    DSSegmentedControlPreview()
        .preferredColorScheme(.dark)
}

#Preview("Segmented — Interactive") {
    DSSegmentedControlPreview()
}
