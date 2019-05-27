//
//  EmptyCell.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 27/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import TableKit

class EmptyCell: UITableViewCell {
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - ConfigurableCell

extension EmptyCell: ConfigurableCell {
    
    func configure(with _: Void) { }
    
}
