//
//  DarkTheme.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 08/06/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

extension Theme {
    
    static let darkThemeId = "Dark"
    
    static let dark = Theme(
        id: darkThemeId,
        cryptoWalletBackgroundImage: .cryptoWalletBackgroundDark,
        dollarsWalletBackgroundImage: .dollarsWalletBackgroundDark,
        gripColor: .gripDark,
        transactionsHeaderColor: .transactionsHeaderDark,
        primaryTextColor: .primaryTextDark,
        secondaryTextColor: .secondaryTextDark,
        mainBackgroundColors: [.mainBackgroundStartDark, .mainBackgroundEndDark],
        transactionsBackgroundColors: [.transactionsBackgroundStartDark, .transactionsBackgroundEndDark],
        currencyBackgroundColors: [.currencyBackgroundStartDark, .currencyBackgroundEndDark],
        mainBackgroundImageAlpha: 1,
        walletLargeValueAlpha: 0,
        shouldShowPathIconShadow: true,
        currencyViewLayerShadowOpacity: 0
    )
    
}
