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
}

extension DataAPI: TargetType {
    
    var baseURL: URL { return URL(string: "\(NetworkingConstants.baseURL)")! }
    
    var path: String {
        switch self {
        case .getAccounts:
            return "/accounts"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAccounts:
            return .get
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var task: Task {
        switch self {
        case .getAccounts:
            return .requestPlain
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getAccounts:
            return NetworkingUtilities.stubbedResponse("Transaction")
        }
    }
}

