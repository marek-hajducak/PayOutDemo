//
//  BasicReportView.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 29/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class BasicReportView: UIView {
    
    // Basic Width of Graph
    let widthOfGraphPath: CGFloat = 20
    // Basic X offcet of Graph
    let grafXOffset: CGFloat = 60
    // Basic Y offcet of Graph
    let grafYOffset: CGFloat = 75
    
    // Basic Tracking Layer
    let trackLayer = CAShapeLayer()

    // Basic Animation
    let basicAnimation: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 1.5
        animation.fillMode = CAMediaTimingFillMode.forwards // Path will stay draw
        animation.isRemovedOnCompletion = false
        return animation
    }()
    
    // Basic Legend
    let legendStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.isHidden = true
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 0.0
        return stackView
    }()
    
    // Based Percentage Label in middle of graph
    let percentageLabelOfBasedGraph: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        return label
    }()
    
    // Basic functions to create basic Graph with legent and percentage label
    func createBasicGraph()  {
        percentageLabelOfBasedGraph.isHidden = false
        trackLayer.isHidden = false
        
        let centerPoint = CGPoint(x: center.x - grafXOffset, y: center.y + grafYOffset)
        let circularFoTrackPath = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularFoTrackPath.cgPath
        trackLayer.strokeColor = Color.MainBackground.cgColor
        trackLayer.lineWidth = widthOfGraphPath
        trackLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(trackLayer)
    }
    
    func showBasicPercentageLabel() {
        percentageLabelOfBasedGraph.isHidden = false
        addSubview(percentageLabelOfBasedGraph)
    }
    
    func  showBasicLegend() {
        legendStackView.isHidden = false
        legendStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(legendStackView)
        legendStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        legendStackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10).isActive = true
    }
    
    func addAnimationForBasicGraph() {
        
    }
}