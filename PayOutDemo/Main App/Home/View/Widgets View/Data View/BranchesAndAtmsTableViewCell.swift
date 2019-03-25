//
//  BranchesAndAtmsTableViewCell.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 21/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class BranchesAndAtmsTableViewCell: UITableViewCell {

    @IBOutlet weak var branchImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var branchOrATMSTitleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        branchImageView.image = Image.Atm.imageWithColor(color1: Color.MainRed)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
