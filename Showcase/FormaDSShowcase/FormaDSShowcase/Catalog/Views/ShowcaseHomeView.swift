//
//  ShowcaseHomeView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 25/10/2026.
//

import SwiftUI
import FormaDS

// MARK: - Showcase Home

struct ShowcaseHomeView: View {

    // MARK: - State

    @State private var showNavigationFeedback = false
    @State private var selectedTheme: ShowcaseThemeOption = .aurora
    @State private var selectedColorScheme: ColorScheme = .dark
    @State private var selectedLanguage: ShowcaseLanguage = .english

    // MARK: - Body

    var body: some View {
        NavigationStack {
            List {
                ForEach(ShowcaseCategory.allCases) { category in
                    categorySection(category)
                }
            }
            .navigationTitle("FormaDS Showcase")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    languagePicker
                    themePicker
                    appearancePicker
                }
            }
            .navigationDestination(
                for: ShowcaseCatalogItem.self
            ) { item in
                destination(for: item)
            }
        }
        .environment(\.locale, selectedLanguage.locale)
        .dsTheme(selectedTheme.theme)
        .preferredColorScheme(selectedColorScheme)
        .fullScreenCover(
            isPresented: $showNavigationFeedback
        ) {
            NavigationFeedbackGalleryView()
                .dsTheme(selectedTheme.theme)
                .preferredColorScheme(selectedColorScheme)
        }
    }

    // MARK: - Language Picker

    private var languagePicker: some View {
        Picker("Language", selection: $selectedLanguage) {
            ForEach(ShowcaseLanguage.allCases) { language in
                Text(language.title)
                    .tag(language)
            }
        }
        .pickerStyle(.menu)
        .accessibilityLabel("Select language")
    }

    // MARK: - Theme Picker

    private var themePicker: some View {
        Picker("Theme", selection: $selectedTheme) {
            ForEach(ShowcaseThemeOption.allCases) { option in
                Text(option.title)
                    .tag(option)
            }
        }
        .pickerStyle(.menu)
        .accessibilityLabel("Select theme")
    }

    // MARK: - Appearance Picker

    private var appearancePicker: some View {
        Picker(
            "Appearance",
            selection: $selectedColorScheme
        ) {
            Label("Light", systemImage: "sun.max")
                .tag(ColorScheme.light)

            Label("Dark", systemImage: "moon.stars")
                .tag(ColorScheme.dark)
        }
        .pickerStyle(.menu)
        .accessibilityLabel("Select appearance")
    }

    // MARK: - Category Section

    private func categorySection(
        _ category: ShowcaseCategory
    ) -> some View {
        Section(category.title) {
            ForEach(
                ShowcaseCatalogItem.all.filter {
                    $0.category == category
                }
            ) { item in
                catalogItem(for: item)
            }
        }
    }

    // MARK: - Catalog Item

    @ViewBuilder
    private func catalogItem(
        for item: ShowcaseCatalogItem
    ) -> some View {
        if item.id == "navigation-feedback" {
            Button {
                showNavigationFeedback = true
            } label: {
                catalogRow(for: item)
            }
            .buttonStyle(.plain)
        } else {
            NavigationLink(value: item) {
                catalogRow(for: item)
            }
        }
    }

    // MARK: - Catalog Row

    private func catalogRow(
        for item: ShowcaseCatalogItem
    ) -> some View {
        HStack(
            alignment: .center,
            spacing: DS.Layout.itemSpacing
        ) {
            Image(systemName: item.symbol)
                .font(.system(size: 20))
                .foregroundStyle(DS.Colors.accentPrimary)
                .frame(width: 36, height: 36)

            VStack(
                alignment: .leading,
                spacing: DS.Layout.compactSpacing
            ) {
                Text(item.title)
                    .font(DS.Typography.subtitle)
                    .foregroundStyle(DS.Colors.textPrimary)

                Text(item.subtitle)
                    .font(DS.Typography.caption)
                    .foregroundStyle(DS.Colors.textSecondary)
            }

            Spacer(minLength: DS.Spacing.xSmall)

            if item.id == "navigation-feedback" {
                Image(
                    systemName: "arrow.up.left.and.arrow.down.right"
                )
                .foregroundStyle(DS.Colors.textSecondary)
                .accessibilityHidden(true)
            }
        }
        .padding(.vertical, DS.Spacing.xxSmall)
        .contentShape(Rectangle())
    }

    // MARK: - Destinations

    @ViewBuilder
    private func destination(
        for item: ShowcaseCatalogItem
    ) -> some View {
        switch item.id {

        // MARK: Foundations

        case "colors":
            ColorsGalleryView()

        case "typography":
            TypographyGalleryView()

        case "spacing":
            SpacingGalleryView()

        case "radius":
            RadiusGalleryView()

        case "sizes":
            SizesGalleryView()

        case "icons":
            IconsGalleryView()

        case "layout":
            LayoutGalleryView()

        // MARK: Effects

        case "gradients":
            GradientsGalleryView()

        case "shadows":
            ShadowsGalleryView()

        // MARK: Backgrounds

        case "backgrounds":
            BackgroundsGalleryView()

        // MARK: Components

        case "cards":
            CardsGalleryView()

        case "buttons":
            ButtonsSelectionGalleryView()

        case "forms":
            FormsGalleryView()

        case "indicators":
            IndicatorsGalleryView()

        // MARK: Themes

        case "theme-comparison":
            ThemeComparisonGalleryView()

        default:
            ShowcasePlaceholderView(item: item)
        }
    }
}

// MARK: - Previews

#Preview("Showcase Home") {
    ShowcaseHomeView()
}
