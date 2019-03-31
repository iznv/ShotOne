//
//  CALayer.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 25/03/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import QuartzCore

extension CALayer {
    
    func addSublayers(_ sublayers: CALayer...) {
        sublayers.forEach { layer in
            addSublayer(layer)
        }
    }
    
}
