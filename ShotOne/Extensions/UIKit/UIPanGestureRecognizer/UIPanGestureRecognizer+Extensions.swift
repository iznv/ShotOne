//
//  UIPanGestureRecognizer+Extensions.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 26/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

extension UIPanGestureRecognizer {
    
    enum Direction {
        
        case up
        
        case down
        
        case `static`
        
    }
    
}

extension UIPanGestureRecognizer {

    func direction(in view: UIView) -> Direction {
        let velocity = self.velocity(in: view).y
        
        switch velocity {
        case let x where x < 0:
            return .up
        case let x where x > 0:
            return .down
        default:
            return .static
        }
    }
    
}
