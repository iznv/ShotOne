//
//  TransactionsViewController.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 01/04/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

// MARK: - Constants

private enum Constants {
    
    enum Grip {
        
        static let verticalMargin: CGFloat = 15
        
        static let height: CGFloat = 6
        
        static let width: CGFloat = 55
        
    }
    
}

class TransactionsViewController: UIViewController {
    
    // MARK: - Views
    
    private let gradientView: GradientView = {
        let view = GradientView()
        view.set(colors: [ #colorLiteral(red: 0.1843137255, green: 0.2235294118, blue: 0.3411764706, alpha: 1), #colorLiteral(red: 0.1137254902, green: 0.1215686275, blue: 0.2431372549, alpha: 1) ])
        return view
    }()
    
    private let gripView: UIView = {
        let view = UIView()
        
        view.backgroundColor = #colorLiteral(red: 0.3137254902, green: 0.1568627451, blue: 1, alpha: 1)
        view.layer.cornerRadius = 5
        
        return view
    }()
    
    let tableView = UITableView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addViews()
        configureConstraints()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
        tableView.dataSource = self
    }
    
}

extension TransactionsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL")!
        cell.textLabel?.text = String(indexPath.row)
        
        return cell
    }
    
}

// MARK: - Subviews

private extension TransactionsViewController {
    
    func addViews() {
        view.addSubviews(
            gradientView,
            gripView,
            tableView
        )
    }
    
}

// MARK: - Constraints

private extension TransactionsViewController {
    
    func configureConstraints() {
        configureGradientViewConstraints()
        configureGripViewConstraints()
        configureTableViewConstraints()
    }
    
    func configureGradientViewConstraints() {
        gradientView.activate {[
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            $0.topAnchor.constraint(equalTo: view.topAnchor),
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]}
    }
    
    func configureGripViewConstraints() {
        gripView.activate {[
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            $0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Grip.verticalMargin),
            $0.heightAnchor.constraint(equalToConstant: Constants.Grip.height),
            $0.widthAnchor.constraint(equalToConstant: Constants.Grip.width)
        ]}
    }
    
    func configureTableViewConstraints() {
        tableView.activate {[
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            $0.topAnchor.constraint(equalTo: gripView.bottomAnchor, constant: Constants.Grip.verticalMargin),
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]}
    }
    
}
