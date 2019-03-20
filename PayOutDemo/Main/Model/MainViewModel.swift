//
//  MainViewModel.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 20/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel: ViewModelType {
    
    typealias Dependencies = HasAccountService
    
    fileprivate let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func transform(input: MainViewModel.Input) -> MainViewModel.Output {
        
        let accountEvent = self.dependencies.accountService.getAccounts().startWith(Lce(loading: true)).asDriverOnErrorJustComplete()
        
        return Output(accountsEvent: accountEvent)
    }
}

extension MainViewModel {
    struct Input {
        
    }
    
    struct Output {
        let accountsEvent: Driver<Lce<[Account]>>
    }
}
