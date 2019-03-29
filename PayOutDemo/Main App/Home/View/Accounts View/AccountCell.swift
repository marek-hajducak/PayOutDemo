//
//  AccountCell.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 18/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class AccountCell: UICollectionViewCell {
    @IBOutlet weak var centerYOfAmountInViewConstraint: NSLayoutConstraint!
    
    // Noncustomize outles
    @IBOutlet weak var backgroundCellView: UIView!
    
    // Customize outlets
    @IBOutlet weak var nameOfAccountLabel: UILabel! {
        didSet{
            nameOfAccountLabel.text = nameOfAccountLabel.text?.uppercased()
        }
    }
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var nameOfAccountHolderLabel: UILabel!
    @IBOutlet weak var accountIBANLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundCellView.layer.backgroundColor = Color.MainRed.cgColor
        backgroundCellView.layer.cornerRadius = 10
        nameOfAccountLabel.textColor = Color.White
        amountLabel.textColor = Color.White
        nameOfAccountHolderLabel.textColor = Color.White
        accountIBANLabel.textColor = Color.White
        accountNumberLabel.textColor = Color.White
        
        if UIScreen.main.bounds.width == 320 { // SE, 4 , 4s
            centerYOfAmountInViewConstraint.constant = -10
        } else if UIScreen.main.bounds.width == 375  { // 6,  6S, 7, 8, X, Xs
            centerYOfAmountInViewConstraint.constant = -15
        } else if UIScreen.main.bounds.width == 414  { // 7 plus, 8 Plus, Xr, Xs Max
            centerYOfAmountInViewConstraint.constant = -25
        } else {
            centerYOfAmountInViewConstraint.constant = 0
        }
    }
    
    func dropShadow() {
        dropViewShadow(color: Color.DarkGrey.cgColor, radius: 6.0, opacity: 0.6, offsetWidth: 10, offsetHeigt: 10, maskToBounds: false)
    }
    
    
}
