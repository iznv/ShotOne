//
//  Theme+Images.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 08/06/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

extension Theme {
    
    var cryptoWalletImage: UIImage {
        return value(dark: .cryptoWalletBackgroundDark, light: .cryptoWalletBackgroundLight)
    }
    
    var dollarsWalletImage: UIImage {
        return value(dark: .dollarsWalletBackgroundDark, light: .dollarsWalletBackgroundLight)
    }
    
}
