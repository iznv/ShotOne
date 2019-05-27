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

    static let categoryLabelLeading: CGFloat = 79
    
    static let placeLabelTop: CGFloat = 8
    
    static let priceLabelTrailing: CGFloat = -30
    
}

class TransactionCell: UITableViewCell {
    
    // MARK: - Views
    
    private let categoryLabel: UILabel = {
        let view = UILabel()
        
        view.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.custom(font: CustomFont.quicksand, ofSize: 16, weight: .medium)
        
        return view
    }()
    
    private let placeLabel: UILabel = {
        let view = UILabel()
        
        view.textColor = #colorLiteral(red: 0.6823529412, green: 0.7019607843, blue: 0.8392156863, alpha: 1)
        view.font = UIFont.custom(font: CustomFont.quicksand, ofSize: 13, weight: .medium)
        
        return view
    }()
    
    private let priceLabel: UILabel = {
        let view = UILabel()
        
        view.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = UIFont.custom(font: CustomFont.quicksand, ofSize: 16, weight: .medium)
        
        return view
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
    
    static let defaultHeight: CGFloat? = 80
    
    func configure(with viewModel: TransactionCellViewModel) {
        categoryLabel.attributedText = viewModel.category.with(.kern, value: 0.65)
        placeLabel.attributedText = viewModel.place.with(.kern, value: 0.18)
        priceLabel.attributedText = viewModel.price.with(.kern, value: 0.65)
    }
    
}

// MARK: - Views

private extension TransactionCell {
    
    func addViews() {
        contentView.addSubviews(
            categoryLabel,
            placeLabel,
            priceLabel
        )
    }
    
}

// MARK: - Constraints

private extension TransactionCell {
    
    func configureConstraints() {
        configureCategoryLabelConstraints()
        configurePlaceLabelConstraints()
        configurePriceLabelConstraints()
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
