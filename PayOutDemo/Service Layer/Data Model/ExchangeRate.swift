//
//  ExchangeRate.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 20/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - Account model object
@objcMembers final class ExchangeRate: CodableObject {
    
    // MARK: Stored properties
    dynamic var id: Int = 0
    dynamic var currency: String = ""
    dynamic var sellAmount: String = ""
    dynamic var buyAmount: String = ""
    dynamic var country: String = ""
    
    // MARK: Realm API
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // MARK: Mapping
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case currency = "currency"
        case sellAmount = "sell"
        case buyAmount = "buy"
        case country = "country"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        currency = try container.decodeIfPresent(String.self, forKey: .currency) ?? ""
        sellAmount = try container.decodeIfPresent(String.self, forKey: .sellAmount) ?? ""
        buyAmount = try container.decodeIfPresent(String.self, forKey: .buyAmount) ?? ""
        country = try container.decodeIfPresent(String.self, forKey: .country) ?? ""
    }
    
    // MARK: Encodable
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(currency, forKey: .currency)
        try container.encodeIfPresent(sellAmount, forKey: .sellAmount)
        try container.encodeIfPresent(buyAmount, forKey: .buyAmount)
        try container.encodeIfPresent(country, forKey: .country)
        
    }
}
