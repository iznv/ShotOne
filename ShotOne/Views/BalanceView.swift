//
//  BalanceView.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 27/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

class BalanceView: BaseView {

    // MARK: - Constants
    
    private enum Constants {
        
        enum Kern {
            
            static let title = 0.53
            
            static let value = 1.3
            
        }
        
        static let titleLeading: CGFloat = 1
        
        static let valueTop: CGFloat = 13
        
    }

    
    // MARK: - Views
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.custom(font: CustomFont.quicksand, ofSize: 13, weight: .regular)
        label.textColor = .white
        
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.custom(font: CustomFont.quicksand, ofSize: 26, weight: .medium)
        label.textColor = .white
        
        return label
    }()
    
    // MARK: - Properties
    
    var title: String = .empty {
        didSet {
            titleLabel.attributedText = title.with(.kern, value: Constants.Kern.title)
        }
    }
    
    var value: String? = .empty {
        didSet {
            valueLabel.attributedText = value?.with(.kern, value: Constants.Kern.value)
        }
    }
    
    // MARK: - Init
    
    override func initialize() {
        addViews()
        configureConstraints()
    }
    
}

// MARK: - Subviews

private extension BalanceView {
    
    func addViews() {
        addSubviews(
            titleLabel,
            valueLabel
        )
    }
    
}

// MARK: - Constraints

private extension BalanceView {
    
    func configureConstraints() {
        configureTitleLabelConstraints()
        configureValueLabelConstraints()
    }
    
    func configureTitleLabelConstraints() {
        titleLabel.activate {[
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.titleLeading),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor),
            $0.topAnchor.constraint(equalTo: topAnchor)
        ]}
    }
    
    func configureValueLabelConstraints() {
        valueLabel.activate {[
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor),
            $0.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.titleLeading),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]}
    }
    
}
