//
//  Goal.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 20/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - Account model object
@objcMembers final class Goal: CodableObject {
    
    // MARK: Stored properties
    dynamic var id: Int = 0
    dynamic var type: String = ""
    dynamic var created: String = ""
    dynamic var intendedTermination: String = ""
    dynamic var targetAmount: String = ""
    dynamic var currentSaving: String = ""
    dynamic var remains: String = ""
    dynamic var monthly: String = ""
    var products = List<Product>()
    
    // MARK: Realm API
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // MARK: Mapping
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case created = "created"
        case intendedTermination = "intended_termination"
        case targetAmount = "target_amount"
        case currentSaving = "current_saving"
        case remains = "remains"
        case monthly = "monthly"
        case products = "assigned_products"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        created = try container.decodeIfPresent(String.self, forKey: .created) ?? ""
        intendedTermination = try container.decodeIfPresent(String.self, forKey: .intendedTermination) ?? ""
        targetAmount = try container.decodeIfPresent(String.self, forKey: .targetAmount) ?? ""
        currentSaving = try container.decodeIfPresent(String.self, forKey: .currentSaving) ?? ""
        remains = try container.decodeIfPresent(String.self, forKey: .remains) ?? ""
        monthly = try container.decodeIfPresent(String.self, forKey: .monthly) ?? ""
        
        let productsArray = try container.decodeIfPresent([Product].self, forKey: .products) ?? [Product]()
        products.append(objectsIn: productsArray)
        
    }
    
    // MARK: Encodable
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(created, forKey: .created)
        try container.encodeIfPresent(intendedTermination, forKey: .intendedTermination)
        try container.encodeIfPresent(targetAmount, forKey: .targetAmount)
        try container.encodeIfPresent(currentSaving, forKey: .currentSaving)
        try container.encodeIfPresent(remains, forKey: .remains)
        try container.encodeIfPresent(Array(products), forKey: .products)
        
    }
}
