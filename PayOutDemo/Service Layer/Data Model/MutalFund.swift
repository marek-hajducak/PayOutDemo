//
//  Fund.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 20/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - Account model object
@objcMembers final class  MutalFund: CodableObject {
    
    // MARK: Stored properties
    dynamic var id: Int = 0
    dynamic var accountNumber: String = ""
    dynamic var actualBalance: String = ""
    
    var funds = List<Fund>()
    
    // MARK: Realm API
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // MARK: Mapping
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case accountNumber = "account_number"
        case actualBalance = "actual_balance"
        case funds = "funds"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        accountNumber = try container.decodeIfPresent(String.self, forKey: .accountNumber) ?? ""
        actualBalance = try container.decodeIfPresent(String.self, forKey: .actualBalance) ?? ""
        
        let fundsArray = try container.decodeIfPresent([Fund].self, forKey: .funds) ?? [Fund]()
        funds.append(objectsIn: fundsArray)
    }
    
    // MARK: Encodable
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(accountNumber, forKey: .accountNumber)
        try container.encodeIfPresent(actualBalance, forKey: .actualBalance)
        try container.encodeIfPresent(Array(funds), forKey: .funds)
        
    }
}
