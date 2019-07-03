//
//  TransactionsViewModel.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 27/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import CoreGraphics

class TransactionsViewModel {
    
    // MARK: - Constants
    
    private enum Mocks {
        
        static let treasureIslandMall = "Treasure island mall"
        
        static let essarPetrolPump = "Essar petrol pump"
        
        static let jackAndJones = "Jack and jones"
        
        static let mitasShop = "Mitas shop"
        
    }
    
    // MARK: - Cells ViewModels
    
    let transactionViewModels = [
        TransactionCellViewModel(category: Localization.Transactions.Category.grocery,
                                 place: Mocks.treasureIslandMall,
                                 price: 12,
                                 pathColor: .groceryIcon,
                                 pathMaker: CGPath.circlePath),
        TransactionCellViewModel(category: Localization.Transactions.Category.petrol,
                                 place: Mocks.essarPetrolPump,
                                 price: 9,
                                 pathColor: .petrolIcon,
                                 pathMaker: CGPath.trianglePath),
        TransactionCellViewModel(category: Localization.Transactions.Category.wardrobe,
                                 place: Mocks.jackAndJones,
                                 price: 63,
                                 pathColor: .wardrobeIcon,
                                 pathMaker: CGPath.rectanglePath),
        TransactionCellViewModel(category: Localization.Transactions.Category.hardware,
                                 place: Mocks.mitasShop,
                                 price: 14,
                                 pathColor: .hardwareIcon,
                                 pathMaker: CGPath.dropPath)
    ]
    
    let sectionHeaderViewModel = SectionHeaderCellViewModel(title: Localization.Transactions.recent)
    
    let walletsViewModel = WalletsCellViewModel(cryptoWallet: Wallet(title: Localization.Global.crypto, delta: 19.06),
                                                dollarsWallet: Wallet(title: Localization.Global.dollars, delta: -02.24))
    
}
