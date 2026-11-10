//
//  NavigationFeedbackGalleryView.swift
//  FormaDSShowcase
//
//  Created by Nuno Santos Domingues on 06/11/2026.
//

import SwiftUI
import FormaDS

// MARK: - Navigation & Feedback Gallery

struct NavigationFeedbackGalleryView: View {

    // MARK: - Environment

    @Environment(\.dismiss)
    private var dismiss

    // MARK: - Navigation State

    @State private var selectedTab:
        ShowcaseNavigationTab = .today

    // MARK: - Presentation State

    @State private var showSheet = false
    @State private var showConfirmation = false
    @State private var toast: DSToastData?

    // MARK: - Demo Data

    @State private var taskTitle = ""
    @State private var savedTaskTitle: String?
    @State private var previousSavedTaskTitle: String?

    // MARK: - Body

    var body: some View {
        DSTabBar(selection: $selectedTab) {

            tabScreen(for: .today) {
                galleryContent
            }
            .tabItem {
                Label(
                    ShowcaseNavigationTab.today.title,
                    systemImage:
                        ShowcaseNavigationTab.today.systemName
                )
            }
            .tag(ShowcaseNavigationTab.today)

            tabScreen(for: .tasks) {
                placeholderContent(for: .tasks)
            }
            .tabItem {
                Label(
                    ShowcaseNavigationTab.tasks.title,
                    systemImage:
                        ShowcaseNavigationTab.tasks.systemName
                )
            }
            .tag(ShowcaseNavigationTab.tasks)

            tabScreen(for: .habits) {
                placeholderContent(for: .habits)
            }
            .tabItem {
                Label(
                    ShowcaseNavigationTab.habits.title,
                    systemImage:
                        ShowcaseNavigationTab.habits.systemName
                )
            }
            .tag(ShowcaseNavigationTab.habits)

            tabScreen(for: .finance) {
                placeholderContent(for: .finance)
            }
            .tabItem {
                Label(
                    ShowcaseNavigationTab.finance.title,
                    systemImage:
                        ShowcaseNavigationTab.finance.systemName
                )
            }
            .tag(ShowcaseNavigationTab.finance)

            tabScreen(for: .more) {
                placeholderContent(for: .more)
            }
            .tabItem {
                Label(
                    ShowcaseNavigationTab.more.title,
                    systemImage:
                        ShowcaseNavigationTab.more.systemName
                )
            }
            .tag(ShowcaseNavigationTab.more)
        }
        .sheet(isPresented: $showSheet) {
            taskSheet
        }
        .dsConfirmationDialog(
            isPresented: $showConfirmation,
            title: "Delete demo data?",
            message: "This action will simulate deletion.",
            destructiveTitle: "Delete"
        ) {
            savedTaskTitle = nil

            presentToast(
                "Demo data deleted",
                style: .information
            )
        }
        .dsToast(
            toast: $toast,
            duration: 4
        ) { data in
            handleToastAction(data)
        }
    }

    // MARK: - Tab Screen

    private func tabScreen<Content: View>(
        for tab: ShowcaseNavigationTab,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationStack {
            content()
                .navigationTitle(tab.title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(
                        placement: .topBarTrailing
                    ) {
                        Button("Close") {
                            dismiss()
                        }
                        .accessibilityLabel(
                            "Close demo"
                        )
                    }
                }
        }
    }

    // MARK: - Gallery Content

    private var galleryContent: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: DS.Layout.sectionSpacing
            ) {
                introduction

                selectedTabSection

                feedbackSection

                savedTaskSection

                emptyStateSection

                confirmationSection
            }
            .dsScreenPadding()
            .padding(.vertical, DS.Spacing.regular)
        }
        .scrollIndicators(.hidden)
        .background {
            DSBackground()
                .ignoresSafeArea()
        }
    }

    // MARK: - Introduction

    private var introduction: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.compactSpacing
        ) {
            Text("Navigation & Feedback")
                .font(DS.Typography.titleSecondary)
                .foregroundStyle(DS.Colors.textPrimary)

            Text(
                "Experimenta os componentes interativos."
            )
            .font(DS.Typography.subtitle)
            .foregroundStyle(DS.Colors.textSecondary)
        }
    }

    // MARK: - Selected Tab

    private var selectedTabSection: some View {
        DSCard {
            VStack(
                alignment: .leading,
                spacing: DS.Layout.itemSpacing
            ) {
                Text("Separador selecionado")
                    .font(DS.Typography.caption)
                    .foregroundStyle(
                        DS.Colors.textSecondary
                    )

                Text(selectedTab.title)
                    .font(DS.Typography.heading)
                    .foregroundStyle(
                        DS.Colors.textPrimary
                    )

                Text(
                    "Use the bottom bar to change the selection."
                )
                .font(DS.Typography.body)
                .foregroundStyle(
                    DS.Colors.textSecondary
                )
            }
        }
    }

    // MARK: - Feedback

    private var feedbackSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "Feedback",
                subtitle: "Toasts and sheets"
            )

            DSButton("Open sheet") {
                showSheet = true
            }

            DSButton(
                "Show success",
                variant: .secondary
            ) {
                presentToast(
                    "Operation completed",
                    style: .success
                )
            }

            DSButton(
                "Show error",
                variant: .secondary
            ) {
                presentToast(
                    "Could not complete the operation",
                    style: .error
                )
            }

            DSButton(
                "Show information",
                variant: .secondary
            ) {
                presentToast(
                    "Synchronization completed",
                    style: .information
                )
            }
        }
    }

    // MARK: - Saved Task

    private var savedTaskSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "Undo",
                subtitle: "State reversal example"
            )

            DSCard {
                VStack(
                    alignment: .leading,
                    spacing: DS.Layout.itemSpacing
                ) {
                    if let savedTaskTitle {
                        Text("Task saved")
                            .font(DS.Typography.caption)
                            .foregroundStyle(
                                DS.Colors.textSecondary
                            )

                        Text(savedTaskTitle)
                            .font(DS.Typography.heading)
                            .foregroundStyle(
                                DS.Colors.textPrimary
                            )
                    } else {
                        Text("No saved task")
                            .font(DS.Typography.body)
                            .foregroundStyle(
                                DS.Colors.textSecondary
                            )
                    }

                    DSButton(
                        "Create sample task",
                        variant: .secondary
                    ) {
                        taskTitle = "Preparar o LifeHub"
                        saveTask()
                    }
                }
            }
        }
    }

    // MARK: - Empty State

    private var emptyStateSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "Empty State"
            )

            DSCard {
                DSEmptyState(
                    icon: .tasks,
                    title: "No tasks yet",
                    message: "Start by adding the first one.",
                    actionTitle: "New task"
                ) {
                    showSheet = true
                }
            }
        }
    }

    // MARK: - Confirmation

    private var confirmationSection: some View {
        VStack(
            alignment: .leading,
            spacing: DS.Layout.contentSpacing
        ) {
            DSSectionHeader(
                title: "Confirmation"
            )

            DSButton(
                "Test confirmation",
                variant: .secondary
            ) {
                showConfirmation = true
            }
        }
    }

    // MARK: - Placeholder

    private func placeholderContent(
        for tab: ShowcaseNavigationTab
    ) -> some View {
        VStack(
            spacing: DS.Layout.contentSpacing
        ) {
            Image(systemName: tab.systemName)
                .font(.system(size: 36))
                .foregroundStyle(
                    DS.Colors.accentPrimary
                )
                .accessibilityHidden(true)

            Text(tab.title)
                .font(DS.Typography.titlePrimary)
                .foregroundStyle(
                    DS.Colors.textPrimary
                )

            Text("Native navigation demonstration.")
                .font(DS.Typography.body)
                .foregroundStyle(
                    DS.Colors.textSecondary
                )
                .multilineTextAlignment(.center)

            DSButton(
                "Back to Today",
                variant: .secondary
            ) {
                selectedTab = .today
            }
        }
        .dsScreenPadding()
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background {
            DSBackground().ignoresSafeArea()
        }
    }

    // MARK: - Task Sheet

    private var taskSheet: some View {
        DSBottomSheet(
            title: "New task",
            actionTitle: "Save",
            onCancel: {
                showSheet = false
            },
            onAction: {
                showSheet = false
                saveTask()
            }
        ) {
            DSTextField(
                title: "Title",
                placeholder: "What do you need to do?",
                text: $taskTitle
            )
        }
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
    }

    // MARK: - Save Task

    private func saveTask() {
        let title = taskTitle.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !title.isEmpty else {
            presentToast(
                "Enter a task title",
                style: .error
            )
            return
        }

        previousSavedTaskTitle = savedTaskTitle
        savedTaskTitle = title

        toast = DSToastData(
            message: "Task saved",
            style: .success,
            actionTitle: "Undo"
        )
    }

    // MARK: - Toast Action

    private func handleToastAction(
        _ data: DSToastData
    ) {
        guard data.actionTitle != nil else {
            return
        }

        savedTaskTitle = previousSavedTaskTitle
    }

    // MARK: - Present Toast

    private func presentToast(
        _ message: LocalizedStringResource,
        style: DSToastStyle
    ) {
        toast = DSToastData(
            message: message,
            style: style
        )
    }
}

// MARK: - Previews

#Preview("Navigation — Light") {
    NavigationFeedbackGalleryView()
        .preferredColorScheme(.light)
}

#Preview("Navigation — Dark") {
    NavigationFeedbackGalleryView()
        .preferredColorScheme(.dark)
}

#Preview("Navigation — Accessibility") {
    NavigationFeedbackGalleryView()
        .preferredColorScheme(.dark)
        .dynamicTypeSize(.accessibility3)
}

#Preview("Navigation — Interactive") {
    NavigationFeedbackGalleryView()
}
