//
//  UserDefaults+Keys.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 02/06/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    // MARK: - Keys
    
    enum Keys {
        
        static let themeId = "themeId"
        
    }

}

// MARK: - Values

extension UserDefaults {

    var themeId: String? {
        get {
            return string(forKey: Keys.themeId)
        }
        set {
            set(newValue, forKey: Keys.themeId)
        }
    }
    
}
