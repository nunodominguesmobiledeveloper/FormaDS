//
//  DS.swift
//  FormaDS
//
//  Created by Nuno Santos Domingues on 25/10/2026.
//

import Foundation

public enum DS {
    public static let identifier: String = "FormaDS"
}


enum DSLocalizedString {
    static func cancel(locale: Locale) -> LocalizedStringResource {
        resource("ds.action.cancel", defaultValue: "Cancel", locale: locale, comment: "Generic cancel action used by FormaDS components.")
    }

    static func dismissNotification(locale: Locale) -> LocalizedStringResource {
        resource("ds.notification.dismiss", defaultValue: "Dismiss notification", locale: locale, comment: "Accessibility label for dismissing a toast notification.")
    }

    static func toastActionHint(locale: Locale) -> LocalizedStringResource {
        resource("ds.notification.action.hint", defaultValue: "Performs the action associated with the notification", locale: locale, comment: "Accessibility hint for a toast action button.")
    }

    static func searchPlaceholder(locale: Locale) -> LocalizedStringResource {
        resource("ds.search.placeholder", defaultValue: "Search…", locale: locale, comment: "Default placeholder for the search field.")
    }

    static func clearSearch(locale: Locale) -> LocalizedStringResource {
        resource("ds.search.clear", defaultValue: "Clear search", locale: locale, comment: "Accessibility label for the search field clear button.")
    }

    static func selected(locale: Locale) -> LocalizedStringResource {
        resource("ds.selection.selected", defaultValue: "Selected", locale: locale, comment: "Accessibility value for a selected control.")
    }

    static func notSelected(locale: Locale) -> LocalizedStringResource {
        resource("ds.selection.notSelected", defaultValue: "Not selected", locale: locale, comment: "Accessibility value for an unselected control.")
    }

    static func progress(locale: Locale) -> LocalizedStringResource {
        resource("ds.progress.label", defaultValue: "Progress", locale: locale, comment: "Default accessibility label for a progress indicator.")
    }

    static func barChart(locale: Locale) -> LocalizedStringResource {
        resource("ds.chart.bar.label", defaultValue: "Bar chart", locale: locale, comment: "Default accessibility label for a bar chart.")
    }

    private static func resource(
        _ key: StaticString,
        defaultValue: String.LocalizationValue,
        locale: Locale,
        comment: StaticString
    ) -> LocalizedStringResource {
        LocalizedStringResource(
            key,
            defaultValue: defaultValue,
            locale: locale,
            bundle: .atURL(Bundle.module.bundleURL),
            comment: comment
        )
    }
}
