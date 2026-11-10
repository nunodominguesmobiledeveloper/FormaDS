//
//  ShowcaseCatalogItem.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 25/10/2026.
//

import Foundation

// MARK: - Catalog Category

enum ShowcaseCategory: String, CaseIterable, Identifiable {

    case foundations = "Foundations"
    case backgrounds = "Backgrounds"
    case components = "Components"
    case themes = "Themes"

    var id: String {
        rawValue
    }

    var title: LocalizedStringResource {
        switch self {
        case .foundations:
            "Foundations"
        case .backgrounds:
            "Backgrounds"
        case .components:
            "Components"
        case .themes:
            "Themes"
        }
    }
}

// MARK: - Catalog Item

struct ShowcaseCatalogItem: Identifiable, Hashable {

    // MARK: - Properties

    let id: String
    let title: LocalizedStringResource
    let subtitle: LocalizedStringResource
    let symbol: String
    let category: ShowcaseCategory

    init(
        id: String,
        title: LocalizedStringResource,
        subtitle: LocalizedStringResource,
        symbol: String,
        category: ShowcaseCategory
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.symbol = symbol
        self.category = category
    }

    static func == (
        lhs: ShowcaseCatalogItem,
        rhs: ShowcaseCatalogItem
    ) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Catalog Data

extension ShowcaseCatalogItem {

    static let all: [ShowcaseCatalogItem] = [

        // MARK: - Foundations

        .init(
            id: "colors",
            title: "Colors",
            subtitle: "Semantic colors and Light/Dark",
            symbol: "paintpalette",
            category: .foundations
        ),

        .init(
            id: "typography",
            title: "Typography",
            subtitle: "Sora, Manrope and Dynamic Type",
            symbol: "textformat",
            category: .foundations
        ),

        .init(
            id: "spacing",
            title: "Spacing",
            subtitle: "Spacing scale and layout tokens",
            symbol: "arrow.left.and.right",
            category: .foundations
        ),

        .init(
            id: "radius",
            title: "Radius",
            subtitle: "Corner radius tokens",
            symbol: "square.on.square",
            category: .foundations
        ),

        .init(
            id: "sizes",
            title: "Sizes",
            subtitle: "Component dimensions and sizes",
            symbol: "ruler",
            category: .foundations
        ),

        .init(
            id: "icons",
            title: "Icons",
            subtitle: "Semantic SF Symbols",
            symbol: "square.grid.2x2",
            category: .foundations
        ),

        .init(
            id: "layout",
            title: "Layout",
            subtitle: "Layout guidelines and spacing",
            symbol: "rectangle.split.3x1",
            category: .foundations
        ),

        .init(
            id: "gradients",
            title: "Gradients",
            subtitle: "Semantic gradients and effects",
            symbol: "circle.lefthalf.filled",
            category: .foundations
        ),

        .init(
            id: "shadows",
            title: "Shadows",
            subtitle: "Elevation and shadow tokens",
            symbol: "square.on.circle",
            category: .foundations
        ),

        // MARK: - Backgrounds

        .init(
            id: "backgrounds",
            title: "Backgrounds",
            subtitle: "Aurora backgrounds and radial glows",
            symbol: "sparkles.rectangle.stack",
            category: .backgrounds
        ),

        // MARK: - Components

        .init(
            id: "cards",
            title: "Cards & Layout",
            subtitle: "Cards, rows and section headers",
            symbol: "rectangle.on.rectangle",
            category: .components
        ),

        .init(
            id: "buttons",
            title: "Buttons & Selection",
            subtitle: "Buttons, chips and controls",
            symbol: "hand.tap",
            category: .components
        ),

        .init(
            id: "forms",
            title: "Forms",
            subtitle: "Text fields, editors and search",
            symbol: "rectangle.and.pencil.and.ellipsis",
            category: .components
        ),

        .init(
            id: "indicators",
            title: "Indicators & Charts",
            subtitle: "Progress, statistics and weekly charts",
            symbol: "chart.bar.xaxis",
            category: .components
        ),

        .init(
            id: "navigation-feedback",
            title: "Navigation & Feedback",
            subtitle: "Native tabs, sheets, toasts and empty states",
            symbol: "rectangle.bottomthird.inset.filled",
            category: .components
        ),

        // MARK: - Themes

        .init(
            id: "theme-comparison",
            title: "Theme Comparison",
            subtitle: "Aurora and Horizon in Light/Dark",
            symbol: "paintpalette.fill",
            category: .themes
        )
    ]
}
