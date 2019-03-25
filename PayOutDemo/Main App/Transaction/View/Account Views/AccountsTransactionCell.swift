//
//  AccountsTransactionCell.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 25/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class AccountsTransactionCell: UICollectionViewCell {

    @IBOutlet weak var backgroundOfCelllView: UIView!
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var nameOfAccountLabel: UILabel!
    @IBOutlet weak var aktualizationDateLabel: UILabel!
    @IBOutlet weak var incomeAmountLabel: UILabel!
    @IBOutlet weak var outgoingAmounLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dropShadow()
        layer.cornerRadius = 10
        backgroundOfCelllView.layer.cornerRadius = 10
        amountLabel.textColor = Color.White
        amountLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        aktualizationDateLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        
        incomeAmountLabel.textColor = Color.IncomingLightGreen
        incomeAmountLabel.layer.shadowColor = Color.Grey.cgColor
        incomeAmountLabel.layer.shadowRadius = 2.5
        incomeAmountLabel.layer.shadowOpacity = 0.6
        incomeAmountLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        incomeAmountLabel.layer.masksToBounds = false
        
        outgoingAmounLabel.textColor = Color.OutcomingLightRed
        outgoingAmounLabel.layer.shadowColor = Color.Grey.cgColor
        outgoingAmounLabel.layer.shadowRadius = 2.5
        outgoingAmounLabel.layer.shadowOpacity = 0.6
        outgoingAmounLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        outgoingAmounLabel.layer.masksToBounds = false
    }
    
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = Color.DarkGrey.cgColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        self.layer.shadowRadius = 6.0
        self.layer.cornerRadius = 10
    }

}
