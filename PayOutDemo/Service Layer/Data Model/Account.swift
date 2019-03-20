//
//  Account.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 20/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - Account model object
@objcMembers final class Account: CodableObject {
    
    // MARK: Stored properties
    dynamic var id: Int = 0
    dynamic var holder: String = ""
    dynamic var accountNumber: String = ""
    dynamic var IBAN: String = ""
    dynamic var banknName: String = ""
    dynamic var avalibleBalance: String = ""
    dynamic var currentBalance: String = ""
    dynamic var blockedAmount: String = ""
    dynamic var SWIFT: String = ""
    dynamic var currency: String = ""
    dynamic var createDate: String = ""
    dynamic var active: Bool = true
    
    // MARK: Realm API
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // MARK: Mapping
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case banknName = "bank_name"
        case avalibleBalance = "available_balance"
        case holder = "holder"
        case IBAN = "IBAN"
        case accountNumber = "account_number"
        case currentBalance = "current_balance"
        case blockedAmount = "blocked_amount"
        case SWIFT = "BIC_SWIFT"
        case currency = "currency"
        case createDate = "create_date"
        case active = "active"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        banknName = try container.decodeIfPresent(String.self, forKey: .banknName) ?? ""
        holder = try container.decodeIfPresent(String.self, forKey: .holder) ?? ""
        IBAN = try container.decodeIfPresent(String.self, forKey: .IBAN) ?? ""
        accountNumber = try container.decodeIfPresent(String.self, forKey: .accountNumber) ?? ""
        avalibleBalance = try container.decodeIfPresent(String.self, forKey: .avalibleBalance) ?? ""
        currentBalance = try container.decodeIfPresent(String.self, forKey: .currentBalance) ?? ""
        blockedAmount = try container.decodeIfPresent(String.self, forKey: .blockedAmount) ?? ""
        SWIFT = try container.decodeIfPresent(String.self, forKey: .SWIFT) ?? ""
        currency = try container.decodeIfPresent(String.self, forKey: .currency) ?? ""
        createDate = try container.decodeIfPresent(String.self, forKey: .createDate) ?? ""
        active = try container.decodeIfPresent(Bool.self, forKey: .active) ?? true
    }
    
    // MARK: Encodable
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(banknName, forKey: .banknName)
        try container.encodeIfPresent(holder, forKey: .holder)
        try container.encodeIfPresent(IBAN, forKey: .IBAN)
        try container.encodeIfPresent(accountNumber, forKey: .accountNumber)
        try container.encodeIfPresent(avalibleBalance, forKey: .avalibleBalance)
        try container.encodeIfPresent(currentBalance, forKey: .currentBalance)
        try container.encodeIfPresent(blockedAmount, forKey: .blockedAmount)
        try container.encodeIfPresent(SWIFT, forKey: .SWIFT)
        try container.encodeIfPresent(currency, forKey: .currency)
        try container.encodeIfPresent(createDate, forKey: .createDate)
        try container.encodeIfPresent(active, forKey: .active)
    }
}

