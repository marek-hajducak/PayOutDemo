//
//  ExpandableTableViewCell.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 25/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//
import UIKit

enum CellState {
    case expanded
    case collapsed
}

class ExpandableTableViewCell: UITableViewCell {
    
    var state: CellState = .collapsed {
        didSet {
            toggle()
        }
    }
    
    @IBOutlet private weak var stackView: UIStackView!
    
    private let expandedViewIndex: Int = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func toggle() {
        stackView.arrangedSubviews[expandedViewIndex].isHidden = stateIsCollapsed()
    }
    
    private func stateIsCollapsed() -> Bool {
        return state == .collapsed
    }
}
