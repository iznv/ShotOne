//
//  Themeable.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 02/06/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

// MARK: - Constants

private enum Constants {
    
    enum Animation {

        static let duration = 0.5
        
        static let options: UIView.AnimationOptions = [
            .transitionCrossDissolve
        ]

    }

}

protocol Themeable: class {
    
    func apply(theme: Theme)
    
    func applyWithoutAnimation(theme: Theme, isInitialization: Bool)

}

// MARK: - Default

extension Themeable {
    
    func apply(theme: Theme) { }
    
    func applyWithoutAnimation(theme: Theme, isInitialization: Bool) { }
    
}

// MARK: - Public

extension Themeable {
    
    func enableTheme(for view: UIView) {
        initializeTheme()
        
        subscribeOnThemeChanges { [weak self] in
            UIView.transition(with: view,
                              duration: Constants.Animation.duration,
                              options: Constants.Animation.options,
                              animations: { self?.apply(theme: ThemeManager.theme) })
            
            self?.applyWithoutAnimation(theme: ThemeManager.theme, isInitialization: false)
        }
    }

}

// MARK: - Private

private extension Themeable {
    
    func initializeTheme() {
        apply(theme: ThemeManager.theme)
        applyWithoutAnimation(theme: ThemeManager.theme, isInitialization: true)
    }
    
    func subscribeOnThemeChanges(_ applyTheme: @escaping () -> ()) {
        NotificationCenter.default.addObserver(forName: .didChangeTheme,
                                               object: nil,
                                               queue: .main) { _ in
            applyTheme()
        }
    }
    
}
