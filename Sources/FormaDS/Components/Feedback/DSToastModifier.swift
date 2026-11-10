//
//  DSToastModifier.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 09/11/2026.
//

import SwiftUI
import UIKit

enum DSToastPresentationPolicy {
    static func shouldAutomaticallyDismiss(
        duration: TimeInterval,
        voiceOverEnabled: Bool
    ) -> Bool {
        !voiceOverEnabled && duration.isFinite && duration > 0
    }

    static func shouldPresentAction(
        actionTitle: LocalizedStringResource?,
        hasActionHandler: Bool
    ) -> Bool {
        actionTitle != nil && hasActionHandler
    }
}

// MARK: - Toast Modifier

struct DSToastModifier: ViewModifier {

    // MARK: - Environment

    @Environment(\.accessibilityVoiceOverEnabled)
    private var voiceOverEnabled

    @Environment(\.accessibilityReduceMotion)
    private var reduceMotion

    @Environment(\.locale)
    private var locale

    // MARK: - Binding

    @Binding private var toast: DSToastData?

    // MARK: - Configuration

    private let duration: TimeInterval
    private let onAction: ((DSToastData) -> Void)?

    // MARK: - Initialization

    init(
        toast: Binding<DSToastData?>,
        duration: TimeInterval = 4,
        onAction: ((DSToastData) -> Void)? = nil
    ) {
        self._toast = toast
        self.duration = duration
        self.onAction = onAction
    }

    // MARK: - Transition

    private var toastTransition: AnyTransition {
        if reduceMotion {
            return .opacity
        }

        return .move(edge: .top)
            .combined(with: .opacity)
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                if let currentToast = toast {
                    DSToast(
                        data: currentToast,
                        onDismiss: {
                            dismiss(currentToast)
                        },
                        onAction: DSToastPresentationPolicy.shouldPresentAction(
                            actionTitle: currentToast.actionTitle,
                            hasActionHandler: onAction != nil
                        )
                            ? {
                                performAction(currentToast)
                            }
                            : nil
                    )
                    .dsScreenPadding()
                    .padding(.top, DS.Spacing.xSmall)
                    .transition(toastTransition)
                    .zIndex(1)
                }
            }
            .task(id: toast?.id) {
                await scheduleDismissal()
            }
            .onChange(of: toast?.id) { _, newID in
                guard newID != nil,
                      let currentToast = toast,
                      voiceOverEnabled else {
                    return
                }

                UIAccessibility.post(
                    notification: .announcement,
                    argument: localizedAnnouncement(for: currentToast.message)
                )
            }
    }

    private func localizedAnnouncement(
        for resource: LocalizedStringResource
    ) -> String {
        var localizedResource = resource
        localizedResource.locale = locale
        return String(localized: localizedResource)
    }

    // MARK: - Automatic Dismissal

    @MainActor
    private func scheduleDismissal() async {
        guard let currentToast = toast else {
            return
        }

        // Keep the toast visible while
        // VoiceOver is enabled.
        guard DSToastPresentationPolicy.shouldAutomaticallyDismiss(
            duration: duration,
            voiceOverEnabled: voiceOverEnabled
        ) else {
            return
        }

        do {
            try await Task.sleep(
                for: .seconds(duration)
            )

            guard !Task.isCancelled,
                  toast?.id == currentToast.id else {
                return
            }

            dismiss(currentToast)
        } catch {
            // Task cancellation is expected when
            // the toast changes or disappears.
        }
    }

    // MARK: - Dismiss

    @MainActor
    private func dismiss(
        _ currentToast: DSToastData
    ) {
        guard toast?.id == currentToast.id else {
            return
        }

        withAnimation {
            toast = nil
        }
    }

    // MARK: - Action

    @MainActor
    private func performAction(
        _ currentToast: DSToastData
    ) {
        guard toast?.id == currentToast.id,
              let onAction else {
            return
        }

        withAnimation {
            toast = nil
        }

        onAction(currentToast)
    }
}

// MARK: - View Extension

public extension View {

    func dsToast(
        toast: Binding<DSToastData?>,
        duration: TimeInterval = 4,
        onAction: ((DSToastData) -> Void)? = nil
    ) -> some View {
        modifier(
            DSToastModifier(
                toast: toast,
                duration: duration,
                onAction: onAction
            )
        )
    }
}
