//
//  TableSection+Init.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 27/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import TableKit

extension TableSection {
    
    convenience init(onlyRows rows: [Row]) {
        self.init(rows: rows)
        
        self.headerView = nil
        self.headerHeight = .leastNonzeroMagnitude
        
        self.footerView = nil
        self.footerHeight = .leastNonzeroMagnitude
    }
    
}
