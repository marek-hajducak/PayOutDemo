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
    @IBOutlet weak var leanAmountLabel: UILabel!
    @IBOutlet weak var typeOfLoanLabel: UILabel!
    @IBOutlet weak var loanProgresView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        loanProgresView.progressTintColor = Color.MainRed
        loanProgresView.trackTintColor = Color.LighGrey
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
