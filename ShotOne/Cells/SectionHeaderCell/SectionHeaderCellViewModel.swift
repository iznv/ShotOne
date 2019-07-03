//
//  SectionHeaderCellViewModel.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 26/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

struct SectionHeaderCellViewModel {
    
    // MARK: - Constants
    
    private enum Constants {
        
        static let titleKern: CGFloat = 0.2
        
    }
    
    // MARK: - Properties
    
    let title: NSAttributedString
    
    // MARK: - Init
    
    init(title: String) {
        self.title = title.with(.kern, value: Constants.titleKern)
    }
    
}
