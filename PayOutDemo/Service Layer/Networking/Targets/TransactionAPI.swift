//
//  TransactionAPI.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 28/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation
import Moya

enum TransactionAPI {
    case getTransactions
}

extension TransactionAPI: TargetType {
    
    var baseURL: URL { return URL(string: "\(NetworkingConstants.transactionsBaseURL)")! }
    
    var path: String {
        switch self {
        case .getTransactions:
            return "/transactions"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTransactions:
            return .get
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var task: Task {
        switch self {
        case .getTransactions:
            return .requestPlain
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getTransactions:
            return NetworkingUtilities.stubbedResponse("Transaction")
        }
    }
}
