//
//  DSRow.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 27/10/2026.
//

import SwiftUI

// MARK: - Design System Row

public struct DSRow<
    Leading: View,
    Content: View,
    Trailing: View
>: View {

    // MARK: - Environment

    @Environment(\.dynamicTypeSize)
    private var dynamicTypeSize

    // MARK: - Content

    private let leading: Leading
    private let content: Content
    private let trailing: Trailing

    // MARK: - Initialization

    public init(
        @ViewBuilder leading: () -> Leading,
        @ViewBuilder content: () -> Content,
        @ViewBuilder trailing: () -> Trailing
    ) {
        self.leading = leading()
        self.content = content()
        self.trailing = trailing()
    }

    // MARK: - Body

    public var body: some View {
        Group {
            if dynamicTypeSize.isAccessibilitySize {
                accessibilityLayout
            } else {
                regularLayout
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: - Regular Layout

    private var regularLayout: some View {
        HStack(
            alignment: .center,
            spacing: DS.Layout.itemSpacing
        ) {
            leading

            content
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )

            trailing
        }
    }

    // MARK: - Accessibility Layout

    private var accessibilityLayout: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.itemSpacing
        ) {
            leading

            content
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )

            trailing
        }
    }
}

// MARK: - Row Without Trailing

public extension DSRow where Trailing == EmptyView {

    init(
        @ViewBuilder leading: () -> Leading,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            leading: leading,
            content: content,
            trailing: { EmptyView() }
        )
    }
}

// MARK: - Row Without Leading

public extension DSRow where Leading == EmptyView {

    init(
        @ViewBuilder content: () -> Content,
        @ViewBuilder trailing: () -> Trailing
    ) {
        self.init(
            leading: { EmptyView() },
            content: content,
            trailing: trailing
        )
    }
}

// MARK: - Content-Only Row

public extension DSRow
where Leading == EmptyView, Trailing == EmptyView {

    init(
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            leading: { EmptyView() },
            content: content,
            trailing: { EmptyView() }
        )
    }
}

// MARK: - Previews

#Preview("Row — Light") {
    DSCard {
        DSRow {
            DSIconTile(.calendar)
        } content: {
            VStack(
                alignment: .leading,
                spacing: DS.Layout.compactSpacing
            ) {
                Text("Reunião de equipa")
                    .font(DS.Typography.body)
                    .foregroundStyle(DS.Colors.textPrimary)

                Text("Hoje, às 14:30")
                    .font(DS.Typography.caption)
                    .foregroundStyle(DS.Colors.textSecondary)
            }
        } trailing: {
            DSIcon(.forward)
                .foregroundStyle(DS.Colors.textSecondary)
        }
    }
    .dsScreenPadding()
    .background {
        DSBackground()
            .ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Row — Dark") {
    DSCard {
        DSRow {
            DSIconTile(.tasks)
        } content: {
            Text("Concluir apresentação")
                .font(DS.Typography.body)
                .foregroundStyle(DS.Colors.textPrimary)
        }
    }
    .dsScreenPadding()
    .background {
        DSBackground()
            .ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("Row — Accessibility") {
    DSCard {
        DSRow {
            DSIconTile(.calendar)
        } content: {
            Text(
                "Reunião de planeamento semanal com a equipa"
            )
            .font(DS.Typography.body)
            .foregroundStyle(DS.Colors.textPrimary)
        } trailing: {
            Text("14:30")
                .font(DS.Typography.footnote)
                .foregroundStyle(DS.Colors.textSecondary)
        }
    }
    .dsScreenPadding()
    .background {
        DSBackground()
            .ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.accessibility3)
}
