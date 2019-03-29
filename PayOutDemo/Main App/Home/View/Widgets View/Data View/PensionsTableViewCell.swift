//
//  PensionsTableViewCell.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 21/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class PensionsTableViewCell: UITableViewCell {

    @IBOutlet weak var savedAmountLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var pension: Pension?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        savedAmountLabel.font = Font.BasicWidgetTitle
        titleLabel.font = Font.BasicWidgetTitle
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
