//
//  Transaction.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 25/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//
import Foundation
import RealmSwift

// MARK: - Account model object
@objcMembers final class Transaction: CodableObject {
    
    // MARK: Stored properties
    dynamic var id: Int = 0
    dynamic var accountId: Int = 0
    dynamic var name: String = ""
    dynamic var amount: Double = 0.0
    dynamic var transDescription: String = ""
    dynamic var merchant: String = ""
    dynamic var postingDate: String = ""
    dynamic var valueDate: String = ""
    // TransactionTypes:
    dynamic var type: Int = 0
    dynamic var incomingType: String?
    dynamic var outgoingType: String?
    dynamic var outgoingUnderType: String?
    
    var transactionTypes: TransactionTypes?
    
    // MARK: Realm API
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // MARK: Mapping
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case accountId = "account_id"
        case name = "name"
        case amount = "ammount"
        case transDescription = "desctiption"
        case merchant = "merchant"
        case postingDate = "posting_date"
        case valueDate = "value_date"
        case type = "type"
        case incomingType = "incoming_type"
        case outgoingType = "outgoing_type"
        case outgoingUnderType = "outgoing_under_type"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        accountId = try container.decodeIfPresent(Int.self, forKey: .accountId) ?? 0
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        amount = try container.decodeIfPresent(Double.self, forKey: .amount) ?? 0.0
        transDescription = try container.decodeIfPresent(String.self, forKey: .transDescription) ?? ""
        merchant = try container.decodeIfPresent(String.self, forKey: .merchant) ?? ""
        postingDate = try container.decodeIfPresent(String.self, forKey: .postingDate) ?? ""
        valueDate = try container.decodeIfPresent(String.self, forKey: .valueDate) ?? ""
        type = try container.decodeIfPresent(Int.self, forKey: .type) ?? 0
        incomingType = try container.decodeIfPresent(String.self, forKey: .incomingType)
        outgoingType = try container.decodeIfPresent(String.self, forKey: .outgoingType)
        outgoingUnderType = try container.decodeIfPresent(String.self, forKey: .outgoingUnderType)
        transactionTypes = TransactionTypes(transactionTypeString: type, incomingTypeString: incomingType, outgoingTypeString: outgoingType, underOutgoingType: outgoingUnderType)
    }
    
    // MARK: Encodable
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(accountId, forKey: .accountId)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(amount, forKey: .amount)
        try container.encodeIfPresent(transDescription, forKey: .transDescription)
        try container.encodeIfPresent(merchant, forKey: .merchant)
        try container.encodeIfPresent(postingDate, forKey: .postingDate)
        try container.encodeIfPresent(valueDate, forKey: .valueDate)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(incomingType, forKey: .incomingType)
        try container.encodeIfPresent(outgoingType, forKey: .outgoingType)
        try container.encodeIfPresent(outgoingUnderType, forKey: .outgoingUnderType)
        
    }
}
