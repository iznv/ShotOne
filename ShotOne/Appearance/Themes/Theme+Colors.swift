//
//  Theme+Colors.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 08/06/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

extension Theme {
    
    var gripColor: UIColor {
        return value(dark: .gripDark,
                     light: .gripLight)
    }

    var transactionsHeaderColor: UIColor {
        return value(dark: .transactionsHeaderDark,
                     light: .transactionsHeaderLight)
    }
    
    var primaryTextColor: UIColor {
        return value(dark: .primaryTextDark,
                     light: .primaryTextLight)
    }
    
    var secondaryTextColor: UIColor {
        return value(dark: .secondaryTextDark,
                     light: .secondaryTextLight)
    }
    
    var mainBackgroundColors: [UIColor] {
        return value(dark: [.mainBackgroundStartDark, .mainBackgroundEndDark],
                     light: [.mainBackgroundStartLight, .mainBackgroundEndLight])
    }
    
    var transactionsBackgroundColors: [UIColor] {
        return value(dark: [.transactionsBackgroundStartDark, .transactionsBackgroundEndDark],
                     light: [.transactionsBackgroundStartLight, .transactionsBackgroundEndLight])
    }
    
    var currencyBackgroundColors: [UIColor] {
        return value(dark: [.currencyBackgroundStartDark, .currencyBackgroundEndDark],
                     light: [.currencyBackgroundStartLight, .currencyBackgroundEndLight])
    }
    
}
