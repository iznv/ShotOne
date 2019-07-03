//
//  BaseTableViewCell.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 03/07/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: - To Override
    
    func commonInit() {
        initialize()
    }
    
    func addViews() { }
    
    func configureConstraints() { }
    
    func configureAppearance() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
}

// MARK: - Initialization

extension BaseTableViewCell {
    
    func initialize() {
        addViews()
        configureConstraints()
        configureAppearance()
    }
    
}
