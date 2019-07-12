//
//  WalletsCell.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 26/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import TableKit
import Utils

class WalletsCell: BaseTableViewCell {
    
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
    
    // MARK: - Views
    
    override func addViews() {
        contentView.addSubviews(
            cryptoView,
            dollarsView
        )
    }
    
    // MARK: - Constraints
    
    override func configureConstraints() {
        configureCurrencyView1Constraints()
        configureCurrencyView2Constraints()
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

// MARK: - Constraints

private extension WalletsCell {
    
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
