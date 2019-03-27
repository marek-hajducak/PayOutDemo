//
//  Filter.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 26/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation

enum Sign: String, CaseIterable {
    case equal = "="
    case less = "<"
    case more = ">"
}

class Filter {
    var typeOfTransaction: TransactionType?
    var incomingTypeOfTransactions: TransactionType.IncomingtransactionTypes?
    var outgoingTypeOfTransactions: TransactionType.OutgoingtransactionTypes?
    var outgoingUnderTypeOfTransaction: TransactionType.OutgoingtransactionTypes.OutgoingUnderTypes?
    var postingDate: String?
    var signForDate: Sign?
    var ammount: Double?
    var signForAmount: Sign?
    var merchant: String?
    var name: String?
    
    init(typeOfTransaction: TransactionType?, incomingType: TransactionType.IncomingtransactionTypes?, outgoingType: TransactionType.OutgoingtransactionTypes?, outgoingUnderType: TransactionType.OutgoingtransactionTypes.OutgoingUnderTypes?, postingDate: String?, ammount: Double?, signForAmount: Sign?, signForDate: Sign?, merchant: String?, name: String?) {
        self.typeOfTransaction = typeOfTransaction
        self.incomingTypeOfTransactions = incomingType
        self.outgoingTypeOfTransactions = outgoingType
        self.outgoingUnderTypeOfTransaction = outgoingUnderType
        self.postingDate = postingDate
        self.ammount = ammount
        self.signForAmount = signForAmount
        self.signForDate = signForDate
        self.merchant = merchant
        self.name = name
    }
}
