//
//  Theme+Values.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 08/06/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import CoreGraphics

extension Theme {
    
    var mainBackgroundImageAlpha: CGFloat {
        return value(dark: 1, light: 0)
    }
    
    var walletLargeValueAlpha: CGFloat {
        return value(dark: 0, light: 0.07)
    }
    
    var shouldShowPathIconShadow: Bool {
        return value(dark: true, light: false)
    }
    
}
