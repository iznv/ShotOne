//
//  MainViewController.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 25/03/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

private enum Constants {
    
    struct CurrencyView {
        
        static let size = CGSize(width: 143, height: 244)
        
    }
    
    struct Title {
        
        static let attributes: [NSAttributedString.Key: Any] = [.kern: 0.6]
        
    }
    
    struct Value {
        
        static let attributes: [NSAttributedString.Key: Any] = [.kern: 1]
        
    }

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

    // MARK: - Views

    lazy var currencyView1: CurrencyView = {
        let view = CurrencyView()
        
        view.barColor = #colorLiteral(red: 0.09803921569, green: 0.8235294118, blue: 0.4941176471, alpha: 1)
        view.frame.size = Constants.CurrencyView.size
        view.frame.origin = CGPoint(x: 32, y: self.view.frame.height - 289)
        
        return view
    }()
    
    lazy var currencyView2: CurrencyView = {
        let view = CurrencyView()
        
        view.barColor = #colorLiteral(red: 1, green: 0.2862745098, blue: 0.5058823529, alpha: 1)
        view.frame.size = Constants.CurrencyView.size
        view.frame.origin = CGPoint(x: currencyView1.frame.maxX + 28, y: self.view.frame.height - 289)
        
        return view
    }()
    
    // MARK: - Transactions Panel
    
    lazy var transactionsPanel = BottomPanel(contentViewController: TransactionsViewController(),
                                             positions: [100, 250, view.frame.height])
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        configure()
        addBottomSheet()
    }
    
    func addBottomSheet() {
        transactionsPanel.embed(in: self)
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
            currencyView1,
            currencyView2
        )
    }
    
}

// MARK: - Configure

private extension MainViewController {
    
    func configure() {
        currencyView1.attributedTitle = "Crypto".with(Constants.Title.attributes)
        currencyView1.attributedValue = "+19.06".with(Constants.Value.attributes)
        
        currencyView2.attributedTitle = "Dollars".with(Constants.Title.attributes)
        currencyView2.attributedValue = "-02.24".with(Constants.Value.attributes)
    }
    
}
