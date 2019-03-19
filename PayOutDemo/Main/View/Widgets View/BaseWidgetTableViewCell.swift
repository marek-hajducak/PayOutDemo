//
//  BaseWidgetTableViewCell.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 19/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class BaseWidgetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameOfWidgetLabel: UILabel!
    @IBOutlet weak var downSeparatorView: UIView!
    @IBOutlet weak var iconOfWidgetImageView: UIImageView!
    @IBOutlet weak var backgroundViewOfWidget: UIView!
    @IBOutlet weak var headerOfWidgetView: UIView!
    @IBOutlet weak var leftSeparatorView: UIView!
    @IBOutlet weak var rightSeparatorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameOfWidgetLabel.textColor = Color.MainRed
        // All atributes to one atributes and set on layers
        nameOfWidgetLabel.layer.shadowColor = Color.DarkGrey.cgColor
        nameOfWidgetLabel.layer.shadowRadius = 2.5
        nameOfWidgetLabel.layer.shadowOpacity = 0.6
        nameOfWidgetLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        nameOfWidgetLabel.layer.masksToBounds = false
        
        leftSeparatorView.layer.shadowColor = Color.DarkGrey.cgColor
        leftSeparatorView.layer.shadowRadius = 2.5
        leftSeparatorView.layer.shadowOpacity = 0.6
        leftSeparatorView.layer.shadowOffset = CGSize(width: 1, height: 1)
        leftSeparatorView.layer.masksToBounds = false
        
        rightSeparatorView.layer.shadowColor = Color.DarkGrey.cgColor
        rightSeparatorView.layer.shadowRadius = 2.5
        rightSeparatorView.layer.shadowOpacity = 0.6
        rightSeparatorView.layer.shadowOffset = CGSize(width: 1, height: 1)
        rightSeparatorView.layer.masksToBounds = false

        downSeparatorView.layer.shadowColor = Color.DarkGrey.cgColor
        downSeparatorView.layer.shadowRadius = 2.5
        downSeparatorView.layer.shadowOpacity = 0.6
        downSeparatorView.layer.shadowOffset = CGSize(width: 1, height: 1)
        downSeparatorView.layer.masksToBounds = false
        
        backgroundViewOfWidget.layer.backgroundColor = Color.White.cgColor
        headerOfWidgetView.layer.cornerRadius = 10
        
        backgroundViewOfWidget.layer.cornerRadius = 10
        backgroundViewOfWidget.layer.masksToBounds = false
        backgroundViewOfWidget.layer.shadowColor = Color.DarkGrey.cgColor
        backgroundViewOfWidget.layer.shadowOpacity = 0.4
        backgroundViewOfWidget.layer.shadowOffset = CGSize(width: 8.0, height: 8.0)
        backgroundViewOfWidget.layer.shadowRadius = 6.0
        backgroundViewOfWidget.layer.cornerRadius = 10.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
