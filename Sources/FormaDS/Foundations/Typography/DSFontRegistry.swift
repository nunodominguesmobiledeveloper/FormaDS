//
//  DSFontRegistry.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import Foundation
import SwiftUI
import CoreText

// MARK: - Font Registry

public enum DSFontRegistry {

    // MARK: - Font Files

    private static let fontFileNames: [String] = [
        "Sora-Regular",
        "Sora-SemiBold",
        "Sora-Bold",
        "Manrope-Regular",
        "Manrope-Medium",
        "Manrope-SemiBold",
        "Manrope-Bold"
    ]

    // MARK: - One-Time Registration

    private static let registration: Bool = {
        var allSucceeded = true

        for fileName in fontFileNames {
            if !registerFont(named: fileName) {
                allSucceeded = false
            }
        }

        return allSucceeded
    }()

    // MARK: - Public Registration

    @discardableResult
    public static func registerFonts() -> Bool {
        registration
    }

    // MARK: - Individual Font Registration

    private static func registerFont(
        named fileName: String
    ) -> Bool {
        guard let url = Bundle.module.url(
            forResource: fileName,
            withExtension: "ttf"
        ) else {
            NSLog(
                "[FormaDS] Missing font file: %@.ttf",
                fileName
            )
            return false
        }

        var error: Unmanaged<CFError>?

        let didRegister = CTFontManagerRegisterFontsForURL(
            url as CFURL,
            .process,
            &error
        )

        if didRegister {
            return true
        }

        let registrationError = error?
            .takeRetainedValue() as Error?

        if let registrationError {
            let nsError = registrationError as NSError

            if nsError.domain == (kCTFontManagerErrorDomain as String),
               nsError.code == CTFontManagerError.alreadyRegistered.rawValue {
                return true
            }

            NSLog(
                "[FormaDS] Font registration failed for %@: %@",
                fileName,
                nsError.localizedDescription
            )
        } else {
            NSLog(
                "[FormaDS] Font registration failed for %@",
                fileName
            )
        }

        return false
    }

    // MARK: - Font Availability

    public static func isRegistered(
        postScriptName: String
    ) -> Bool {
        registerFonts()

        let availableNames =
            CTFontManagerCopyAvailablePostScriptNames() as? [String] ?? []

        return availableNames.contains(postScriptName)
    }

    // MARK: - SwiftUI Font Resolution

    static func font(
        postScriptName: String,
        size: CGFloat,
        relativeTo textStyle: Font.TextStyle,
        fallbackWeight: Font.Weight
    ) -> Font {
        guard isRegistered(
            postScriptName: postScriptName
        ) else {
            return .system(
                textStyle,
                design: .default
            )
            .weight(fallbackWeight)
        }

        return .custom(
            postScriptName,
            size: size,
            relativeTo: textStyle
        )
    }
}
