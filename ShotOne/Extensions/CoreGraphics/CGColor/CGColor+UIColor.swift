//
//  UIColor+CGColor.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 25/03/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

extension CGColor {
    
    var uiColor: UIColor {
        return UIColor(cgColor: self)
    }
    
}
