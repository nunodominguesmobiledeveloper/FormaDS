//
//  FormsGalleryView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 31/10/2026.
//

import SwiftUI
import FormaDS

// MARK: - Forms Gallery

struct FormsGalleryView: View {

    @Environment(\.locale) private var locale

    // MARK: - State

    @State private var taskTitle = ""
    @State private var taskNotes = ""
    @State private var searchText = ""
    @State private var titleError: LocalizedStringResource?
    @State private var savedTasks: [String] = []

    private let sampleTasks: [LocalizedStringResource] = [
        "Review documentation",
        "Prepare presentation",
        "Work out at the gym"
    ]

    // MARK: - Filtered Tasks

    private var filteredTasks: [String] {
        let tasks = localizedSampleTasks + savedTasks

        guard !searchText.isEmpty else {
            return tasks
        }

        return tasks.filter {
            $0.localizedCaseInsensitiveContains(searchText)
        }
    }

    private var localizedSampleTasks: [String] {
        sampleTasks.map { resource in
            var localizedResource = resource
            localizedResource.locale = locale
            return String(localized: localizedResource)
        }
    }

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: DS.Layout.sectionSpacing
            ) {
                introduction

                taskFormSection

                searchSection

                statesSection
            }
            .dsScreenPadding()
            .padding(.vertical, DS.Spacing.regular)
        }
        .scrollDismissesKeyboard(.interactively)
        .background {
            DSBackground().ignoresSafeArea()
        }
        .navigationTitle("Forms")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Introduction

    private var introduction: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            Text("Forms")
                .font(DS.Typography.titleSecondary)
                .foregroundStyle(DS.Colors.textPrimary)

            Text("Text input, validation and search.")
                .font(DS.Typography.subtitle)
                .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Task Form

    private var taskFormSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "New task",
                subtitle: "Interactive form example"
            )

            DSCard {
                VStack(
                    spacing: DS.Layout.contentSpacing
                ) {
                    DSTextField(
                        title: "Title",
                        placeholder: "What do you need to do?",
                        text: $taskTitle,
                        errorMessage: titleError
                    )

                    DSTextEditor(
                        title: "Notes",
                        placeholder: "Add details...",
                        text: $taskNotes,
                        helperText: "Optional"
                    )

                    DSButton(
                        "Save task",
                        icon: .add
                    ) {
                        saveTask()
                    }
                }
            }
        }
    }

    // MARK: - Search

    private var searchSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "Search",
                subtitle: "Filter demo tasks"
            )

            DSSearchField(
                placeholder: "Search tasks...",
                text: $searchText
            )

            DSCard {
                VStack(
                    alignment: .leading,
                    spacing: DS.Layout.itemSpacing
                ) {
                    ForEach(filteredTasks, id: \.self) { task in
                        DSRow {
                            DSIconTile(.tasks)
                        } content: {
                            Text(task)
                                .font(DS.Typography.body)
                                .foregroundStyle(
                                    DS.Colors.textPrimary
                                )
                        }
                    }

                    if filteredTasks.isEmpty {
                        Text("No tasks found.")
                            .font(DS.Typography.body)
                            .foregroundStyle(
                                DS.Colors.textSecondary
                            )
                    }
                }
            }
        }
    }

    // MARK: - States

    private var statesSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "States",
                subtitle: "Error and disabled examples"
            )

            DSCard {
                VStack(spacing: DS.Layout.contentSpacing) {
                    DSTextField(
                        title: "Erro",
                        placeholder: "Required field",
                        text: .constant(""),
                        errorMessage: "This field is required."
                    )

                    DSTextField(
                        title: "Disabled",
                        placeholder: "Not editable",
                        text: .constant("Valor protegido")
                    )
                    .disabled(true)
                }
            }
        }
    }

    // MARK: - Save Task

    private func saveTask() {
        let trimmedTitle = taskTitle.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !trimmedTitle.isEmpty else {
            titleError = "Enter the task title."
            return
        }

        savedTasks.insert(trimmedTitle, at: 0)

        taskTitle = ""
        taskNotes = ""
        titleError = nil
    }
}

// MARK: - Previews

#Preview("Forms — Light") {
    NavigationStack {
        FormsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.light)
}

#Preview("Forms — Dark") {
    NavigationStack {
        FormsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
}

#Preview("Forms — Accessibility") {
    NavigationStack {
        FormsGalleryView()
    }
    .dsTheme(.aurora)
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.accessibility3)
}

#Preview("Forms — Interactive") {
    NavigationStack {
        FormsGalleryView()
    }
    .dsTheme(.aurora)
}
