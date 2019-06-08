//
//  AppDelegate.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 25/03/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    
    // MARK: - Properties

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    private let userDefaults = UserDefaults.standard

}

// MARK: - UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureUserDefaults()
        configureAppearance()
        
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

// MARK: - Appearance

private extension AppDelegate {
    
    func configureUserDefaults() {
        userDefaults.register(defaults: [UserDefaults.Keys.themeId : ThemeManager.defaultTheme.id])
    }
    
    func configureAppearance() {
        CurrencyView.appearance().configure()
    }
    
}
