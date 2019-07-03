//
//  WalletsCell.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 26/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import TableKit

class WalletsCell: UITableViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        
        static let sideMargin: CGFloat = 32
        
        static let spacing: CGFloat = 28
        
        static let ratio: CGFloat = 1.72
        
    }
    
    // MARK: - Views
    
    lazy var cryptoView: CurrencyView = {
        let view = CurrencyView()
        view.barColor = .cryptoBar
        return view
    }()
    
    lazy var dollarsView: CurrencyView = {
        let view = CurrencyView()
        view.barColor = .dollarsBar
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
        cryptoView.attributedTitle = viewModel.cryptoWalletTitle
        cryptoView.attributedValue = viewModel.cryptoWalletValue
        
        dollarsView.attributedTitle = viewModel.dollarsWalletTitle
        dollarsView.attributedValue = viewModel.dollarsWalletValue
    }
    
}

// MARK: - Views

private extension WalletsCell {
    
    func addViews() {
        contentView.addSubviews(
            cryptoView,
            dollarsView
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
        cryptoView.activate {[
            $0.topAnchor.constraint(equalTo: contentView.topAnchor),
            cryptoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).with(priority: .defaultLow),
            $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sideMargin),
            $0.widthAnchor.constraint(equalTo: dollarsView.widthAnchor),
            $0.heightAnchor.constraint(equalTo: $0.widthAnchor, multiplier: Constants.ratio)
        ]}
    }

    func configureCurrencyView2Constraints() {
        dollarsView.activate {[
            $0.topAnchor.constraint(equalTo: cryptoView.topAnchor),
            $0.heightAnchor.constraint(equalTo: cryptoView.heightAnchor),
            $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sideMargin),
            $0.leadingAnchor.constraint(equalTo: cryptoView.trailingAnchor, constant: Constants.spacing)
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
