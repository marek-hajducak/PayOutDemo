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
    
    @IBOutlet weak var widgetView: UIView!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var iconOfWidgetImageView: UIImageView!
    @IBOutlet weak var backgroundViewOfWidget: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.size.width = UIScreen.main.bounds.width - 30
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        nameOfWidgetLabel.textColor = Color.MainRed
        // All atributes to one atributes and set on layers
        nameOfWidgetLabel.layer.shadowColor = Color.DarkGrey.cgColor
        nameOfWidgetLabel.layer.shadowRadius = 2.5
        nameOfWidgetLabel.layer.shadowOpacity = 0.6
        nameOfWidgetLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        nameOfWidgetLabel.layer.masksToBounds = false
        
        separatorView.layer.cornerRadius = 10
        
        backgroundViewOfWidget.layer.backgroundColor = Color.White.cgColor
        backgroundViewOfWidget.layer.cornerRadius = 10
        backgroundViewOfWidget.layer.masksToBounds = false
        backgroundViewOfWidget.layer.shadowColor = Color.DarkGrey.cgColor
        backgroundViewOfWidget.layer.shadowOpacity = 0.4
        backgroundViewOfWidget.layer.shadowOffset = CGSize(width: 8.0, height: 8.0)
        backgroundViewOfWidget.layer.shadowRadius = 6.0
        backgroundViewOfWidget.layer.cornerRadius = 10.0
        
        widgetView.layer.cornerRadius = 9
        layer.cornerRadius = 10
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
