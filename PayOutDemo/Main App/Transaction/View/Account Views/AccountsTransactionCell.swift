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
        
        nameOfAccountLabel.font = Font.BasicTransactionAccountTitle
        amountLabel.font = Font.BasicTransactionAmountTitle
        aktualizationDateLabel.font = Font.BasicTransactionActualizationText
        incomeAmountLabel.font = Font.BasicTransactionInOutcomeTitle
        outgoingAmounLabel.font = Font.BasicTransactionInOutcomeTitle
        
        incomeAmountLabel.textColor = Color.IncomingLightGreen
        incomeAmountLabel.dropLabelShadow(color: Color.Grey.cgColor, radius: 2.5, opacity: 0.6, offsetWidth: 2, offsetHeigt: 2, maskToBounds: false)
        outgoingAmounLabel.dropLabelShadow(color: Color.Grey.cgColor, radius: 2.5, opacity: 0.6, offsetWidth: 2, offsetHeigt: 2, maskToBounds: false)
    }
    
    func dropShadow() {
        dropViewShadow(color: Color.DarkGrey.cgColor, radius: 6.0, opacity: 0.6, offsetWidth: 10, offsetHeigt: 10, maskToBounds: false)
        self.layer.cornerRadius = 10
    }

}
