//
//  NSMutableAttributedString+Attributes.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 29/03/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    
    var range: NSRange {
        return mutableString.range(of: string)
    }
    
    func with(_ attribute: NSAttributedString.Key,
              value: Any) -> NSMutableAttributedString {
        
        addAttribute(attribute, value: value, range: range)
        return self
    }
    
    func with(_ attributes: [NSAttributedString.Key: Any]) -> NSMutableAttributedString {
        addAttributes(attributes, range: range)
        return self
    }
    
}
