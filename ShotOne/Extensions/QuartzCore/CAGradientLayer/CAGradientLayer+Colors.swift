//
//  CAGradientLayer+Colors.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 31/03/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    func set(colors: [UIColor]) {
        self.colors = colors.map { $0.cgColor }
    }
    
}
