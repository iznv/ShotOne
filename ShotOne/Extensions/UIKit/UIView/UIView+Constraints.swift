//
//  UIView+Constraints.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 29/03/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

extension UIView {
    
    func activate(_ constraints: NSLayoutConstraint...) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
}
