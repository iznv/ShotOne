//
//  ThemeManager.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 02/06/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import Foundation

enum ThemeManager {
    
    // MARK: - Properties
    
    static let defaultTheme: Theme = .dark
    
    private static let themes: [Theme] = [
        .dark,
        .light
    ]
    
    private static let userDefaults = UserDefaults.standard

}

// MARK: - Computed Properties

extension ThemeManager {
    
    static var theme: Theme {
        get {
            return themes.first { $0.id == userDefaults.themeId } ?? defaultTheme
        }
        set {
            userDefaults.themeId = newValue.id
        }
    }
    
}

// MARK: - Public

extension ThemeManager {
    
    static func apply(theme: Theme) {
        NotificationCenter.default.post(name: .didChangeTheme, object: nil)
    }
    
    static func toggleTheme() {
        switch theme.id {
        case Theme.lightThemeId:
            theme = .dark
        case Theme.darkThemeId:
            theme = .light
        default:
            theme = defaultTheme
        }

        apply(theme: theme)
    }

}
