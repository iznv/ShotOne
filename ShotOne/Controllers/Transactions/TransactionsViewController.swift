//
//  TransactionsViewController.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 01/04/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
    }
    
}

// MARK: - Private

private extension TransactionsViewController {
    
    func configureAppearance() {
        view.backgroundColor = .white
    }
    
}
