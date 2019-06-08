//
//  TransactionCell.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 26/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import TableKit

// MARK: - Constants

private enum Constants {

    enum PathIconView {
        
        static let leading: CGFloat = 35.5
        
        static let top: CGFloat = 17.5
        
        static let size: CGFloat = 13
        
    }

    static let categoryLabelLeading: CGFloat = 79
    
    static let placeLabelTop: CGFloat = 8
    
    static let priceLabelTrailing: CGFloat = -30
    
}

class TransactionCell: UITableViewCell {
    
    // MARK: - Views
    
    private let categoryLabel: UILabel = {
        let view = UILabel()
        
        view.font = UIFont.custom(font: CustomFont.quicksand, ofSize: 16, weight: .medium)
        
        return view
    }()
    
    private let placeLabel: UILabel = {
        let view = UILabel()

        view.font = UIFont.custom(font: CustomFont.quicksand, ofSize: 13, weight: .medium)
        
        return view
    }()
    
    private let priceLabel: UILabel = {
        let view = UILabel()
        
        view.font = UIFont.custom(font: CustomFont.quicksand, ofSize: 16, weight: .medium)
        
        return view
    }()
    
    private let pathIconView = PathIconView()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        enableTheme(for: self)
        
        addViews()
        configureConstraints()
        configureAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - ConfigureCell

extension TransactionCell: ConfigurableCell {
    
    static let defaultHeight: CGFloat? = 78
    
    func configure(with viewModel: TransactionCellViewModel) {
        categoryLabel.attributedText = viewModel.category.with(.kern, value: 0.65)
        placeLabel.attributedText = viewModel.place.with(.kern, value: 0.18)
        priceLabel.attributedText = viewModel.price.with(.kern, value: 0.65)
        
        configurePathIconView(with: viewModel)
    }
    
    private func configurePathIconView(with viewModel: TransactionCellViewModel) {
        pathIconView.pathMaker = viewModel.pathMaker
        pathIconView.color = viewModel.pathColor
    }
    
}

// MARK: - Themeable

extension TransactionCell: Themeable {
    
    func apply(theme: Theme) {
        categoryLabel.textColor = theme.primaryTextColor
        placeLabel.textColor = theme.secondaryTextColor
        priceLabel.textColor = theme.primaryTextColor
        pathIconView.shouldShowShadow = theme.shouldShowPathIconShadow
    }
    
}

// MARK: - Views

private extension TransactionCell {
    
    func addViews() {
        contentView.addSubviews(
            pathIconView,
            categoryLabel,
            placeLabel,
            priceLabel
        )
    }
    
}

// MARK: - Constraints

private extension TransactionCell {
    
    func configureConstraints() {
        configurePathIconViewConstraints()
        configureCategoryLabelConstraints()
        configurePlaceLabelConstraints()
        configurePriceLabelConstraints()
    }
    
    func configurePathIconViewConstraints() {
        pathIconView.activate {[
            $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.PathIconView.leading),
            $0.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.PathIconView.top),
            $0.heightAnchor.constraint(equalToConstant: Constants.PathIconView.size),
            $0.widthAnchor.constraint(equalToConstant: Constants.PathIconView.size)
        ]}
    }
    
    func configureCategoryLabelConstraints() {
        categoryLabel.activate {[
            $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.categoryLabelLeading),
            $0.topAnchor.constraint(equalTo: contentView.topAnchor)
        ]}
    }

    func configurePlaceLabelConstraints() {
        placeLabel.activate {[
            $0.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor),
            $0.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: Constants.placeLabelTop)
        ]}
    }

    func configurePriceLabelConstraints() {
        priceLabel.activate {[
            $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.priceLabelTrailing),
            $0.firstBaselineAnchor.constraint(equalTo: categoryLabel.firstBaselineAnchor)
        ]}
    }
    
}

// MARK: - Private

private extension TransactionCell {
    
    func configureAppearance() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
}
