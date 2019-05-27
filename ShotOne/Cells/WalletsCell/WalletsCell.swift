//
//  WalletsCell.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 26/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import TableKit

// MARK: - Constants

private enum Constants {
    
    static let sideMargin: CGFloat = 32
    
    static let spacing: CGFloat = 28
    
    static let ratio: CGFloat = 1.72
    
    static let titleKern: CGFloat = 0.6
    
    static let valueKern: CGFloat = 1

}

class WalletsCell: UITableViewCell {
    
    // MARK: - Views
    
    lazy var currencyView1: CurrencyView = {
        let view = CurrencyView()
        view.barColor = #colorLiteral(red: 0.09803921569, green: 0.8235294118, blue: 0.4941176471, alpha: 1)
        return view
    }()
    
    lazy var currencyView2: CurrencyView = {
        let view = CurrencyView()
        view.barColor = #colorLiteral(red: 1, green: 0.2862745098, blue: 0.5058823529, alpha: 1)
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

extension WalletsCell: ConfigurableCell {
    
    static var defaultHeight: CGFloat?
    
    static func height(forCellWidht width: CGFloat) -> CGFloat {
        let currencyViewWidth = (width - Constants.spacing - Constants.sideMargin * 2) / 2
        return currencyViewWidth * Constants.ratio
    }
    
    func configure(with viewModel: WalletsCellViewModel) {
        currencyView1.attributedTitle = "Crypto".with(.kern, value: Constants.titleKern)
        currencyView1.attributedValue = "+19.06".with(.kern, value: Constants.valueKern)
        
        currencyView2.attributedTitle = "Dollars".with(.kern, value: Constants.titleKern)
        currencyView2.attributedValue = "-02.24".with(.kern, value: Constants.valueKern)
    }
    
}

// MARK: - Views

private extension WalletsCell {
    
    func addViews() {
        contentView.addSubviews(
            currencyView1,
            currencyView2
        )
    }
    
}

// MARK: - Constraints

private extension WalletsCell {
    
    func configureConstraints() {
        configureCurrencyView1Constraints()
        configureCurrencyView2Constraints()
    }
    
    func configureCurrencyView1Constraints() {
        currencyView1.activate {[
            $0.topAnchor.constraint(equalTo: contentView.topAnchor),
            currencyView1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).with(priority: .defaultLow),
            $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sideMargin),
            $0.widthAnchor.constraint(equalTo: currencyView2.widthAnchor),
            $0.heightAnchor.constraint(equalTo: $0.widthAnchor, multiplier: Constants.ratio)
        ]}
    }

    func configureCurrencyView2Constraints() {
        currencyView2.activate {[
            $0.topAnchor.constraint(equalTo: currencyView1.topAnchor),
            $0.heightAnchor.constraint(equalTo: currencyView1.heightAnchor),
            $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sideMargin),
            $0.leadingAnchor.constraint(equalTo: currencyView1.trailingAnchor, constant: Constants.spacing)
        ]}
    }
    
}

// MARK: - Private

private extension WalletsCell {
    
    func configureAppearance() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
}
