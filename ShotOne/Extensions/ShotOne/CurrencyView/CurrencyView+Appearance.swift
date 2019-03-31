//
//  CurrencyView+Appearance.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 31/03/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

private enum Constants {
    
    static let titleFont: UIFont? = .custom(font: CustomFont.quicksand, ofSize: 12, weight: .bold)
    
    static let valueFont: UIFont? = .custom(font: CustomFont.quicksand, ofSize: 26, weight: .medium)
    
}

extension CurrencyView {
    
    func configure() {
        titleFont = Constants.titleFont
        valueFont = Constants.valueFont
    }
    
}
