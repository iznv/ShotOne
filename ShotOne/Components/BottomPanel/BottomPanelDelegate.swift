//
//  BottomPanelDelegate.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 02/07/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import CoreGraphics

protocol BottomPanelDelegate: class {
    
    func didChange(state: CGFloat, isMaxPosition: Bool)
    
}
