//
//  File.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 09/11/2026.
//

import XCTest
import SwiftUI
@testable import FormaDS

// MARK: - Navigation & Feedback Tests

final class NavigationFeedbackTests: XCTestCase {

    // MARK: - Test Selection Types

    private enum TestTab: Hashable {
        case first
        case second
    }

    // MARK: - Generic Navigation

    @MainActor
    func testTabBarSupportsEnumSelection() {
        let selection = Binding<TestTab>(
            get: { .first },
            set: { _ in }
        )

        let tabBar = DSTabBar(selection: selection) {
            Text("First")
                .tabItem {
                    Label("First", systemImage: "house")
                }
                .tag(TestTab.first)

            Text("Second")
                .tabItem {
                    Label("Second", systemImage: "gearshape")
                }
                .tag(TestTab.second)
        }

        _ = tabBar
    }

    @MainActor
    func testTabBarSupportsStringSelection() {
        let selection = Binding<String>(
            get: { "dashboard" },
            set: { _ in }
        )

        let tabBar = DSTabBar(selection: selection) {
            Text("Dashboard")
                .tabItem {
                    Label(
                        "Dashboard",
                        systemImage: "square.grid.2x2"
                    )
                }
                .tag("dashboard")
        }

        _ = tabBar
    }

    // MARK: - Toast Styles

    func testToastStyles() {
        XCTAssertEqual(
            DSToastStyle.success.color,
            .stateSuccess
        )

        XCTAssertEqual(
            DSToastStyle.error.color,
            .stateError
        )

        XCTAssertEqual(
            DSToastStyle.information.color,
            .accentPrimary
        )
    }

    // MARK: - Toast Identity

    func testToastIdentity() {
        let toast = DSToastData(
            message: "Tarefa guardada",
            style: .success
        )

        XCTAssertEqual(toast.message, "Tarefa guardada")
        XCTAssertEqual(toast.style, .success)
    }
}
