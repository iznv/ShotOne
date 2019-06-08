//
//  Theme.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 02/06/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

enum Theme: Int {
    
    case dark
    
    case light
    
}

extension Theme {
    
    func value<T>(dark: T,
                  light: T) -> T {
        
        switch self {
        case .dark:
            return dark
        case .light:
            return light
        }
    }
    
}
