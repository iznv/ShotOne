//
//  TransactionsViewModel.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 27/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import CoreGraphics

class TransactionsViewModel {
    
    // MARK: - Cells ViewModels
    
    let transactionViewModels = [
        TransactionCellViewModel(category: "Grocery",
                                 place: "Treasure island mall",
                                 price: "$12.00",
                                 pathColor: .groceryIcon,
                                 pathMaker: CGPath.circlePath),
        TransactionCellViewModel(category: "Petrol",
                                 place: "Essar petrol pump",
                                 price: "$09.00",
                                 pathColor: .petrolIcon,
                                 pathMaker: CGPath.trianglePath),
        TransactionCellViewModel(category: "Wardrobe",
                                 place: "Jack and jones",
                                 price: "$63.00",
                                 pathColor: .wardrobeIcon,
                                 pathMaker: CGPath.rectanglePath),
        TransactionCellViewModel(category: "Hardware",
                                 place: "Mitas shop",
                                 price: "$14.00",
                                 pathColor: .hardwareIcon,
                                 pathMaker: CGPath.dropPath)
    ]
    
    let sectionHeaderViewModel = SectionHeaderCellViewModel(title: "Recent transactions")
    
    let walletsViewModel = WalletsCellViewModel(wallets: [])
    
}
