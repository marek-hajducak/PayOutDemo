//
//  ActivityIndicatorView.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 18/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class ActivityIndicatorView: XIBView {
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override var nibName: String {
        return ActivityIndicatorView.nameOfClass
    }
    
}
