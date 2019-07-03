//
//  Number.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 03/07/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import Foundation

protocol Number {
    
    var number: NSNumber { get }
    
}

extension Double: Number {
    
    var number: NSNumber {
        return NSNumber(value: self)
    }
    
}
