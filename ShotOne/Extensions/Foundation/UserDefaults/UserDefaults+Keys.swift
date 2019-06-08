//
//  UserDefaults+Keys.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 02/06/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import Foundation

private enum Keys {

    static let theme = "theme"

}

extension UserDefaults {
    
    var theme: Int {
        get {
            return integer(forKey: Keys.theme)
        }
        set {
            set(newValue, forKey: Keys.theme)
        }
    }

}
