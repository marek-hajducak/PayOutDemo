//
//  GoalsTableViewCell.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 21/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class GoalsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var currentSavingAmounLabel: UILabel!
    @IBOutlet weak var typeOfGoalLabel: UILabel!
    @IBOutlet weak var nameOfGoalLabel: UILabel!
    
    @IBOutlet weak var amountProgresView: UIProgressView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        amountProgresView.progressTintColor = Color.MainColor
        amountProgresView.trackTintColor = Color.LighGrey
        currentSavingAmounLabel.font = Font.BasicWidgetTitle
        nameOfGoalLabel.font = Font.BasicWidgetTitle
        typeOfGoalLabel.font = Font.BasicWidgetDescription
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
