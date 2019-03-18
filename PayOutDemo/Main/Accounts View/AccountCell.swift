//
//  AccountCell.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 18/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class AccountCell: UICollectionViewCell {
    
    // Noncustomize outles
    @IBOutlet weak var backgroundCellView: UIView!
    @IBOutlet weak var balanceLabel: UILabel!
    
    // Customize outlets
    @IBOutlet weak var nameOfAccountLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var nameOfAccountHolderLabel: UILabel!
    @IBOutlet weak var accountIBANLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundCellView.layer.backgroundColor = Color.MainRed.cgColor
        backgroundCellView.layer.cornerRadius = 10
        balanceLabel.textColor = Color.White
        nameOfAccountLabel.textColor = Color.White
        amountLabel.textColor = Color.White
        nameOfAccountHolderLabel.textColor = Color.White
        accountIBANLabel.textColor = Color.White
        accountNumberLabel.textColor = Color.White
        
    }
    
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = Color.DarkGrey.cgColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        self.layer.shadowRadius = 6.0
        self.layer.cornerRadius = 10.0
    }
}
