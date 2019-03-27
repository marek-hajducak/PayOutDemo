//
//  SpendingReportView.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 27/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class SpendingReportView: UIView {
    
    var outgoingTransactionsShapeLayer = CAShapeLayer()
    var incomingTransactionsShapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    
    var degreesOutgoing: Double = 0
    var degreesIncoming: Double = 0
    
    var currency: Currency?
    var incomingTransactions: [Transaction] = []
    var outgoingTransactions: [Transaction] = []
    
    var transactions: [Transaction] = [] {
        didSet {
            self.outgoingTransactions = transactions.filter({$0.type == 2})
            self.incomingTransactions = transactions.filter({$0.type == 1})
            countStats()
            createCircleGraph()
            animateOutgoingTransactions()
            createPercentageLabel()
        }
    }
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outgoingTransactionsShapeLayer.isHidden = true
        incomingTransactionsShapeLayer.isHidden = true
        trackLayer.isHidden = true
        percentageLabel.isHidden = true
    }
    
    func swipeUp() {
        incomingTransactionsShapeLayer.isHidden = true
        outgoingTransactionsShapeLayer.isHidden = true
        trackLayer.isHidden = true
        percentageLabel.isHidden = true
        outgoingTransactionsShapeLayer = CAShapeLayer()
        incomingTransactionsShapeLayer = CAShapeLayer()
    }
    
    private func createPercentageLabel() {
        percentageLabel.isHidden = false
        addSubview(percentageLabel)
        percentageLabel.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        percentageLabel.center = CGPoint(x: center.x - 50 , y: center.y + 75)
    }
    
    private func countStats() {
        var fullamount: Double = 0
        var outgoingAmount: Double = 0
        var incomingAmount: Double = 0
        for transaction in incomingTransactions {
            incomingAmount += transaction.amount
            fullamount += transaction.amount
        }
        for transaction in outgoingTransactions {
            outgoingAmount += transaction.amount
            fullamount += transaction.amount
        }
        if let currency = currency {
            let attributetIncomingString = NSMutableAttributedString(string: "- \(outgoingAmount.rounded(toPlaces: 1)) \(currency.getCurrencySymbol())", attributes: [NSAttributedString.Key.foregroundColor: Color.MainRed,
                                                                                                                                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .bold)])
            let attributeOutgoingString = NSAttributedString(string: "\n+ \(incomingAmount.rounded(toPlaces: 1) )\(currency.getCurrencySymbol())", attributes: [NSAttributedString.Key.foregroundColor : Color.IncomingLightGreen,
                                                                                                                              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .bold)])
            attributetIncomingString.append(attributeOutgoingString)
            percentageLabel.attributedText = attributetIncomingString
            percentageLabel.numberOfLines = 2
        }
        
        
        let percentageOfOugoing = (outgoingAmount/fullamount).rounded(toPlaces: 2)
        let percentageOfIncoming = (incomingAmount/fullamount).rounded(toPlaces: 2)
        degreesOutgoing = percentageOfOugoing * 360
        degreesIncoming = percentageOfIncoming * 360
        
    }

    private func createCircleGraph() {
        incomingTransactionsShapeLayer.isHidden = false
        outgoingTransactionsShapeLayer.isHidden = false
        trackLayer.isHidden = false
        
        let widthOfGraphPath: CGFloat = 20
        
        let centerPoint = CGPoint(x: center.x - 50, y: center.y + 75)
        
        let circularFoTrackPath = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularFoTrackPath.cgPath
        trackLayer.strokeColor = Color.MainBackground.cgColor
        trackLayer.lineWidth = widthOfGraphPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        layer.addSublayer(trackLayer)
        
        let startOfOutgoing = -CGFloat.pi / 2
        let endOfOutgoing = CGFloat(degreesOutgoing) * CGFloat.pi/180 + startOfOutgoing
        let circularPathForOutgoing = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: startOfOutgoing, endAngle: endOfOutgoing, clockwise: true)
        outgoingTransactionsShapeLayer.path = circularPathForOutgoing.cgPath
        outgoingTransactionsShapeLayer.strokeColor = Color.MainRed.cgColor
        outgoingTransactionsShapeLayer.lineWidth = widthOfGraphPath
        outgoingTransactionsShapeLayer.fillColor = UIColor.clear.cgColor
        //outgoingTransactionsShapeLayer.lineCap = CAShapeLayerLineCap.round
        outgoingTransactionsShapeLayer.strokeEnd = 0
        
        let endOfIncoming = CGFloat(degreesIncoming) * CGFloat.pi/180 + endOfOutgoing
        let circularPathForIncoming = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfOutgoing, endAngle: endOfIncoming, clockwise: true)
        incomingTransactionsShapeLayer.path = circularPathForIncoming.cgPath
        incomingTransactionsShapeLayer.strokeColor = Color.IncomingLightGreen.cgColor
        incomingTransactionsShapeLayer.lineWidth = widthOfGraphPath
        incomingTransactionsShapeLayer.fillColor = UIColor.clear.cgColor
        //incomingTransactionsShapeLayer.lineCap = CAShapeLayerLineCap.round
        incomingTransactionsShapeLayer.strokeEnd = 0
        
        layer.addSublayer(outgoingTransactionsShapeLayer)
        layer.addSublayer(incomingTransactionsShapeLayer)
   
        //addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    func animateOutgoingTransactions() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 1.5
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards // Path will stay draw
        basicAnimation.isRemovedOnCompletion = false
        
        outgoingTransactionsShapeLayer.add(basicAnimation, forKey: "outgoingBasic")
        animationIncomingTransactions()
    }
    
    func animationIncomingTransactions() {
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 1.5
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards // Path will stay draw
        basicAnimation.isRemovedOnCompletion = false
        
        incomingTransactionsShapeLayer.add(basicAnimation, forKey: "incomingBasic")
    }
    
    
    
}
