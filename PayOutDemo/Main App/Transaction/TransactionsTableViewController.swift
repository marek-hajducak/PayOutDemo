//
//  TransactionsTableViewController.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 22/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class TransactionsTableViewController: UIViewController {

    @IBOutlet weak var transactionsTableView: UITableView! {
        didSet {
        }
    }
    @IBOutlet weak var separatorUnderStatisticViewView: UIView!
    @IBOutlet weak var heightOfStatisticViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightOfSeparatorConstrain: NSLayoutConstraint!
    @IBOutlet weak var statisticButton: UIButton! {
        didSet{
            statisticButton.addTarget(self, action: #selector(swipeDown), for: .touchUpInside)
            statisticButton.isHidden = true
            statisticButton.isEnabled = false
            self.statisticButton.backgroundColor = Color.MainRed
            self.statisticButton.layer.cornerRadius = 15
            let imageForButton = Image.ArrowDown
            self.statisticButton.setImage(imageForButton, for: .highlighted)
            self.statisticButton.setImage(imageForButton, for: .normal)
            self.statisticButton.imageView?.bounds.size.width = 14
            self.statisticButton.imageView?.bounds.size.height = 14
            statisticButton.imageView?.contentMode = .scaleAspectFit
            statisticButton.titleLabel?.textColor = Color.White
            //Shadows
            statisticButton.layer.masksToBounds = false
            statisticButton.layer.shadowColor = Color.DarkGrey.cgColor
            statisticButton.layer.shadowOpacity = 0.6
            statisticButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            statisticButton.layer.shadowRadius = 3.0
            statisticButton.layer.cornerRadius = 15.0
        }
    }

    @IBOutlet weak var statisticView: UIView!
    
    fileprivate var indexPaths: Set<IndexPath> = []
    
    var account: Account?
    var transactions: [Transaction] = [] {
        didSet {
            transactionsTableView?.reloadData()
        }
    }
    var filter: Filter? {
        didSet {
            if let typeOfTrans = filter?.typeOfTransaction {
                switch typeOfTrans {
                case .all:
                    self.transactions = transactions.filter({$0.type == 1 || $0.type == 2})
                case .incoming:
                    self.transactions = transactions.filter({$0.type == 1})
                    if let  incomingType = filter?.incomingTypeOfTransactions, incomingType != .empty {
                        self.transactions = transactions.filter({$0.incomingType == incomingType.getString()})
                    }
                case .outgoing:
                    self.transactions = transactions.filter({$0.type == 2})
                    if let outgoingType = filter?.outgoingTypeOfTransactions, outgoingType != .empty {
                        self.transactions = transactions.filter({$0.outgoingType == outgoingType.getString()})
                        if let underTypes = filter?.outgoingUnderTypeOfTransaction, underTypes != .empty {
                            self.transactions = transactions.filter({$0.outgoingUnderType == underTypes.getString()})
                        }
                    }
                }
            }
            if let date = filter?.postingDate, let signForDate = filter?.signForDate {
                switch signForDate {
                case .equal:
                    self.transactions = transactions.filter({$0.postingDate.iso8601() == date.iso8601()})
                case .less:
                    self.transactions = transactions.filter({$0.postingDate.iso8601() < date.iso8601()})
                case .more:
                    self.transactions = transactions.filter({$0.postingDate.iso8601() > date.iso8601()})
                }
            }
            if let amount = filter?.ammount, let signForAmount = filter?.signForAmount {
                switch signForAmount {
                case .equal:
                    self.transactions = transactions.filter({$0.amount == amount})
                case .less:
                    self.transactions = transactions.filter({$0.amount < amount})
                case .more:
                    self.transactions = transactions.filter({$0.amount > amount})
                }
            }
            
            if let name = filter?.name {
                self.transactions = transactions.filter({$0.name.contains(name)})
            }
            
            if let merchant = filter?.merchant {
                self.transactions = transactions.filter({$0.merchant.contains(merchant)})
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactionsTableView.delegate = self
        transactionsTableView.dataSource = self
        
        heightOfSeparatorConstrain.constant = 0.5
        separatorUnderStatisticViewView.layer.backgroundColor = Color.MainGrey.cgColor
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(TransactionsTableViewController.swipeUp))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(TransactionsTableViewController.swipeDown))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        statisticView.backgroundColor = Color.White
        
        setStatisticView()
        
        transactionsTableView.rowHeight = UITableView.automaticDimension
        transactionsTableView.estimatedRowHeight = 200
    }
    
    @objc func swipeUp() {
        if statisticView.isDescendant(of: self.view) {
            UIView.animate(withDuration: 0.2, delay: 0.2, animations: {
                self.setStatisticView()
            })
        } else {
            self.view.addSubview(statisticView)
        }
    }
    
    @objc func swipeDown() {
        UIView.animate(withDuration: 0.2) {
            self.statisticButton.isHidden = true
            self.statisticButton.isEnabled = false
            self.heightOfStatisticViewConstraint.constant = 20
        }
    }

    private func setStatisticView() {
        if UIScreen.main.bounds.width == 320 { // SE // 4 , 4s
            self.heightOfStatisticViewConstraint.constant = -150
        } else if UIScreen.main.bounds.width == 375  { // 7 // 6,  6S, 8, X, Xs
            self.heightOfStatisticViewConstraint.constant = -260
        } else if UIScreen.main.bounds.width == 414  { // Xs Max // 7 plus, 8 Plus, Xr,
            self.heightOfStatisticViewConstraint.constant = -299
        }
        self.statisticButton.isHidden = false
        self.statisticButton.isEnabled = true
    }

}

extension TransactionsTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionsTableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.nameOfClass, for: indexPath) as! TransactionTableViewCell
        if let currency = account?.currency{
            if self.transactions[indexPath.item].transactionTypes?.transactionType == .incoming {
                cell.amountLabel.text = "+ \(self.transactions[indexPath.item].amount) \(currency)"
                cell.transactionTypeLabel.text = self.transactions[indexPath.item].transactionTypes?.incomingType?.rawValue.uppercased()
                cell.transactionTypeImageView.image = self.transactions[indexPath.item].transactionTypes?.incomingType?.getImage()
                cell.amountLabel.textColor = Color.IncomingGreen
            } else if self.transactions[indexPath.item].transactionTypes?.transactionType == .outgoing {
                cell.amountLabel.text = "- \(self.transactions[indexPath.item].amount) \(currency)"
                cell.transactionTypeLabel.text = self.transactions[indexPath.item].transactionTypes?.outgoingType?.rawValue.uppercased()
                cell.transactionTypeImageView.image = self.transactions[indexPath.item].transactionTypes?.outgoingType?.getImage()
                cell.amountLabel.textColor = Color.OutcomingRed
            }
            cell.expandedAmountLabel.text = "\(self.transactions[indexPath.item].amount) \(currency)"
        }
        
        cell.nameOfTransactionLabel.text = self.transactions[indexPath.item].name
        cell.descriptionOfTransactionLabel.text = self.transactions[indexPath.item].transDescription
        cell.postingDateLabel.text = self.transactions[indexPath.item].postingDate
        cell.vealueDateLabel.text = self.transactions[indexPath.item].valueDate
        cell.merchantLabel.text = self.transactions[indexPath.item].merchant
        
        cell.selectionStyle = .none
        cell.state = cellIsExpanded(at: indexPath) ? .expanded : .collapsed
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? TransactionTableViewCell {
            if cell.state == .expanded {
                cell.state = .collapsed
                removeExpandedIndexPath(indexPath)
            } else {
                cell.state = .expanded
                addExpandedIndexPath(indexPath)
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let replyAction = UIContextualAction(style: .normal, title:  "Reply", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("TODO: replay transaction flow")
            success(true)
        })
        replyAction.image = Image.Replay
        replyAction.backgroundColor = Color.MainRed
        
        let savePersonAction = UIContextualAction(style: .normal, title:  "Add Contact", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("TODO: add contact flow")
            success(true)
        })
        savePersonAction.image = Image.SaveContact
        savePersonAction.backgroundColor = Color.MainRed
        
        
        return UISwipeActionsConfiguration(actions: [replyAction, savePersonAction])
        
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let addPhotoAction = UIContextualAction(style: .normal, title:  "Add Photo", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("TODO: add photo flow action")
            success(true)
        })
        addPhotoAction.image = Image.AddPhoto
        addPhotoAction.backgroundColor = Color.MainRed
        
        return UISwipeActionsConfiguration(actions: [addPhotoAction])
    }
    
    func cellIsExpanded(at indexPath: IndexPath) -> Bool {
        return indexPaths.contains(indexPath)
    }
    
    func addExpandedIndexPath(_ indexPath: IndexPath) {
        indexPaths.insert(indexPath)
    }
    
    func removeExpandedIndexPath(_ indexPath: IndexPath) {
        indexPaths.remove(indexPath)
    }
}
