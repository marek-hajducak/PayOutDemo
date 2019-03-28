//
//  Double+Extensions.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 27/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
