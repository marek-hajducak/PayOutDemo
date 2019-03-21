//
//  Branch.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 21/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - Account model object
@objcMembers final class Branch: CodableObject {
    
    // MARK: Stored properties
    dynamic var id: Int = 0
    dynamic var address: String = ""
    dynamic var distance: Int = 0
    
    // MARK: Realm API
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // MARK: Mapping
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case address = "address"
        case distance = "distance"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        address = try container.decodeIfPresent(String.self, forKey: .address) ?? ""
        distance = try container.decodeIfPresent(Int.self, forKey: .distance) ?? 0
        
    }
    
    // MARK: Encodable
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(address, forKey: .address)
        try container.encodeIfPresent(distance, forKey: .distance)
        
    }
}
