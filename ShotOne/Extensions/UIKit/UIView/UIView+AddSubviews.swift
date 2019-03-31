//
//  UIView+AddSubviews.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 31/03/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            addSubview(subview)
        }
    }
    
}
