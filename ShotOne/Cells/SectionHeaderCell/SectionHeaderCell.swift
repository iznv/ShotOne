//
//  SectionHeaderCell.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 26/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import TableKit

class SectionHeaderCell: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        
        static let sideMargin: CGFloat = 30
        
    }
    
    // MARK: - Views
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        
        view.font = UIFont.custom(font: CustomFont.quicksand, ofSize: 13, weight: .medium)
        
        return view
    }()
    
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

extension SectionHeaderCell: ConfigurableCell {

    static let defaultHeight: CGFloat? = 34
    
    func configure(with viewModel: SectionHeaderCellViewModel) {
        titleLabel.attributedText = viewModel.title
    }
    
}

// MARK: - Themeable

extension SectionHeaderCell: Themeable {
    
    func apply(theme: Theme) {
        titleLabel.textColor = theme.transactionsHeaderColor
    }
    
}

// MARK: - Views

private extension SectionHeaderCell {
    
    func addViews() {
        contentView.addSubview(titleLabel)
    }
    
}

// MARK: - Constraints

private extension SectionHeaderCell {
    
    func configureConstraints() {
        configureTitleLabelConstraints()
    }
    
    func configureTitleLabelConstraints() {
        titleLabel.activate {[
            $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sideMargin),
            $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.sideMargin),
            $0.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]}
    }
    
}

// MARK: - Private

private extension SectionHeaderCell {
    
    func configureAppearance() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
}
