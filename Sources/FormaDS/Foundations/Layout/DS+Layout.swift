//
//  DS+Layout.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import CoreGraphics

// MARK: - Layout Namespace
extension DS {
    public enum Layout {
        // MARK: - Screen
        public static let screenHorizontalPadding: CGFloat =
            DS.Spacing.regular

        // MARK: - Sections
        public static let sectionSpacing: CGFloat =
            DS.Spacing.large

        // MARK: - Content
        public static let contentSpacing: CGFloat =
            DS.Spacing.regular

        // MARK: - Related Items
        public static let itemSpacing: CGFloat =
            DS.Spacing.small

        // MARK: - Compact Content
        public static let compactSpacing: CGFloat =
            DS.Spacing.xSmall
    }
}
