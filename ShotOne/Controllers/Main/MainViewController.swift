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
    
    static let bottomPanelCornerRadius: CGFloat = 40

}

class MainViewController: UIViewController {
    
    // MARK: - Layers
    
    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        
        layer.contentsScale = UIScreen.main.nativeScale
        layer.set(colors: [ #colorLiteral(red: 0.5176470588, green: 0.2470588235, blue: 1, alpha: 1), #colorLiteral(red: 0.2941176471, green: 0.1490196078, blue: 1, alpha: 1) ])
        layer.frame = view.frame
        
        return layer
    }()

    // MARK: - Transactions Panel
    
    private let transactionsViewController = TransactionsViewController(viewModel: TransactionsViewModel())
    
    lazy var transactionsPanel: BottomPanel = {
        let panel = BottomPanel(contentViewController: transactionsViewController,
                                positions: [view.frame.height, 256],
                                scrollView: transactionsViewController.tableView)
        panel.cornerRadius = Constants.bottomPanelCornerRadius
        return panel
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
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
    }
    
}

// MARK: - Private

private extension MainViewController {

    func addBottomSheet() {
        transactionsPanel.embed(in: self)
    }
    
}
