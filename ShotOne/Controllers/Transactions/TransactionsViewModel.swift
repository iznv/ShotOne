//
//  TransactionsViewModel.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 27/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

class TransactionsViewModel {
    
    // MARK: - Cells ViewModels
    
    let transactionViewModels = [
        TransactionCellViewModel(category: "Grocery", place: "Treasure island mall", price: "$12.00"),
        TransactionCellViewModel(category: "Petrol", place: "Essar petrol pump", price: "$09.00"),
        TransactionCellViewModel(category: "Wardrobe", place: "Jack and jones", price: "$63.00"),
        TransactionCellViewModel(category: "Hardware", place: "Mitas shop", price: "$14.00")
    ]
    
    let sectionHeaderViewModel = SectionHeaderCellViewModel(title: "Recent transactions")
    
    let walletsViewModel = WalletsCellViewModel(wallets: [])
    
}
