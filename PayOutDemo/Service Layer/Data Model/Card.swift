//
//  Card.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 20/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - Account model object
@objcMembers final class Card: CodableObject {
    
    // MARK: Stored properties
    dynamic var id: Int = 0
    dynamic var accountId: Int = 0
    dynamic var cardNumber: String = ""
    dynamic var cardName: String = ""
    dynamic var type: String = ""
    dynamic var validDate: String = ""
    
    
    // Nested
    
    // MARK: Realm API
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // MARK: Mapping
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case accountId = "account_id"
        case cardNumber = "card_number"
        case cardName = "card_name"
        case type = "type"
        case validDate = "valid_date"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        accountId = try container.decodeIfPresent(Int.self, forKey: .accountId) ?? 0
        cardNumber = try container.decodeIfPresent(String.self, forKey: .cardNumber) ?? ""
        cardName = try container.decodeIfPresent(String.self, forKey: .cardName) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        validDate = try container.decodeIfPresent(String.self, forKey: .validDate) ?? ""
        
    }
    
    // MARK: Encodable
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(accountId, forKey: .accountId)
        try container.encodeIfPresent(cardNumber, forKey: .cardNumber)
        try container.encodeIfPresent(cardName, forKey: .cardName)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(validDate, forKey: .validDate)
        
    }
}

