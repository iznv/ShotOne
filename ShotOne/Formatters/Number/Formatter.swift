//
//  Formatter.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 03/07/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import Foundation

struct Formatter {
    
    static func format(_ value: Number,
                       using formatter: NumberFormatter) -> String? {
        
        return formatter.string(from: value.number)
    }
    
}
