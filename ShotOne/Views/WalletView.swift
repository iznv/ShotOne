//
//  WalletView.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 29/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

// MARK: - Constants

private enum Constants {
    
    enum Title {

        static let sideMargin: CGFloat = 16
        
        static let bottom: CGFloat = 24.5
        
    }
    
    enum Kern {
        
        static let title = 0.9
        
        static let value = 1.2
        
    }
    
    static let cornerRadius: CGFloat = 22
    
}

class WalletView: BaseView {
    
    // MARK: - Views
    
    private let backgroundImageView: UIImageView = {
        let view = UIImageView()
        
        view.contentMode = .scaleAspectFill
        
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
    
    // MARK: - Properties
    
    var value: String = .empty {
        didSet {
            valueLabel.attributedText = value.with(.kern, value: Constants.Kern.value)
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
        addViews()
        configureConstraints()
        configureAppearance()
    }
    
}

// MARK: - Subviews

private extension WalletView {
    
    func addViews() {
        addSubviews(
            backgroundImageView,
            valueLabel,
            titleLabel
        )
    }
    
}

// MARK: - Constraints

private extension WalletView {
    
    func configureConstraints() {
        configureBackgroundImageViewConstraints()
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
