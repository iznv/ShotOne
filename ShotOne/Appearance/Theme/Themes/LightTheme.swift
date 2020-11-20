//
//  LightTheme.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 08/06/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

extension Theme {
    
    static let lightThemeId = "Light"
    
    static let light = Theme(
        id: lightThemeId,
        cryptoWalletBackgroundImage: .cryptoWalletBackgroundLight,
        dollarsWalletBackgroundImage: .dollarsWalletBackgroundLight,
        gripColor: .gripLight,
        transactionsHeaderColor: .transactionsHeaderLight,
        primaryTextColor: .primaryTextLight,
        secondaryTextColor: .secondaryTextLight,
        mainBackgroundColors: [.mainBackgroundStartLight, .mainBackgroundEndLight],
        transactionsBackgroundColors: [.transactionsBackgroundStartLight, .transactionsBackgroundEndLight],
        currencyBackgroundColors: [.currencyBackgroundStartLight, .currencyBackgroundEndLight],
        mainBackgroundImageAlpha: 0,
        walletLargeValueAlpha: 0.07,
        shouldShowPathIconShadow: false,
        currencyViewLayerShadowOpacity: 0.1,
        mainStatusBarWithOpenBottomPanelStyle: .defaultSupport13iOS,
        mainStatusBarWithClosedBottomPanelStyle: .lightContent
    )
    
}

// MARK: - Private

private extension UIStatusBarStyle {
    
    static var defaultSupport13iOS: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return UIStatusBarStyle.darkContent
        } else {
            return UIStatusBarStyle.default
        }
    }
    
}
