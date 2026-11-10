//
//  DS+Sizes.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 26/10/2026.
//

import CoreGraphics

// MARK: - Component Size Tokens

public extension DS {
    
    enum Sizes {
        
        // MARK: - Card

        public enum Card {
            public static let borderWidth: CGFloat = 1
            public static let contentPadding: CGFloat =
                DS.Spacing.regular
        }
        
        // MARK: - Button
        public enum Button {
            public static let height: CGFloat = 52
            public static let smallHeight: CGFloat = 44
            public static let horizontalPadding: CGFloat = 22
        }
        
        // MARK: - Icon Tile

        public enum IconTile {
            public static let side: CGFloat = 34
            public static let cornerRadius: CGFloat = 10
        }
        
        // MARK: - Icon Button
        public enum IconButton {
            public static let side: CGFloat = 44
        }
        
        // MARK: - Chip
        public enum Chip {
            public static let minimumHeight: CGFloat = 44
            public static let horizontalPadding: CGFloat = 14
        }
        
        // MARK: - Segmented Control
        public enum SegmentedControl {
            public static let minimumSegmentHeight: CGFloat = 44
            public static let cornerRadius: CGFloat = 14
            public static let contentPadding: CGFloat = 3
            public static let selectedCornerRadius: CGFloat = 11
        }
        
        // MARK: - Text Field
        public enum TextField {
            public static let minimumHeight: CGFloat = 48
            public static let cornerRadius: CGFloat = 14
            public static let searchCornerRadius: CGFloat = 16
            public static let horizontalPadding: CGFloat = 14
            public static let borderWidth: CGFloat = 1
            public static let focusedBorderWidth: CGFloat = 2
            public static let multilineMinimumHeight: CGFloat = 92
        }
        
        // MARK: - Progress Bar
        public enum ProgressBar {
            public static let height: CGFloat = 10
        }
        
        // MARK: - Tab Bar
        public enum TabBar {
            public static let height: CGFloat = 68
            public static let cornerRadius: CGFloat = 34
            public static let contentPadding: CGFloat = 6
        }
        
        
        // MARK: - Indicators
        public enum Indicators {
            
            // MARK: - Badge
            public enum Badge {
                public static let horizontalPadding: CGFloat = DS.Spacing.small
                public static let verticalPadding: CGFloat = DS.Spacing.xxSmall
            }
            
            // MARK: - Progress Ring
            public enum ProgressRing {
                public static let side: CGFloat = 100
                public static let lineWidth: CGFloat = 10
            }
            
            // MARK: - Concentric Rings
            public enum ConcentricRings {
                public static let side: CGFloat = 170
                public static let lineWidth: CGFloat = 12
                
                public static let outerRadius: CGFloat = 76
                public static let middleRadius: CGFloat = 58
                public static let innerRadius: CGFloat = 40
            }
        }
        
        
        // MARK: - Charts
        public enum Charts {
            public static let weeklyPlotHeight: CGFloat = 100
            public static let minimumBarHeight: CGFloat = DS.Spacing.xxSmall
        }

    }
}
