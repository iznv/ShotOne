//
//  TransactionCellViewModel.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 26/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

struct TransactionCellViewModel {
    
    let category: String
    
    let place: String
    
    let price: Double
    
    let pathColor: UIColor
    
    let pathMaker: (CGRect) -> CGPath
    
}
