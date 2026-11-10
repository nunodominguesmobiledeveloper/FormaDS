//
//  PackageSmokeTests.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 25/10/2026.
//

import Foundation
import SwiftUI
import XCTest
@testable import FormaDS

final class PackageSmokeTests: XCTestCase {

    // MARK: - Tests
    func testPackageIdentifier() {
        XCTAssertEqual(
            DS.identifier,
            "FormaDS"
        )
    }

    func testPackageDefaultsResolveInEnglish() {
        XCTAssertEqual(
            localized(DSLocalizedString.cancel(locale: Locale(identifier: "en"))),
            "Cancel"
        )
        XCTAssertEqual(
            localized(DSLocalizedString.clearSearch(locale: Locale(identifier: "en"))),
            "Clear search"
        )
        XCTAssertEqual(
            localized(DSLocalizedString.dismissNotification(locale: Locale(identifier: "en"))),
            "Dismiss notification"
        )
    }

    func testPackageDefaultsResolveInEuropeanPortuguese() {
        XCTAssertEqual(
            localized(DSLocalizedString.cancel(locale: Locale(identifier: "pt-PT"))),
            "Cancelar"
        )
        XCTAssertEqual(
            localized(DSLocalizedString.clearSearch(locale: Locale(identifier: "pt-PT"))),
            "Limpar pesquisa"
        )
        XCTAssertEqual(
            localized(DSLocalizedString.dismissNotification(locale: Locale(identifier: "pt-PT"))),
            "Fechar notificação"
        )
    }

    @MainActor
    func testConsumerCanOverrideInternalText() {
        let sheet = DSBottomSheet(
            title: "Example",
            cancelTitle: "Go back",
            onCancel: {}
        ) {
            EmptyView()
        }
        let toast = DSToast(
            data: DSToastData(message: "Saved"),
            dismissAccessibilityLabel: "Close alert",
            actionAccessibilityHint: "Runs the custom action",
            onDismiss: {}
        )

        XCTAssertEqual(sheet.cancelTitle, "Go back")
        XCTAssertEqual(toast.dismissAccessibilityLabel, "Close alert")
        XCTAssertEqual(toast.actionAccessibilityHint, "Runs the custom action")
    }

    @MainActor
    func testDefaultAndVerbatimAPIsRemainAvailable() {
        let progress = DSProgressBar(progress: 0.5)
        let customProgress = DSProgressBar(
            progress: 0.5,
            accessibilityTitle: "Budget used"
        )

        XCTAssertNil(progress.accessibilityTitle)
        XCTAssertEqual(customProgress.accessibilityTitle, "Budget used")
    }

    private func localized(_ resource: LocalizedStringResource) -> String {
        String(localized: resource)
    }
}
