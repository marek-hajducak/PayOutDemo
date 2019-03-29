//
//  TransactionTableViewCell.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 25/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class TransactionTableViewCell: ExpandableTableViewCell {
    
    // collapsed view
    @IBOutlet weak var collapsedView: UIView!
        @IBOutlet weak var transactionTypeImageView: UIImageView!
        @IBOutlet weak var amountLabel: UILabel!
        @IBOutlet weak var nameOfTransactionLabel: UILabel!
        @IBOutlet weak var descriptionOfTransactionLabel: UILabel!
    
    @IBOutlet weak var expandableView: UIView! {
        didSet {
            expandableView.backgroundColor = Color.MainBackground
        }
    }
    @IBOutlet weak var postingDateLabel: UILabel!
    @IBOutlet weak var vealueDateLabel: UILabel!
    @IBOutlet weak var expandedAmountLabel: UILabel!
    @IBOutlet weak var transactionTypeLabel: UILabel!
    @IBOutlet weak var merchantLabel: UILabel!
    
    @IBOutlet var expandedLabels: [UILabel]!
    
    
    @IBOutlet weak var dashedLine: UIView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        drawDottedLine(start: CGPoint(x: dashedLine.bounds.minX, y: dashedLine.bounds.minY), end: CGPoint(x: dashedLine.bounds.maxX, y: dashedLine.bounds.minY), view: dashedLine)
        
        descriptionOfTransactionLabel.font = Font.BasicTransactionDescription
        nameOfTransactionLabel.font = Font.BasicTransactionTitle
        amountLabel.font = Font.BasicTransactionAmount
        
        for label in expandedLabels {
            label.font = Font.BasicTransactionDescription
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func drawDottedLine(start p0: CGPoint, end p1: CGPoint, view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = Color.MainRed.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [7, 3] // 7 is the length of dash, 3 is length of the gap.
        
        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        view.layer.addSublayer(shapeLayer)
    }

}
