//
//  UIFont+CustomFont.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 31/03/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func custom(font: String,
                       ofSize size: CGFloat,
                       weight: UIFont.Weight) -> UIFont? {
        
        return UIFont(name: "\(font)-\(weight.title)", size: size)
    }
    
}
