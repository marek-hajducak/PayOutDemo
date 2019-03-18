//
//  NSObject+Extensions.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 18/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//
import Foundation

extension NSObject {
    
    /// class name literal
    public class var nameOfClass: String {
        get {
            guard let className = NSStringFromClass(self).components(separatedBy: ".").last else {
                return "N/A"
            }
            return className
        }
    }
}

