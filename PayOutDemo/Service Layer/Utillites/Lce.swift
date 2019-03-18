//
//  Lce.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 18/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation
import Moya
import RxSwift

// Lce -> Loading / Content / Error
// Idea taken from: https://tech.instacart.com/lce-modeling-data-loading-in-rxjava-b798ac98d80

class Lce<T> {
    var isLoading: Bool
    var data: T?
    var error: ServiceError?
    
    init(loading: Bool = false) {
        self.isLoading = loading
    }
    
    init(data: T) {
        self.isLoading = false
        self.data = data
    }
    
    init(error: ServiceError) {
        self.isLoading = false
        self.error = error
    }
}

