//
//  File.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 09/11/2026.
//

import XCTest
@testable import FormaDS

final class ToastTests: XCTestCase {

    // MARK: - Toast Data

    func testDefaultToastHasNoAction() {
        let toast = DSToastData(
            message: "Sincronização concluída"
        )

        XCTAssertEqual(
            toast.message,
            "Sincronização concluída"
        )

        XCTAssertEqual(
            toast.style,
            .information
        )

        XCTAssertNil(toast.actionTitle)
    }

    func testToastSupportsUndoTitle() {
        let toast = DSToastData(
            message: "Tarefa guardada",
            style: .success,
            actionTitle: "Desfazer"
        )

        XCTAssertEqual(
            toast.actionTitle,
            "Desfazer"
        )
    }

    func testToastIdentifiersAreUnique() {
        let first = DSToastData(
            message: "Primeira mensagem"
        )

        let second = DSToastData(
            message: "Segunda mensagem"
        )

        XCTAssertNotEqual(
            first.id,
            second.id
        )
    }

    // MARK: - Toast Styles

    func testSuccessUsesSemanticColor() {
        XCTAssertEqual(
            DSToastStyle.success.color,
            .stateSuccess
        )
    }

    func testErrorUsesSemanticColor() {
        XCTAssertEqual(
            DSToastStyle.error.color,
            .stateError
        )
    }

    func testInformationUsesAccentColor() {
        XCTAssertEqual(
            DSToastStyle.information.color,
            .accentPrimary
        )
    }
}
