//
//  Theme.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 02/06/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

struct Theme {
    
    // MARK: - ID
    
    var id: String
    
    // MARK: - Images
    
    var cryptoWalletBackgroundImage: UIImage
    
    var dollarsWalletBackgroundImage: UIImage
    
    // MARK: - Colors
    
    var gripColor: UIColor
    
    var transactionsHeaderColor: UIColor
    
    var primaryTextColor: UIColor
    
    var secondaryTextColor: UIColor
    
    var mainBackgroundColors: [UIColor]
    
    var transactionsBackgroundColors: [UIColor]
    
    var currencyBackgroundColors: [UIColor]
    
    // MARK: - Values
    
    var mainBackgroundImageAlpha: CGFloat
    
    var walletLargeValueAlpha: CGFloat
    
    var shouldShowPathIconShadow: Bool
    
    var currencyViewLayerShadowOpacity: Float
    
    var mainStatusBarWithOpenBottomPanelStyle: UIStatusBarStyle

    var mainStatusBarWithClosedBottomPanelStyle: UIStatusBarStyle
    
}
