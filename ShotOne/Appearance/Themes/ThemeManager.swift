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
    
    private static let userDefaults = UserDefaults.standard
    
    // MARK: - Computed Properties
    
    static var theme: Theme {
        get {
            return Theme(rawValue: userDefaults.theme) ?? defaultTheme
        }
        set {
            userDefaults.theme = newValue.rawValue
        }
    }

}

// MARK: - Public

extension ThemeManager {
    
    static func apply(theme: Theme) {
        NotificationCenter.default.post(name: .didChangeTheme, object: nil)
    }
    
    static func toggleTheme() {
        theme = theme == .light ? .dark : .light
        apply(theme: theme)
    }

}
