//
//  SectionHeaderCell.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 26/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import TableKit

// MARK: - Constants

private enum Constants {
    
    static let sideMargin: CGFloat = 30
    
    static let titleKern: CGFloat = 0.2
    
}

class SectionHeaderCell: UITableViewCell {
    
    // MARK: - Views
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        
        view.textColor = #colorLiteral(red: 0.5058823529, green: 0.5294117647, blue: 0.7176470588, alpha: 1)
        view.font = UIFont.custom(font: CustomFont.quicksand, ofSize: 13, weight: .medium)
        
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

extension SectionHeaderCell: ConfigurableCell {

    static let defaultHeight: CGFloat? = 34
    
    func configure(with viewModel: SectionHeaderCellViewModel) {
        titleLabel.attributedText = viewModel.title.with(.kern, value: Constants.titleKern)
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
