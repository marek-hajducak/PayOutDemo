//
//  UIView+Extensions.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 18/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//


import UIKit

extension UIView {
    
    func startActivityIndicator(style: UIActivityIndicatorView.Style = .whiteLarge, color: UIColor = Color.MainColor, backgroundColor: UIColor = UIColor.clear) {
        endEditing(true)
        stopActivityIndicator()
        let activityIndicatorView = ActivityIndicatorView()
        activityIndicatorView.indicator.style = style
        activityIndicatorView.indicator.color = color
        activityIndicatorView.backgroundView.backgroundColor = backgroundColor
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        ConstraintsHelper.setConstraintToCoverView(containerView: self, view: activityIndicatorView)
    }
    
    func stopActivityIndicator() {
        for view in subviews {
            if view.isKind(of: ActivityIndicatorView.self) {
                view.removeFromSuperview()
            }
        }
    }
    
    @objc func dropViewShadow(color: CGColor, radius: CGFloat, opacity: Float, offsetWidth: Int, offsetHeigt: Int, maskToBounds: Bool) {
        layer.shadowColor = color
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: offsetWidth, height: offsetHeigt)
        layer.masksToBounds = maskToBounds
    }
    
}
