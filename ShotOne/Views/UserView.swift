//
//  UserView.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 27/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import Utils

class UserView: BaseView {
    
    // MARK: - Constants
    
    enum Constants {
        
        fileprivate enum Title {
            
            static let kern: CGFloat = 0.5
            
            static let sideMargin: CGFloat = 16
            
        }
        
        static let userPicSize: CGFloat = 42
        
    }
    
    // MARK: - Views
    
    private let userPicImageView: UIImageView = {
        let view = UIImageView()
        
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.custom(font: CustomFont.quicksand, ofSize: 18, weight: .medium)
        label.textColor = .white
        
        return label
    }()
    
    // MARK: - Properties
    
    var image: UIImage? = nil {
        didSet {
            userPicImageView.image = image
        }
    }
    
    var title: String = .empty {
        didSet {
            titleLabel.attributedText = title.with(.kern, value: Constants.Title.kern)
        }
    }
    
    // MARK: - Subviews
    
    override func addViews() {
        addSubviews(
            userPicImageView,
            titleLabel
        )
    }
    
    // MARK: - Constraints
    
    override func configureConstraints() {
        configureUserPicImageViewConstraints()
        configureTitleLabelConstraints()
    }
    
}

// MARK: - Constraints

private extension UserView {
    
    func configureUserPicImageViewConstraints() {
        userPicImageView.activate {[
            $0.topAnchor.constraint(equalTo: topAnchor),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.widthAnchor.constraint(equalToConstant: Constants.userPicSize),
            $0.heightAnchor.constraint(equalToConstant: Constants.userPicSize)
        ]}
    }
    
    func configureTitleLabelConstraints() {
        titleLabel.activate {[
            $0.leadingAnchor.constraint(equalTo: userPicImageView.trailingAnchor, constant: Constants.Title.sideMargin),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Title.sideMargin),
            $0.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]}
    }

}
