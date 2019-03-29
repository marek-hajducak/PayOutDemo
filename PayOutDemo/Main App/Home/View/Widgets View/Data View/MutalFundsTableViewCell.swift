//
//  MutalFundsTableViewCell.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 21/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit
import RealmSwift

class MutalFundsTableViewCell: UITableViewCell {

    @IBOutlet weak var actualBalanceLabel: UILabel!
    @IBOutlet weak var accountNamberLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    
    var funds = List<Fund>()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        accountLabel.font = Font.BasicWidgetTitle
        accountNamberLabel.font = Font.BasicWidgetDescription
        actualBalanceLabel.font = Font.BasicWidgetTitle
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
