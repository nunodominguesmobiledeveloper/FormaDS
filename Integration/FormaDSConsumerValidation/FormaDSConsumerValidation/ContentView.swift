import SwiftUI
import FormaDS

struct ContentView: View {
    @State private var selectedTheme = ConsumerTheme.aurora
    @State private var selectedAppearance = ConsumerAppearance.light
    @State private var selectedLanguage = ConsumerLanguage.english
    @State private var name = ""
    @State private var progress = 0.35
    @State private var toast: DSToastData?
    @State private var isSheetPresented = false
    @State private var isConfirmationPresented = false
    @State private var confirmedCount = 0

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DS.Layout.sectionSpacing) {
                validationHeader
                configurationCard
                formCard
                feedbackCard
            }
            .dsScreenPadding()
            .padding(.vertical, DS.Spacing.regular)
        }
        .background {
            DSBackground()
                .ignoresSafeArea()
        }
        .dsToast(toast: $toast, duration: 4) { _ in
            progress = max(0, progress - 0.1)
            toast = DSToastData(
                message: consumerResource(
                    "consumer.toast.undone",
                    defaultValue: "Last update undone"
                ),
                style: .information
            )
        }
        .sheet(isPresented: $isSheetPresented) {
            DSBottomSheet(
                title: consumerResource(
                    "consumer.sheet.title",
                    defaultValue: "Consumer sheet"
                ),
                actionTitle: consumerResource(
                    "consumer.sheet.action",
                    defaultValue: "Confirm"
                ),
                onCancel: {
                    isSheetPresented = false
                },
                onAction: {
                    confirmedCount += 1
                    isSheetPresented = false
                }
            ) {
                Text(
                    consumerResource(
                        "consumer.sheet.message",
                        defaultValue: "This sheet is owned by the consumer application."
                    )
                )
                .foregroundStyle(DS.Colors.textSecondary)
            }
            .dsTheme(selectedTheme.theme)
            .preferredColorScheme(selectedAppearance.colorScheme)
            .environment(\.locale, selectedLanguage.locale)
            .presentationDetents([.medium])
        }
        .dsConfirmationDialog(
            isPresented: $isConfirmationPresented,
            title: consumerResource(
                "consumer.dialog.title",
                defaultValue: "Reset progress?"
            ),
            message: consumerResource(
                "consumer.dialog.message",
                defaultValue: "The progress value will return to zero."
            ),
            destructiveTitle: consumerResource(
                "consumer.dialog.action",
                defaultValue: "Reset"
            )
        ) {
            progress = 0
        }
        .dsTheme(selectedTheme.theme)
        .preferredColorScheme(selectedAppearance.colorScheme)
        .environment(\.locale, selectedLanguage.locale)
    }

    private var validationHeader: some View {
        VStack(alignment: .leading, spacing: DS.Spacing.small) {
            Text(
                consumerResource(
                    "consumer.title",
                    defaultValue: "FormaDS consumer validation"
                )
            )
            .font(DS.Typography.heading)
            .foregroundStyle(DS.Colors.textPrimary)

            Text(
                consumerResource(
                    "consumer.subtitle",
                    defaultValue: "Public APIs only · iOS 17+"
                )
            )
            .font(DS.Typography.body)
            .foregroundStyle(DS.Colors.textSecondary)
        }
        .accessibilityElement(children: .combine)
    }

    private var configurationCard: some View {
        DSCard(style: .elevated) {
            VStack(alignment: .leading, spacing: DS.Spacing.regular) {
                DSSectionHeader(
                    title: consumerResource(
                        "consumer.configuration",
                        defaultValue: "Configuration"
                    )
                )

                Picker(
                    selection: $selectedTheme,
                    label: Text(
                        consumerResource(
                            "consumer.theme",
                            defaultValue: "Theme"
                        )
                    )
                ) {
                    ForEach(ConsumerTheme.allCases) { theme in
                        Text(theme.title).tag(theme)
                    }
                }
                .pickerStyle(.segmented)
                .accessibilityIdentifier("consumer.theme")

                Picker(
                    selection: $selectedAppearance,
                    label: Text(
                        consumerResource(
                            "consumer.appearance",
                            defaultValue: "Appearance"
                        )
                    )
                ) {
                    ForEach(ConsumerAppearance.allCases) { appearance in
                        Text(appearance.title).tag(appearance)
                    }
                }
                .pickerStyle(.segmented)
                .accessibilityIdentifier("consumer.appearance")

                Picker(
                    selection: $selectedLanguage,
                    label: Text(
                        consumerResource(
                            "consumer.language",
                            defaultValue: "Language"
                        )
                    )
                ) {
                    ForEach(ConsumerLanguage.allCases) { language in
                        Text(language.title).tag(language)
                    }
                }
                .pickerStyle(.segmented)
                .accessibilityIdentifier("consumer.language")
            }
        }
    }

    private var formCard: some View {
        DSCard {
            VStack(alignment: .leading, spacing: DS.Spacing.regular) {
                DSSectionHeader(
                    title: consumerResource(
                        "consumer.components",
                        defaultValue: "Public components"
                    )
                )

                DSTextField(
                    title: consumerResource(
                        "consumer.name.title",
                        defaultValue: "Name"
                    ),
                    placeholder: consumerResource(
                        "consumer.name.placeholder",
                        defaultValue: "Enter a name"
                    ),
                    text: $name,
                    helperText: consumerResource(
                        "consumer.name.helper",
                        defaultValue: "This text comes from the consumer bundle."
                    )
                )
                .accessibilityIdentifier("consumer.name")

                VStack(alignment: .leading, spacing: DS.Spacing.small) {
                    HStack {
                        Text(
                            consumerResource(
                                "consumer.progress",
                                defaultValue: "Progress"
                            )
                        )
                        .foregroundStyle(DS.Colors.textPrimary)

                        Spacer()

                        Text(progress, format: .percent.precision(.fractionLength(0)))
                            .foregroundStyle(DS.Colors.textSecondary)
                    }

                    DSProgressBar(
                        progress: progress,
                        accessibilityTitle: localizedString(
                            "consumer.progress",
                            defaultValue: "Progress"
                        )
                    )

                    Slider(value: $progress, in: 0...1, step: 0.05)
                        .tint(DS.Colors.accentPrimary)
                        .accessibilityIdentifier("consumer.progress.slider")
                }

                DSButton(
                    consumerResource(
                        "consumer.advance",
                        defaultValue: "Advance progress"
                    ),
                    icon: .forward
                ) {
                    progress = min(1, progress + 0.1)
                    toast = DSToastData(
                        message: consumerResource(
                            "consumer.toast.updated",
                            defaultValue: "Progress updated"
                        ),
                        style: .success,
                        actionTitle: consumerResource(
                            "consumer.undo",
                            defaultValue: "Undo"
                        )
                    )
                }
                .accessibilityIdentifier("consumer.advance")
            }
        }
    }

    private var feedbackCard: some View {
        DSCard {
            VStack(alignment: .leading, spacing: DS.Spacing.regular) {
                DSSectionHeader(
                    title: consumerResource(
                        "consumer.feedback",
                        defaultValue: "Presentation and feedback"
                    ),
                    subtitle: consumerResource(
                        "consumer.confirmations",
                        defaultValue: "Confirmations: \(confirmedCount)"
                    )
                )

                DSButton(
                    consumerResource(
                        "consumer.open.sheet",
                        defaultValue: "Open sheet"
                    ),
                    variant: .secondary
                ) {
                    isSheetPresented = true
                }
                .accessibilityIdentifier("consumer.open.sheet")

                DSButton(
                    consumerResource(
                        "consumer.reset",
                        defaultValue: "Reset progress"
                    ),
                    variant: .secondary
                ) {
                    isConfirmationPresented = true
                }
                .accessibilityIdentifier("consumer.reset")
            }
        }
    }

    private func consumerResource(
        _ key: StaticString,
        defaultValue: String.LocalizationValue
    ) -> LocalizedStringResource {
        LocalizedStringResource(
            key,
            defaultValue: defaultValue,
            locale: selectedLanguage.locale,
            bundle: .main
        )
    }

    private func localizedString(
        _ key: StaticString,
        defaultValue: String.LocalizationValue
    ) -> String {
        String(
            localized: consumerResource(
                key,
                defaultValue: defaultValue
            )
        )
    }
}

private enum ConsumerTheme: String, CaseIterable, Identifiable {
    case aurora
    case horizon
    case midnightGold

    var id: Self { self }

    var title: String {
        switch self {
        case .aurora:
            "Aurora"
        case .horizon:
            "Horizon"
        case .midnightGold:
            "Midnight Gold"
        }
    }

    var theme: DSTheme {
        switch self {
        case .aurora:
            .aurora
        case .horizon:
            .horizon
        case .midnightGold:
            .midnightGold
        }
    }
}

private enum ConsumerAppearance: String, CaseIterable, Identifiable {
    case light
    case dark

    var id: Self { self }

    var title: LocalizedStringResource {
        switch self {
        case .light:
            "Light"
        case .dark:
            "Dark"
        }
    }

    var colorScheme: ColorScheme {
        switch self {
        case .light:
            .light
        case .dark:
            .dark
        }
    }
}

private enum ConsumerLanguage: String, CaseIterable, Identifiable {
    case english
    case portuguese

    var id: Self { self }

    var title: String {
        switch self {
        case .english:
            "EN"
        case .portuguese:
            "PT"
        }
    }

    var locale: Locale {
        switch self {
        case .english:
            Locale(identifier: "en")
        case .portuguese:
            Locale(identifier: "pt-PT")
        }
    }
}

#Preview("Aurora Light") {
    ContentView()
}
