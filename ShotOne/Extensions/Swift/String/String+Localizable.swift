//
//  String+Localizable.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 03/07/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: .empty)
    }
    
}
