//
//  DSToggle.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 28/10/2026.
//

import SwiftUI

// MARK: - Design System Toggle

public struct DSToggle: View {

    // MARK: - Properties

    public let title: LocalizedStringResource
    public let subtitle: LocalizedStringResource?

    @Binding private var isOn: Bool

    // MARK: - Initialization

    public init(
        _ title: LocalizedStringResource,
        subtitle: LocalizedStringResource? = nil,
        isOn: Binding<Bool>
    ) {
        self.title = title
        self.subtitle = subtitle
        self._isOn = isOn
    }

    // MARK: - Body

    public var body: some View {
        Toggle(isOn: $isOn) {
            VStack(
                alignment: .leading,
                spacing: DS.Layout.compactSpacing
            ) {
                Text(title)
                    .font(DS.Typography.body)
                    .foregroundStyle(DS.Colors.textPrimary)

                if let subtitle {
                    Text(subtitle)
                        .font(DS.Typography.caption)
                        .foregroundStyle(DS.Colors.textSecondary)
                }
            }
        }
        .toggleStyle(.switch)
        .tint(DS.Colors.accentPrimary)
    }
}

// MARK: - Preview

private struct DSTogglePreview: View {

    @State private var isOn = true

    var body: some View {
        DSCard {
            DSToggle(
                "Notificações",
                subtitle: "Receber lembretes das tarefas",
                isOn: $isOn
            )
        }
        .dsScreenPadding()
        .background {
            DSBackground().ignoresSafeArea()
        }
        .dsTheme(.aurora)
    }
}

#Preview("Toggle — Light") {
    DSTogglePreview()
        .preferredColorScheme(.light)
}

#Preview("Toggle — Dark") {
    DSTogglePreview()
        .preferredColorScheme(.dark)
}

#Preview("Toggle — Interactive") {
    DSTogglePreview()
}
