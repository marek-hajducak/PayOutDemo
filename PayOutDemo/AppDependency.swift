//
//  AppDependency.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 18/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation

struct AppDependency : HasAccountService, HasTransactionService {
    var transactionService: TransactionService
    let accountService: AccountService
}
