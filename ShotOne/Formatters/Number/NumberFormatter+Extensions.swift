//
//  NumberFormatter+Extensions.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 03/07/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import Foundation

extension NumberFormatter {
    
    static let sum: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        formatter.locale = .enUS
        formatter.minimumIntegerDigits = 2
        
        return formatter
    }()
    
    static let delta: NumberFormatter = {
        let formatter = NumberFormatter()

        formatter.minimumIntegerDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.positivePrefix = formatter.plusSign
        
        return formatter
    }()
    
}
