//
//  AccountService.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 20/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import RealmSwift
import RxRealm

protocol HasAccountService {
    var accountService: AccountService { get }
}

class AccountService: BaseService {
    
    func getAccounts() -> Observable<Lce<[Account]>> {
        let endpoint = DataAPI.getAccounts()
        
        return self.provider.request(MultiTarget(endpoint)).asObservable().filterSuccess().map([Account].self).flatMap({ (transactions) ->  Observable<Lce<[Account]>> in
            return Observable.just(Lce.init(data: transactions))
        }).catchError({
            (error) in error.asServiceError()
        })
    }
    
}
