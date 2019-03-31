//
//  BoundsHolder.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 31/03/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

protocol BoundsHolder {
    
    var bounds: CGRect { get }
    
}

extension CALayer: BoundsHolder { }

extension UIView: BoundsHolder { }
