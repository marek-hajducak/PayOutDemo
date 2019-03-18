//
//  ServiceError.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 18/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation

struct StatusCode {
    // codes 100 - 599 are reserved for HTTP status codes
    static let networkError = 900
    static let realmError = 901
    static let fileError = 902
    static let userDefaultsError = 903
    static let validationError = 904
    static let cognitoUnknownError = 950
    static let cognitoUsernameExistsException = 951
    static let cognitoUserNotConfirmedException = 952
    static let cognitoNotAuthorizedException = 953
}

class ServiceError: Error, Codable {
    
    var statusCode: Int = 0
    var message: String = "Unknown error"
    
    public enum CodingKeys: String, CodingKey {
        case message
    }
    
    init(statusCode: Int = 0, message: String = "Unknown error") {
        self.statusCode = statusCode
        if statusCode == 404 {
            self.message = "Mock not found!"
        } else {
            self.message = message
        }
    }
}

