//
//  TransactionsViewController.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 01/04/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController {
    
    // MARK: - Views
    
    lazy var gradientView: GradientView = {
        let view = GradientView()
        
        view.set(colors: [ #colorLiteral(red: 0.1843137255, green: 0.2235294118, blue: 0.3411764706, alpha: 1), #colorLiteral(red: 0.1137254902, green: 0.1215686275, blue: 0.2431372549, alpha: 1) ])
        
        return view
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addViews()
        configureConstraints()
    }
    
}

// MARK: - Subviews

private extension TransactionsViewController {
    
    func addViews() {
        view.addSubview(gradientView)
    }
    
}

// MARK: - Constraints

private extension TransactionsViewController {
    
    func configureConstraints() {
        gradientView.activate {[
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            $0.topAnchor.constraint(equalTo: view.topAnchor),
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]}
    }
    
}
