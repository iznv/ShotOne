//
//  UIScrollView+Extensions.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 09/06/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    func scrollToTop() {
        setContentOffset(.zero, animated: true)
    }
    
}
