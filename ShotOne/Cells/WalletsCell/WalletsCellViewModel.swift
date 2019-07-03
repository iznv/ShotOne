//
//  WalletsCellViewModel.swift
//  ShotOne
//
//  Created by Ivan Zinovyev on 26/05/2019.
//  Copyright © 2019 Ivan Zinovyev. All rights reserved.
//

import UIKit

struct WalletsCellViewModel {
    
    // MARK: - Constants
    
    private enum Constants {
        
        enum Kern {
            
            static let title: CGFloat = 0.6
            
            static let value: CGFloat = 1
        }
        
    }
    
    // MARK: - Properties
    
    let cryptoWalletTitle: NSAttributedString
    
    let dollarsWalletTitle: NSAttributedString
    
    let cryptoWalletValue: NSAttributedString?
    
    let dollarsWalletValue: NSAttributedString?
    
    // MARK: - Init
    
    init(cryptoWallet: Wallet,
         dollarsWallet: Wallet) {
        
        cryptoWalletTitle = cryptoWallet.title.with(.kern, value: Constants.Kern.title)
        dollarsWalletTitle = dollarsWallet.title.with(.kern, value: Constants.Kern.title)
        
        dollarsWalletValue = Formatter.format(dollarsWallet.delta, using: .delta)?.with(.kern, value: Constants.Kern.value)
        cryptoWalletValue = Formatter.format(cryptoWallet.delta, using: .delta)?.with(.kern, value: Constants.Kern.value)
    }
    
}
