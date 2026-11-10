//
//  DSFormFieldSurface.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 31/10/2026.
//

import SwiftUI

// MARK: - Form Field Surface

public struct DSFormFieldSurface<Content: View>: View {

    // MARK: - Environment

    @Environment(\.isEnabled)
    private var isEnabled

    // MARK: - Properties

    public let state: DSFormFieldState
    public let isFocused: Bool
    public let cornerRadius: CGFloat
    public let minimumHeight: CGFloat

    private let content: Content

    // MARK: - Initialization

    public init(
        state: DSFormFieldState = .normal,
        isFocused: Bool = false,
        cornerRadius: CGFloat = DS.Sizes.TextField.cornerRadius,
        minimumHeight: CGFloat = DS.Sizes.TextField.minimumHeight,
        @ViewBuilder content: () -> Content
    ) {
        self.state = state
        self.isFocused = isFocused
        self.cornerRadius = cornerRadius
        self.minimumHeight = minimumHeight
        self.content = content()
    }

    // MARK: - Body

    public var body: some View {
        content
            .padding(
                .horizontal,
                DS.Sizes.TextField.horizontalPadding
            )
            .frame(
                maxWidth: .infinity,
                minHeight: minimumHeight,
                alignment: .leading
            )
            .background(
                DS.Colors.surfaceElevated,
                in: RoundedRectangle(
                    cornerRadius: cornerRadius,
                    style: .continuous
                )
            )
            .overlay {
                RoundedRectangle(
                    cornerRadius: cornerRadius,
                    style: .continuous
                )
                .strokeBorder(
                    borderColor,
                    lineWidth: borderWidth
                )
            }
            .opacity(isEnabled ? 1 : 0.6)
    }

    // MARK: - Border Color

    private var borderColor: DSColorToken {
        if !isEnabled {
            return .borderCard
        }

        if state.hasError {
            return .stateError
        }

        if isFocused {
            return .accentPrimary
        }

        return .borderCard
    }

    // MARK: - Border Width

    private var borderWidth: CGFloat {
        if isEnabled && (isFocused || state.hasError) {
            return DS.Sizes.TextField.focusedBorderWidth
        }

        return DS.Sizes.TextField.borderWidth
    }
}

// MARK: - Previews

#Preview("Field Surfaces — Dark") {
    VStack(spacing: DS.Layout.contentSpacing) {
        DSFormFieldSurface {
            Text("Normal")
                .font(DS.Typography.body)
        }

        DSFormFieldSurface(isFocused: true) {
            Text("Focused")
                .font(DS.Typography.body)
        }

        DSFormFieldSurface(state: .error) {
            Text("Error")
                .font(DS.Typography.body)
        }
    }
    .foregroundStyle(DS.Colors.textPrimary)
    .dsScreenPadding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        DSBackground().ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("Field Surfaces — Light") {
    VStack(spacing: DS.Layout.contentSpacing) {
        DSFormFieldSurface {
            Text("Normal")
                .font(DS.Typography.body)
        }
        
        DSFormFieldSurface(state: .error) {
            Text("Error")
                .font(DS.Typography.body)
        }
        
        DSFormFieldSurface(isFocused: true) {
            Text("Focused")
                .font(DS.Typography.body)
                .foregroundStyle(DS.Colors.textPrimary)
        }
    }
    .dsScreenPadding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background {
        DSBackground().ignoresSafeArea()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
    
    
}
