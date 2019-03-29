//
//  UILabel+Extensions.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 29/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

extension UILabel {
    
    @objc func dropLabelShadow(color: CGColor, radius: CGFloat, opacity: Float, offsetWidth: Int, offsetHeigt: Int, maskToBounds: Bool) {
        layer.shadowColor = color
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: offsetWidth, height: offsetHeigt)
        layer.masksToBounds = maskToBounds
    }
    
}
