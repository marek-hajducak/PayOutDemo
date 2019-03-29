//
//  ExchangeRatesTableViewCell.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 21/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

enum Currency: String {
    case eur = "EUR"
    case czk = "CZK"
    case gbp = "GBP"
    case usd = "USD"
    
    func getImage() -> UIImage {
        switch self {
        case .eur:
            return Image.SVK
        case .czk:
            return Image.CZE
        case .gbp:
            return Image.GBP
        case .usd:
            return Image.USD
        }
    }
    
    func getCurrencySymbol() -> String {
        switch self {
        case .eur:
            return "€"
        case .czk:
            return "Kč"
        case .gbp:
            return "£"
        case .usd:
            return "$"
        }

    }
}


class ExchangeRatesTableViewCell: UITableViewCell {

    @IBOutlet private weak var stateIconImageView: UIImageView!
    @IBOutlet weak var stateNameLabel: UILabel!
    @IBOutlet private weak var currencyLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    var currency: Currency? {
        didSet {
            if let curr = currency {
                stateIconImageView.image = curr.getImage()
                currencyLabel.text = curr.rawValue
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stateNameLabel.font = Font.BasicWidgetTitle
        currencyLabel.font = Font.BasicWidgetTitle
        rateLabel.font = Font.BasicWidgetDescription
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
