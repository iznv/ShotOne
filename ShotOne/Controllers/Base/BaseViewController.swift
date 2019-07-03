//
//  BaseViewController.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 04/07/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

class BaseViewController<ViewModelType>: UIViewController {
    
    let viewModel: ViewModelType
    
    // MARK: - Init
    
    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    // MARK: - To Override
    
    func addViews() { }
    
    func configureConstraints() { }
    
    func configureAppearance() {
        view.backgroundColor = .white
    }
    
}

// MARK: - Initialization

extension BaseViewController {
    
    func initialize() {
        addViews()
        configureConstraints()
        configureAppearance()
    }
    
}
