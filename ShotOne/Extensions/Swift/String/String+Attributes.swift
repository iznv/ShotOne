//
//  String+Attributes.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 29/03/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import Foundation

extension String {
    
    var attributed: NSMutableAttributedString {
        return NSMutableAttributedString(string: self)
    }
    
}

extension String {
    
    func with(_ attribute: NSAttributedString.Key,
              value: Any) -> NSMutableAttributedString {
        
        let attributed = self.attributed
        attributed.addAttribute(attribute, value: value, range: attributed.range)
        return attributed
    }
    
    func with(_ attributes: [NSAttributedString.Key: Any]) -> NSMutableAttributedString {
        let attributed = self.attributed
        attributed.addAttributes(attributes, range: attributed.range)
        return attributed
    }
    
}
