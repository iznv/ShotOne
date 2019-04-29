//
//  CGFloat+Sign.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 29/04/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import CoreGraphics

extension CGFloat {
    
    var isPositive: Bool {
        return self > 0
    }
    
    var isNegative: Bool {
        return self < 0
    }
    
}
