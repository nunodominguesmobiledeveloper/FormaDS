//
//  FormaDSShowcaseApp.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 25/10/2026.
//

import SwiftUI
import FormaDS

@main
struct FormaDSShowcaseApp: App {
    
    init() {
            DSFontRegistry.registerFonts()
        }
    
    var body: some Scene {
        WindowGroup {
            ShowcaseHomeView()
        }
    }
}
