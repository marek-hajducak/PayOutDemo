//
//  CreditCardsTableViewCell.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 21/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class CreditCardsTableViewCell: UITableViewCell {

    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var creditTypeLabel: UILabel!
    @IBOutlet weak var validDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardNameLabel.font = Font.BasicWidgetTitle
        cardNumberLabel.font = Font.BasicWidgetTitle
        creditTypeLabel.font = Font.BasicWidgetDescription
        validDateLabel.font = Font.BasicWidgetDescription
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
