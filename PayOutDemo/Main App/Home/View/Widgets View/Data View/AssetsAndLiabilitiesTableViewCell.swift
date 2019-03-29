//
//  AssetsAndLiabilitiesTableViewCell.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 21/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class AssetsAndLiabilitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var liabilitiesBalanceLabel: UILabel!
    @IBOutlet weak var assetsBalanceLabel: UILabel!
    @IBOutlet weak var differentLabel: UILabel!
    @IBOutlet weak var liabilitiesProgressView: UIProgressView!
    @IBOutlet weak var assetsProgressView: UIProgressView!
    @IBOutlet weak var assetsLabel: UILabel!
    @IBOutlet weak var liabilitiesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        liabilitiesBalanceLabel.font = Font.BasicWidgetTitle
        assetsBalanceLabel.font = Font.BasicWidgetTitle
        assetsLabel.font = Font.BasicWidgetTitle
        liabilitiesLabel.font = Font.BasicWidgetTitle
        differentLabel.font = Font.BasicWidgetDescription
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
