//
//  TransactionCellViewModel.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 26/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

struct TransactionCellViewModel {
    
    // MARK: - Constants
    
    private enum Constants {
        
        enum Kern {
            
            static let priceCategory: CGFloat = 0.65
            
            static let place: CGFloat = 0.18
            
        }
        
    }
    
    // MARK: - Properties
    
    let category: NSAttributedString
    
    let place: NSAttributedString
    
    let price: NSAttributedString?
    
    let pathColor: UIColor
    
    let pathMaker: (CGRect) -> CGPath
    
    // MARK: - Init
    
    init(category: String,
         place: String,
         price: Double,
         pathColor: UIColor,
         pathMaker: @escaping (CGRect) -> CGPath) {
        
        self.pathColor = pathColor
        self.pathMaker = pathMaker
        
        self.category = category.with(.kern, value: Constants.Kern.priceCategory)
        self.place = place.with(.kern, value: Constants.Kern.place)
        self.price = Formatter.format(price, using: .sum)?.with(.kern, value: Constants.Kern.priceCategory)
    }
    
}
