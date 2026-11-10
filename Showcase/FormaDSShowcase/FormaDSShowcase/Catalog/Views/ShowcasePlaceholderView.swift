//
//  ShowcasePlaceholderView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 25/10/2026.
//

import SwiftUI

struct ShowcasePlaceholderView: View {
    
    // MARK: - Properties
    let item: ShowcaseCatalogItem
    
    // MARK: - Body
    var body: some View {
        ContentUnavailableView {
            Label(
                item.title,
                systemImage: item.symbol
            )
        } description: {
            Text("This gallery will be implemented in a future phase."
            )
        }
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview Fixtures
private extension ShowcaseCatalogItem {
    static let previewColors = ShowcaseCatalogItem(
        id: "preview-colors",
        title: "Colors",
        subtitle: "Semantic colors",
        symbol: "paintpalette",
        category: .foundations
    )
    
    static let previewButtons = ShowcaseCatalogItem(
        id: "preview-buttons",
        title: "Buttons",
        subtitle: "Variants and states",
        symbol: "hand.tap",
        category: .components
    )
}

// MARK: - Previews
#Preview("Colors - Light") {
    NavigationStack {
        ShowcasePlaceholderView(
            item: .previewColors
        )
    }
    .preferredColorScheme(.light)
}

#Preview("Colors - Dark") {
    NavigationStack {
        ShowcasePlaceholderView(
            item: .previewColors
        )
    }
    .preferredColorScheme(.dark)
}

#Preview("Buttons - Light") {
    NavigationStack {
        ShowcasePlaceholderView(
            item: .previewButtons
        )
    }
    .preferredColorScheme(.light)
}

#Preview("Buttons - Dark") {
    NavigationStack {
        ShowcasePlaceholderView(
            item: .previewButtons
        )
    }
    .preferredColorScheme(.dark)
}

