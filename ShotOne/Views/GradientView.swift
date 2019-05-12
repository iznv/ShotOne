//
//  GradientView.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 12/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    // MARK: - Overrides
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    override var layer: CAGradientLayer {
        return super.layer as! CAGradientLayer
    }
    
}

// MARK: - Public

extension GradientView {

    func set(colors: [UIColor]) {
        layer.set(colors: colors)
    }
    
}
