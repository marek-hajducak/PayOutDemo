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
        "Credit & Debit Cards" : #imageLiteral(resourceName: "credit_card_red") ,
        "Loans": #imageLiteral(resourceName: "loans_red") ,
        "Branches & ATMs" : #imageLiteral(resourceName: "atm_branches_red"),
        "Exchange Rates" : #imageLiteral(resourceName: "exchange_rate_red"),
        "Spending Report" : #imageLiteral(resourceName: "spending_report_red"),
        "Assets & Liabilities": #imageLiteral(resourceName: "assets_ liabilities_red"),
        "Mutual funds" : #imageLiteral(resourceName: "mutual_funds_red"),
        "DDS pension" : #imageLiteral(resourceName: "dds_pension_red"),
        "Goals": #imageLiteral(resourceName: "goals_red")
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
