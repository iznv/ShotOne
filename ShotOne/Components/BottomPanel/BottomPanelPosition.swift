//
//  BottomPanelPosition.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 29/04/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import CoreGraphics

enum BottomPanelPosition {
    
    case custom(value: CGFloat)
    
}

// MARK: - Public

extension BottomPanelPosition {
    
    var value: CGFloat {
        switch self {
        case let .custom(value: value):
            return value
        }
    }
    
}

// MARK: - Comparable

extension BottomPanelPosition: Comparable {
    
    static func < (lhs: BottomPanelPosition, rhs: BottomPanelPosition) -> Bool {
        if case let .custom(value: lhsValue) = lhs,
            case let .custom(value: rhsValue) = rhs {
            return lhsValue < rhsValue
        }
        
        return false
    }
    
}
