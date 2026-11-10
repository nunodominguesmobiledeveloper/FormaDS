//
//  File.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import SwiftUI

// MARK: - Typography Namespace

extension DS {

    public enum Typography {

        // MARK: - Body Text

        public static var caption: Font {
            DSTypographyToken.caption.font
        }

        public static var footnote: Font {
            DSTypographyToken.footnote.font
        }

        public static var subtitle: Font {
            DSTypographyToken.subtitle.font
        }

        public static var body: Font {
            DSTypographyToken.body.font
        }

        // MARK: - Headings

        public static var heading: Font {
            DSTypographyToken.heading.font
        }

        public static var titleSecondary: Font {
            DSTypographyToken.titleSecondary.font
        }

        public static var titlePrimary: Font {
            DSTypographyToken.titlePrimary.font
        }

        // MARK: - Display

        public static var displayNumber: Font {
            DSTypographyToken.displayNumber.font
        }

        // MARK: - Controls

        public static var button: Font {
            DSTypographyToken.button.font
        }
    }
}
