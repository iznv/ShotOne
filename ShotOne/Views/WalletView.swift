//
//  WalletView.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 29/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

class WalletView: BaseView {
    
    // MARK: - Constants
    
    private enum Constants {
        
        enum Title {
            
            static let sideMargin: CGFloat = 16
            
            static let bottom: CGFloat = 24.5
            
        }
        
        enum Kern {
            
            static let title = 0.9
            
            static let value = 1.2
            
            static let largeValue = 2.5
            
        }
        
        static let cornerRadius: CGFloat = 22
        
    }
    
    // MARK: - Views
    
    private let backgroundImageView: UIImageView = {
        let view = UIImageView()
        
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = Constants.cornerRadius
        
        return view
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        
        label.font = .custom(font: CustomFont.quicksand, ofSize: 26, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .custom(font: CustomFont.quicksand, ofSize: 14, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private let largeValueLabel: UILabel = {
        let label = UILabel()
        
        label.font = .custom(font: CustomFont.quicksand, ofSize: 88, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: - Properties
    
    var value: String = .empty {
        didSet {
            valueLabel.attributedText = value.with(.kern, value: Constants.Kern.value)
            largeValueLabel.attributedText = value.with(.kern, value: Constants.Kern.largeValue)
        }
    }
    
    var title: String = .empty {
        didSet {
            titleLabel.attributedText = title.with(.kern, value: Constants.Kern.title)
        }
    }
    
    var backgroundImage: UIImage? = nil {
        didSet {
            backgroundImageView.image = backgroundImage
        }
    }
    
    // MARK: - Init
    
    override func initialize() {
        enableTheme(for: self)
        
        addViews()
        configureConstraints()
        configureAppearance()
    }
    
}

// MARK: - Themeable

extension WalletView: Themeable {
    
    func apply(theme: Theme) {
        largeValueLabel.alpha = theme.walletLargeValueAlpha
    }
    
}

// MARK: - Subviews

private extension WalletView {
    
    func addViews() {
        addSubviews(
            backgroundImageView,
            largeValueLabel,
            valueLabel,
            titleLabel
        )
    }
    
}

// MARK: - Constraints

private extension WalletView {
    
    func configureConstraints() {
        configureBackgroundImageViewConstraints()
        configureLargeValueLabelConstraints()
        configureValueLabelConstraints()
        configureTitleLabelConstraints()
    }
    
    func configureBackgroundImageViewConstraints() {
        backgroundImageView.activate {[
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor),
            $0.topAnchor.constraint(equalTo: topAnchor),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]}
    }
    
    func configureLargeValueLabelConstraints() {
        largeValueLabel.activate {[
            $0.centerXAnchor.constraint(equalTo: centerXAnchor),
            $0.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]}
    }
    
    func configureValueLabelConstraints() {
        valueLabel.activate {[
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor),
            $0.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]}
    }
    
    func configureTitleLabelConstraints() {
        titleLabel.activate {[
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Title.sideMargin),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Title.sideMargin),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.Title.bottom)
        ]}
    }
    
}

// MARK: - Private

private extension WalletView {
    
    func configureAppearance() {
        layer.cornerRadius = Constants.cornerRadius
        layer.masksToBounds = true
    }
    
}
