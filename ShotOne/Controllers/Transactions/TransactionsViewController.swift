//
//  TransactionsViewController.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 01/04/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import TableKit

class TransactionsViewController: UIViewController {
    
    // MARK: - Constants
    
    enum Constants {
        
        enum Grip {
            
            static let verticalMargin: CGFloat = 15
            
            static let height: CGFloat = 6
            
            fileprivate static let width: CGFloat = 55
            
            fileprivate static let cornerRadius: CGFloat = 5
            
        }
        
        static let headerBottom: CGFloat = 24
        
        fileprivate static let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 32, right: 0)
        
    }
    
    // MARK: - Views
    
    private let gradientView = GradientView()
    
    private let gripView: UIView = {
        let view = UIView()
    
        view.layer.cornerRadius = Constants.Grip.cornerRadius
        
        return view
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.contentInset = Constants.contentInset
        
        return view
    }()
    
    // MARK: - ViewModel
    
    let viewModel: TransactionsViewModel
    
    // MARK: - Properties
    
    private lazy var tableDirector = TableDirector(tableView: tableView)
    
    // MARK: - Init
    
    init(viewModel: TransactionsViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        enableTheme(for: view)

        addViews()
        configureConstraints()
        
        configureTableView()
    }
    
}

// MARK: - Themeable

extension TransactionsViewController: Themeable {
    
    func apply(theme: Theme) {
        gradientView.set(colors: theme.transactionsBackgroundColors)
        gripView.backgroundColor = theme.gripColor
    }
    
}

// MARK: - TableView

private extension TransactionsViewController {
    
    func configureTableView() {
        tableDirector.replace(with: [
            transactionsSection,
            walletsSection
        ])
    }
    
    // MARK: - Sections
    
    var transactionsSection: TableSection {
        return TableSection(onlyRows:
            headerRows +
            transactionRows
        )
    }
    
    var walletsSection: TableSection {
        return TableSection(onlyRows: [
            walletRow
        ])
    }
    
    // MARK: - Rows
    
    var headerRows: [Row] {
        return [
            TableRow<SectionHeaderCell>(item: viewModel.sectionHeaderViewModel),
            EmptyRow(height: Constants.headerBottom)
        ]
    }
    
    var transactionRows: [Row] {
        return viewModel.transactionViewModels.map {
            TableRow<TransactionCell>(item: $0)
        }
    }
    
    var walletRow: Row {
        return TableRow<WalletsCell>(item: viewModel.walletsViewModel)
            .on(.height) { [weak self] _ in
                guard let self = self else { return }
                WalletsCell.defaultHeight = WalletsCell.height(forCellWidht: self.tableView.frame.width)
            }
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
