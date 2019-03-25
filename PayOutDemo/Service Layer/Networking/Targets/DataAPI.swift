//
//  DataAPI.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 20/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation
import Moya

enum DataAPI {
    case getAccounts()
    case getTransactions()
}

extension DataAPI: TargetType {
    
    var baseURL: URL { return URL(string: "\(NetworkingConstants.baseURL)")! }
    
    var path: String {
        switch self {
        case .getAccounts:
            return "/accounts"
        case .getTransactions:
            return "/transactions"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAccounts, .getTransactions:
            return .get
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var task: Task {
        switch self {
        case .getAccounts, .getTransactions:
            return .requestPlain
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getAccounts, .getTransactions:
            return NetworkingUtilities.stubbedResponse("Transaction")
        }
    }
}

