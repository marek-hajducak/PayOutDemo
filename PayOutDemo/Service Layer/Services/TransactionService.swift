//
//  TransactionService.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 25/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import RealmSwift
import RxRealm

protocol HasTransactionService {
    var transactionService: TransactionService { get }
}

class TransactionService: BaseService {
    
    func getTransactions() -> Observable<Lce<[Transaction]>> {
        let endpoint = DataAPI.getTransactions()
        
        return self.provider.request(MultiTarget(endpoint)).asObservable().filterSuccess().map([Transaction].self).flatMap({ (transactions) ->  Observable<Lce<[Transaction]>> in
            return Observable.just(Lce.init(data: transactions))
        }).catchError({
            (error) in error.asServiceError()
        })
    }
    
}
