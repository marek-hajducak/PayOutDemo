//
//  Pension.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 20/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - Account model object
@objcMembers final class Pension: CodableObject {
    
    // MARK: Stored properties
    dynamic var id: Int = 0
    dynamic var savedAmount: String = ""
    dynamic var participiantContribution: String = ""
    dynamic var employerContribution: String = ""
    dynamic var unitsNumber: Int = 0
    dynamic var unitsValue: Double = 0.0
    dynamic var date: String = ""
    
    // MARK: Realm API
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // MARK: Mapping
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case savedAmount = "saved_amount"
        case participiantContribution = "participiant_contribution"
        case employerContribution = "employer_contribution"
        case unitsNumber = "units_number"
        case unitsValue = "units_value"
        case date = "date"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        savedAmount = try container.decodeIfPresent(String.self, forKey: .savedAmount) ?? ""
        participiantContribution = try container.decodeIfPresent(String.self, forKey: .participiantContribution) ?? ""
        employerContribution = try container.decodeIfPresent(String.self, forKey: .employerContribution) ?? ""
        unitsNumber = try container.decodeIfPresent(Int.self, forKey: .unitsNumber) ?? 0
        unitsValue = try container.decodeIfPresent(Double.self, forKey: .unitsValue) ?? 0.0
        date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
        
    }
    
    // MARK: Encodable
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(savedAmount, forKey: .savedAmount)
        try container.encodeIfPresent(participiantContribution, forKey: .participiantContribution)
        try container.encodeIfPresent(employerContribution, forKey: .employerContribution)
        try container.encodeIfPresent(unitsNumber, forKey: .unitsNumber)
        try container.encodeIfPresent(unitsValue, forKey: .unitsValue)
        try container.encodeIfPresent(date, forKey: .date)
        
    }
}
