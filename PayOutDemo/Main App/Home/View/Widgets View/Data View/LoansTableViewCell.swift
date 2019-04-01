//
//  LoansTableViewCell.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 21/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class LoansTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfLoanLabel: UILabel!
    @IBOutlet weak var currentAmountLeanLabel: UILabel!
    @IBOutlet weak var loanAmountLabel: UILabel!
    @IBOutlet weak var typeOfLoanLabel: UILabel!
    @IBOutlet weak var loanProgresView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        loanProgresView.progressTintColor = Color.MainColor
        loanProgresView.trackTintColor = Color.LighGrey
        
        nameOfLoanLabel.font = Font.BasicWidgetTitle
        currentAmountLeanLabel.font = Font.BasicWidgetTitle
        loanAmountLabel.font = Font.BasicWidgetDescription
        typeOfLoanLabel.font = Font.BasicWidgetDescription
    }
}
