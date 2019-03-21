//
//  AssetAndLiability.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 21/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - Account model object
@objcMembers final class AssetAndLiability: CodableObject {
    
    // MARK: Stored properties
    dynamic var id: Int = 0
    dynamic var assetsBalance: String = ""
    dynamic var liabilitiesBalance: String = ""
    dynamic var assets = List<Asset>()
    dynamic var liabilities = List<Liability>()
    
    // MARK: Realm API
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // MARK: Mapping
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case assetsBalance = "assets_balance"
        case liabilitiesBalance = "liabilities_balance"
        case assets = "assets"
        case liabilities = "liabilities"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        assetsBalance = try container.decodeIfPresent(String.self, forKey: .assetsBalance) ?? ""
        liabilitiesBalance = try container.decodeIfPresent(String.self, forKey: .liabilitiesBalance) ?? ""
        
        let assetsArray = try container.decodeIfPresent([Asset].self, forKey: .assets) ?? [Asset]()
        assets.append(objectsIn: assetsArray)
        let liabilitiesArray = try container.decodeIfPresent([Liability].self, forKey: .liabilities) ?? [Liability]()
        liabilities.append(objectsIn: liabilitiesArray)
        
    }
    
    // MARK: Encodable
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(assetsBalance, forKey: .assetsBalance)
        try container.encodeIfPresent(liabilitiesBalance, forKey: .liabilitiesBalance)
        try container.encodeIfPresent(Array(assets), forKey: .assets)
        try container.encodeIfPresent(Array(liabilities), forKey: .liabilities)
        
    }
}
