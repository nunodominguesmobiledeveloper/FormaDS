//
//  DSTabBar.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 06/11/2026.
//

import SwiftUI

// MARK: - Design System Tab Bar

public struct DSTabBar<
    Selection: Hashable,
    Content: View
>: View {

    // MARK: - Environment

    @Environment(\.dsTheme)
    private var theme

    @Environment(\.colorScheme)
    private var colorScheme

    // MARK: - Selection

    @Binding private var selection: Selection

    // MARK: - Content

    private let content: Content

    // MARK: - Initialization

    public init(
        selection: Binding<Selection>,
        @ViewBuilder content: () -> Content
    ) {
        self._selection = selection
        self.content = content()
    }

    // MARK: - Theme Colors

    private var accentColor: Color {
        theme.color(
            for: .accentPrimary,
            appearance: colorScheme
        )
    }

    private var tabBarBackground: Color {
        theme.color(
            for: .backgroundTabBar,
            appearance: colorScheme
        )
    }

    // MARK: - Body

    public var body: some View {
        TabView(selection: $selection) {
            Group {
                content
            }
            .toolbarBackground(
                tabBarBackground,
                for: .tabBar
            )
            .toolbarBackground(
                .visible,
                for: .tabBar
            )
            .toolbarColorScheme(
                colorScheme,
                for: .tabBar
            )
        }
        .tint(accentColor)
    }
}

// MARK: - Preview Tab

private enum PreviewTab: String, Hashable {
    case dashboard
    case activity
    case settings
}

// MARK: - Preview Host

private struct DSTabBarPreview: View {

    // MARK: - State

    @State private var selectedTab: PreviewTab = .dashboard

    // MARK: - Body

    var body: some View {
        DSTabBar(selection: $selectedTab) {

            NavigationStack {
                previewScreen(title: "Dashboard")
                    .navigationTitle("Dashboard")
            }
            .tabItem {
                Label(
                    "Dashboard",
                    systemImage: "square.grid.2x2"
                )
            }
            .tag(PreviewTab.dashboard)

            NavigationStack {
                previewScreen(title: "Activity")
                    .navigationTitle("Activity")
            }
            .tabItem {
                Label(
                    "Activity",
                    systemImage: "chart.bar"
                )
            }
            .tag(PreviewTab.activity)

            NavigationStack {
                previewScreen(title: "Settings")
                    .navigationTitle("Settings")
            }
            .tabItem {
                Label(
                    "Settings",
                    systemImage: "gearshape"
                )
            }
            .tag(PreviewTab.settings)
        }
        .dsTheme(.aurora)
    }

    // MARK: - Preview Screen

    private func previewScreen(
        title: String
    ) -> some View {
        VStack(spacing: DS.Layout.contentSpacing) {
            Text(title)
                .font(DS.Typography.titlePrimary)
                .foregroundStyle(DS.Colors.textPrimary)

            DSCard {
                Text("Reusable navigation with FormaDS")
                    .font(DS.Typography.body)
                    .foregroundStyle(DS.Colors.textPrimary)
            }
        }
        .dsScreenPadding()
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background {
            DSBackground()
                .ignoresSafeArea()
        }
    }
}

// MARK: - Previews

#Preview("Generic Tabs — Light") {
    DSTabBarPreview()
        .preferredColorScheme(.light)
}

#Preview("Generic Tabs — Dark") {
    DSTabBarPreview()
        .preferredColorScheme(.dark)
}

#Preview("Generic Tabs — Interactive") {
    DSTabBarPreview()
}
