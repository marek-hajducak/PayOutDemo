//
//  WidgetsViewController.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 21/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class WidgetsViewController: UIViewController {

    @IBOutlet weak var dragAndDropTableView: UITableView! {
        didSet {
            let cellNib = UINib(nibName: BaseWidgetTableViewCell.nameOfClass, bundle: nil)
            dragAndDropTableView.register(cellNib, forCellReuseIdentifier: BaseWidgetTableViewCell.nameOfClass)
            dragAndDropTableView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 20, right: -15)
            
        }
    }
    var account: Account? {
        didSet {
            
        }
    }
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dragAndDropTableView.dragDelegate = self
        dragAndDropTableView.dropDelegate = self
        dragAndDropTableView.delegate = self
        dragAndDropTableView.dataSource = self
        dragAndDropTableView.dragInteractionEnabled = true
        
        guard account != nil else {
            view.isHidden = true
            return
        }
        view.isHidden = false
    }


}

extension WidgetsViewController: UITableViewDragDelegate {
    // MARK: - UITableViewDragDelegate
    
    /**
     The `tableView(_:itemsForBeginning:at:)` method is the essential method
     to implement for allowing dragging from a table.
     */
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return model.dragItems(for: indexPath)
    }
}

extension WidgetsViewController : UITableViewDropDelegate {
    // MARK: - UITableViewDropDelegate
    
    /**
     Ensure that the drop session contains a drag item with a data representation
     that the view can consume.
     */
    func tableView(_ tableView: UITableView, canHandle session: UIDropSession) -> Bool {
        return model.canHandle(session)
    }
    
    /**
     A drop proposal from a table view includes two items: a drop operation,
     typically .move or .copy; and an intent, which declares the action the
     table view will take upon receiving the items. (A drop proposal from a
     custom view does includes only a drop operation, not an intent.)
     */
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        // The .move operation is available only for dragging within a single app.
        if tableView.hasActiveDrag {
            if session.items.count > 1 {
                return UITableViewDropProposal(operation: .cancel)
            } else {
                return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
            }
        } else {
            return UITableViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
        }
    }
    
    /**
     This delegate method is the only opportunity for accessing and loading
     the data representations offered in the drag item. The drop coordinator
     supports accessing the dropped items, updating the table view, and specifying
     optional animations. Local drags with one item go through the existing
     `tableView(_:moveRowAt:to:)` method on the data source.
     */
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        let destinationIndexPath: IndexPath
        
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            // Get last index path of table view.
            let section = tableView.numberOfSections - 1
            let row = tableView.numberOfRows(inSection: section)
            destinationIndexPath = IndexPath(row: row, section: section)
        }
        
        coordinator.session.loadObjects(ofClass: NSString.self) { items in
            // Consume drag items.
            let stringItems = items as! [String]
            
            var indexPaths = [IndexPath]()
            for (index, item) in stringItems.enumerated() {
                let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
                self.model.addItem(item, at: indexPath.row)
                indexPaths.append(indexPath)
            }
            
            tableView.insertRows(at: indexPaths, with: .automatic)
        }
    }
}

extension WidgetsViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.widgetsNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dragAndDropTableView.dequeueReusableCell(withIdentifier:  BaseWidgetTableViewCell.nameOfClass, for: indexPath) as! BaseWidgetTableViewCell
        let nameOfWidget = model.widgetsNames[indexPath.row]
        cell.nameOfWidgetLabel.text = nameOfWidget
        cell.iconOfWidgetImageView.image = model.widgetsImages[nameOfWidget]
        cell.selectionStyle = .none
        let type = TypeOfWidget.init(rawValue: nameOfWidget)
        cell.typeOfWidgetTableViewCell = type
        cell.dataSetForWidget = account
        //FIXME: Set space between cells but not good sollution
        //cell.layer.borderWidth = CGFloat(5)
        //cell.layer.borderColor = tableView.backgroundColor?.cgColor
        if let acc = account {
            let heightOfCell = (type?.getHeightForRow() ?? 0) * CGFloat(type?.getNumberOfRows(account: acc) ?? 0)
            guard heightOfCell != 0 else {
                cell.heightOfWidgetTableViewConstraint.constant = 0
                return cell
            }
            cell.heightOfWidgetTableViewConstraint.constant = heightOfCell
        }
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        model.moveItem(at: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dragAndDropTableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let nameOfWidget = model.widgetsNames[indexPath.row]
        let type = TypeOfWidget.init(rawValue: nameOfWidget)
        if let acc = account {
            let heightOfTableViewInCell = (type?.getHeightForRow() ?? 0) * CGFloat(type?.getNumberOfRows(account: acc) ?? 0)
            let offsetOfTableViewInCell = 29
            guard heightOfTableViewInCell != 0 else {
                return 0
            }
            return (heightOfTableViewInCell + CGFloat(offsetOfTableViewInCell*2))
        } else {
            return 0
        }
        
    }
}

