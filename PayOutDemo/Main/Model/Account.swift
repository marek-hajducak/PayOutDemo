//
//  Account.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 19/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation

class Account {
    
    var id: Int
    var name: String
    var amount: String
    var holder: String
    var IBAN: String
    var number: String
    var savingSystem: Double?
    
    init(id: Int, name: String, amount: String, holder: String, IBAN: String, number: String, savingSystem: Double? = 0.00) {
        self.id = id
        self.name = name
        self.amount = amount
        self.holder = holder
        self.IBAN = IBAN
        self.number = number
        self.savingSystem = savingSystem
    }
    
    
}
