//
//  String+Localization.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 02/07/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

enum Localization {
    
    enum Global {
        
        static let crypto = "global.crypto".localized
        
        static let dollars = "global.dollars".localized
        
    }
    
    enum Transactions {
        
        enum Category {
            
            static let grocery = "transactions.category.grocery".localized
            
            static let petrol = "transactions.category.petrol".localized
            
            static let wardrobe = "transactions.category.wardrobe".localized
            
            static let hardware = "transactions.category.hardware".localized
            
        }

        static let recent = "transactions.recent".localized
        
    }
 
    enum Main {

        static let balance = "main.balance".localized
        
        static func hey(userName: String) -> String {
            return String(format: "main.hey:username".localized, userName)
        }
        
    }
    
}
