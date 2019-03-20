//
//  Loan.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 20/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - Account model object
@objcMembers final class Loan: CodableObject {
    
    // MARK: Stored properties
    dynamic var id: Int = 0
    dynamic var number: String = ""
    dynamic var name: String = ""
    dynamic var type: String = ""
    dynamic var amount: String = ""
    dynamic var currentBalance: String = ""
    dynamic var rate: String = ""
    dynamic var amoutOfPayment: String = ""
    dynamic var nextInstalmentDate: String = ""
    dynamic var lastpaymentDate: String = ""
    dynamic var remainingPaymentsNumber: Int = 0
    dynamic var benefit: String = ""
    
    
    // MARK: Realm API
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // MARK: Mapping
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case number = "number"
        case name = "name"
        case type = "type"
        case amount = "amount"
        case currentBalance = "current_balance"
        case rate = "rate"
        case amoutOfPayment = "amount_of_payment"
        case nextInstalmentDate = "next_instalment_date"
        case lastpaymentDate = "last_payment_date"
        case remainingPaymentsNumber = "remaining_payments_number"
        case benefit = "benefit"
        
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        number = try container.decodeIfPresent(String.self, forKey: .number) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        amount = try container.decodeIfPresent(String.self, forKey: .amount) ?? ""
        currentBalance = try container.decodeIfPresent(String.self, forKey: .currentBalance) ?? ""
        rate = try container.decodeIfPresent(String.self, forKey: .rate) ?? ""
        amoutOfPayment = try container.decodeIfPresent(String.self, forKey: .amoutOfPayment) ?? ""
        nextInstalmentDate = try container.decodeIfPresent(String.self, forKey: .nextInstalmentDate) ?? ""
        lastpaymentDate = try container.decodeIfPresent(String.self, forKey: .lastpaymentDate) ?? ""
        remainingPaymentsNumber = try container.decodeIfPresent(Int.self, forKey: .remainingPaymentsNumber) ?? 0
        benefit = try container.decodeIfPresent(String.self, forKey: .benefit) ?? ""
    }
    
    // MARK: Encodable
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(number, forKey: .number)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(amount, forKey: .amount)
        try container.encodeIfPresent(currentBalance, forKey: .currentBalance)
        try container.encodeIfPresent(rate, forKey: .rate)
        try container.encodeIfPresent(amoutOfPayment, forKey: .amoutOfPayment)
        try container.encodeIfPresent(nextInstalmentDate, forKey: .nextInstalmentDate)
        try container.encodeIfPresent(lastpaymentDate, forKey: .lastpaymentDate)
        try container.encodeIfPresent(remainingPaymentsNumber, forKey: .remainingPaymentsNumber)
        try container.encodeIfPresent(benefit, forKey: .benefit)
        
    }
}
