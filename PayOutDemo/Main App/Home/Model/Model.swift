//
//  Model.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 19/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//
/*
 Abstract:
 The model object for the table view.
 */
import Foundation
import UIKit

/// The data model used to populate the table view on app launch.
struct Model {
    private(set) var widgetsNames = [
        "Credit & Debit Cards",
        "Loans",
        "Branches & ATMs",
        "Exchange Rates",
        "Spending Report",
        "Assets & Liabilities",
        "Mutual funds",
        "DDS pension",
        "Goals"
    ]
    
    private(set) var widgetsImages: [String : UIImage] = [
        "Credit & Debit Cards" : Image.CreditCard.imageWithColor(color1: Color.MainRed),
        "Loans": Image.Loan.imageWithColor(color1: Color.MainRed) ,
        "Branches & ATMs" : Image.Atm.imageWithColor(color1: Color.MainRed),
        "Exchange Rates" : Image.ExchangeRate.imageWithColor(color1: Color.MainRed),
        "Spending Report" : Image.SpendingReport.imageWithColor(color1: Color.MainRed),
        "Assets & Liabilities": Image.Asset.imageWithColor(color1: Color.MainRed),
        "Mutual funds" : Image.Fund.imageWithColor(color1: Color.MainRed),
        "DDS pension" : Image.Pension.imageWithColor(color1: Color.MainRed),
        "Goals": Image.Goal.imageWithColor(color1: Color.MainRed)
    ]
    
    /// The traditional method for rearranging rows in a table view.
    mutating func moveItem(at sourceIndex: Int, to destinationIndex: Int) {
        guard sourceIndex != destinationIndex else { return }
        
        let place = widgetsNames[sourceIndex]
        widgetsNames.remove(at: sourceIndex)
        widgetsNames.insert(place, at: destinationIndex)
    }
    
    /// The method for adding a new item to the table view's data model.
    mutating func addItem(_ place: String, at index: Int) {
        widgetsNames.insert(place, at: index)
    }
}
