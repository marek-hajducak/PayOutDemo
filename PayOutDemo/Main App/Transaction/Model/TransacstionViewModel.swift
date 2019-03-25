//
//  TransacstionViewModel.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 25/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation

import Foundation
import RxSwift
import RxCocoa

class TransacstionViewModel: ViewModelType {
    
    typealias Dependencies = HasAccountService & HasTransactionService
    
    fileprivate let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func transform(input: TransacstionViewModel.Input) -> TransacstionViewModel.Output {
        
        let accountEvent = self.dependencies.accountService.getAccounts().startWith(Lce(loading: true)).asDriverOnErrorJustComplete()
        
        let transactionEvent = self.dependencies.transactionService.getTransactions().startWith(Lce(loading: true)).asDriverOnErrorJustComplete()
        
        return Output(accountsEvent: accountEvent, transactionEvent: transactionEvent)
    }
}

extension TransacstionViewModel {
    struct Input {
        
    }
    
    struct Output {
        let accountsEvent: Driver<Lce<[Account]>>
        let transactionEvent: Driver<Lce<[Transaction]>>
    }
}
