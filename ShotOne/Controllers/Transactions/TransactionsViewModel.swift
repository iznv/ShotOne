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
        TransactionCellViewModel(category: "Grocery", place: "Treasure island mall", price: "$12.00", pathColor: #colorLiteral(red: 0.3568627451, green: 0.831372549, blue: 1, alpha: 1), pathMaker: CGPath.circlePath),
        TransactionCellViewModel(category: "Petrol", place: "Essar petrol pump", price: "$09.00", pathColor: #colorLiteral(red: 0.9647058824, green: 0.7647058824, blue: 0.2784313725, alpha: 1), pathMaker: CGPath.trianglePath),
        TransactionCellViewModel(category: "Wardrobe", place: "Jack and jones", price: "$63.00", pathColor: #colorLiteral(red: 0.5529411765, green: 0.3764705882, blue: 1, alpha: 1), pathMaker: CGPath.rectanglePath),
        TransactionCellViewModel(category: "Hardware", place: "Mitas shop", price: "$14.00", pathColor: #colorLiteral(red: 0.9490196078, green: 0.3725490196, blue: 0.8431372549, alpha: 1), pathMaker: CGPath.dropPath)
    ]
    
    let sectionHeaderViewModel = SectionHeaderCellViewModel(title: "Recent transactions")
    
    let walletsViewModel = WalletsCellViewModel(wallets: [])
    
}
