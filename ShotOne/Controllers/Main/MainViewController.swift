//
//  MainViewController.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 25/03/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

// MARK: - Constants

private enum Constants {
    
    enum UserView {

        static let top: CGFloat = 71
        
    }

    static let bottomPanelCornerRadius: CGFloat = 40
    
    static let minSpacing: CGFloat = 40
    
    static let balanceViewHeight: CGFloat = 60

    static let sideMargin: CGFloat = 30
    
    static let walletsSpacing: CGFloat = 26
    
    static let walletRatio: CGFloat = 1.3
    
    static let verticalSpacingsCount: CGFloat = 3

}

class MainViewController: UIViewController {
    
    // MARK: - Layers
    
    private lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        
        layer.contentsScale = UIScreen.main.nativeScale
        layer.set(colors: [ #colorLiteral(red: 0.5176470588, green: 0.2470588235, blue: 1, alpha: 1), #colorLiteral(red: 0.2941176471, green: 0.1490196078, blue: 1, alpha: 1) ])
        layer.frame = view.frame
        
        return layer
    }()
    
    private let userView: UserView = {
        let view = UserView()
        
        view.title = "Hey, Veronica"
        
        return view
    }()
    
    private let balanceView: BalanceView = {
        let view = BalanceView()
        
        view.title = "Your total balance is"
        view.value = "$162.00"
        
        return view
    }()
    
    private let walletsContainerView = UIView()
    
    private let cryptoWalletView: WalletView = {
        let view = WalletView()
        
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.5725490196, blue: 0.6352941176, alpha: 1)
        view.value = "$22.00"
        view.title = "Crypto"
        
        return view
    }()
    
    private let dallarsWalletView: WalletView = {
        let view = WalletView()
        
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.5725490196, blue: 0.6352941176, alpha: 1)
        view.value = "$135.00"
        view.title = "Dollars"
        
        return view
    }()

    // MARK: - Transactions Panel
    
    private let transactionsViewController = TransactionsViewController(viewModel: TransactionsViewModel())
    
    lazy var transactionsPanel: BottomPanel = {
        let panel = BottomPanel(contentViewController: transactionsViewController,
                                positions: [view.frame.height, transactionsPanelHeight],
                                scrollView: transactionsViewController.tableView)
        panel.cornerRadius = Constants.bottomPanelCornerRadius
        return panel
    }()
    
    // MARK: - Properties
    
    private let gripHeight = TransactionsViewController.Constants.Grip.height
        + 2 * TransactionsViewController.Constants.Grip.verticalMargin
    
    private let sectionHeaderHeight = (SectionHeaderCell.defaultHeight ?? 0)
        + TransactionsViewController.Constants.headerBottom
    
    private let userViewMaxY = Constants.UserView.top + UserView.Constants.userPicSize

    private lazy var transactionsHeaderHeight = gripHeight + sectionHeaderHeight
    
    private lazy var walletWidth = (view.frame.width - 2 * Constants.sideMargin - Constants.walletsSpacing) / 2
    
    private lazy var walletHeight = walletWidth * Constants.walletRatio
    
    private lazy var contentHeight = userViewMaxY + Constants.balanceViewHeight + walletHeight
    
    private lazy var mainContentMinHeight = contentHeight + Constants.verticalSpacingsCount * Constants.minSpacing
    
    private lazy var totalSpacingsHeight = view.frame.height - transactionsPanelHeight - contentHeight
    
    private lazy var spacing = totalSpacingsHeight / Constants.verticalSpacingsCount
    
    private lazy var transactionsPanelHeight: CGFloat = {
        let transactionCellHeight = TransactionCell.defaultHeight ?? 0
        
        let maxPanelHeight = view.frame.height - mainContentMinHeight
        let transactionsCellsHeight = maxPanelHeight - transactionsHeaderHeight
        let cells = Int(transactionsCellsHeight / transactionCellHeight)
        
        return transactionsHeaderHeight + CGFloat(cells) * transactionCellHeight
    }()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        configureConstraints()
        
        addBottomSheet()
    }
    
    // MARK: - Overrides
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

// MARK: - Subviews

private extension MainViewController {
    
    func addViews() {
        view.layer.addSublayer(gradientLayer)
        
        view.addSubviews(
            userView,
            balanceView,
            walletsContainerView,
            cryptoWalletView,
            dallarsWalletView
        )
    }
    
}

// MARK: - Constraints

private extension MainViewController {
    
    func configureConstraints() {
        configureUserViewConstraints()
        configureBalanceViewConstraints()
        configureWalletsContainerViewConstraints()
        configureCryptoWalletViewConstraints()
        configureDollarsWalletViewConstraints()
    }
    
    func configureUserViewConstraints() {
        userView.activate {[
            $0.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.UserView.top),
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.sideMargin),
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.sideMargin)
        ]}
    }
    
    func configureBalanceViewConstraints() {
        balanceView.activate {[
            $0.topAnchor.constraint(equalTo: userView.bottomAnchor, constant: spacing - 10),
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.sideMargin),
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.sideMargin)
        ]}
    }
    
    func configureWalletsContainerViewConstraints() {
        walletsContainerView.activate {[
            $0.topAnchor.constraint(equalTo: balanceView.bottomAnchor, constant: spacing - 5),
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(spacing + transactionsPanelHeight) - 2),
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.sideMargin),
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.sideMargin),
            $0.heightAnchor.constraint(equalToConstant: walletHeight)
        ]}
    }
    
    func configureCryptoWalletViewConstraints() {
        cryptoWalletView.activate {[
            $0.topAnchor.constraint(equalTo: walletsContainerView.topAnchor),
            $0.bottomAnchor.constraint(equalTo: walletsContainerView.bottomAnchor),
            $0.leadingAnchor.constraint(equalTo: walletsContainerView.leadingAnchor)
        ]}
    }
    
    func configureDollarsWalletViewConstraints() {
        dallarsWalletView.activate {[
            $0.topAnchor.constraint(equalTo: walletsContainerView.topAnchor),
            $0.bottomAnchor.constraint(equalTo: walletsContainerView.bottomAnchor),
            $0.widthAnchor.constraint(equalTo: cryptoWalletView.widthAnchor),
            $0.leadingAnchor.constraint(equalTo: cryptoWalletView.trailingAnchor, constant: Constants.walletsSpacing),
            $0.trailingAnchor.constraint(equalTo: walletsContainerView.trailingAnchor)
        ]}
    }
    
}

// MARK: - Private

private extension MainViewController {

    func addBottomSheet() {
        transactionsPanel.embed(in: self)
    }
    
}
