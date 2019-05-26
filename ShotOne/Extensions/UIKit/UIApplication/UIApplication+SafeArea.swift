//
//  UIApplication+SafeArea.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 26/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

extension UIApplication {
    
    var safeAreaInsets: UIEdgeInsets {
        guard let insets = delegate?.window??.safeAreaInsets else {
            fatalError()
        }
        
        return insets
    }
    
}
