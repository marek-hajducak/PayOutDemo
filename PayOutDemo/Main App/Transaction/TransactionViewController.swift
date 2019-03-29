//
//  TransactionViewController.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 22/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//
import UIKit
import CHIPageControl

protocol TransactionFlowDelegate {
    func showFilter(with filter: Filter?)
}

class TransactionViewController: BaseViewController {
    
    var flowDelegate: TransactionFlowDelegate?
    
    var viewModel: TransacstionViewModel?

    @IBOutlet weak var accountsBackgroundView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var accountsCollectionView: UICollectionView! {
        didSet {
            let cellNib = UINib(nibName: AccountsTransactionCell.nameOfClass, bundle: nil)
            accountsCollectionView.register(cellNib, forCellWithReuseIdentifier: AccountsTransactionCell.nameOfClass)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationItems()
        
        accountsCollectionView.delegate = self
        accountsCollectionView.dataSource = self

    }
    
    var filter: Filter? {
        didSet {
            createNewTransactionViewController()
        }
    }
    
    var selectedAccountIndex: Int? {
        didSet {
            updatePageController()
        }
    }
    
    var allowCreatePageController: Bool = true
    
    var accounts: [Account] = [] {
        didSet {
            accountsCollectionView.reloadData()
            if allowCreatePageController {
                createPageController()
                allowCreatePageController = false
            }
        }
    }
    
    var transactions: [Transaction] = [] {
        didSet {
            createNewTransactionViewController()
            accountsCollectionView.reloadData()
        }
    }
    
    private func createNewTransactionViewController() {
        self.containerView.subviews.forEach({ $0.removeFromSuperview() })
        self.performSegue(withIdentifier: "Transaction", sender: nil)
    }

    
    override func setupViewModel() {
        super.setupViewModel()
        let input = TransacstionViewModel.Input()
        
        let output = self.viewModel?.transform(input: input)
        
        output?.accountsEvent.drive(onNext: { (event) in
            if event.isLoading {
                self.view.startActivityIndicator()
            } else if let error = event.error {
                self.view.stopActivityIndicator()
                AlertHandler.showWhisper(message: "\(error)", type: .error, shouldHide: true)
            } else if let accounts = event.data {
                self.view.stopActivityIndicator()
                self.accounts = accounts
            }
        }).disposed(by: self.disposeBag)
        
        output?.transactionEvent.drive(onNext: {(event) in
            if event.isLoading {
                self.view.startActivityIndicator()
            } else if let error = event.error {
                self.view.stopActivityIndicator()
                AlertHandler.showWhisper(message: "\(error)", type: .error, shouldHide: true)
            } else if let transactions = event.data {
                self.view.stopActivityIndicator()
                self.transactions = transactions
            }
        }).disposed(by: self.disposeBag)
        
    }
    
     var pageControl: CHIPageControlPuya?
    
    private func updatePageController() {
        //set progress with animation
        if let index = selectedAccountIndex {
            pageControl?.set(progress: index, animated: true)
        }
    }
    
    private func createPageController() {
        pageControl = CHIPageControlPuya(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        pageControl?.numberOfPages = accounts.count
        pageControl?.radius = 3
        pageControl?.tintColor = Color.MainGrey
        pageControl?.currentPageTintColor = Color.MainRed
        pageControl?.padding = 6
        if let pageController = pageControl {
            accountsBackgroundView.addSubview(pageController)
            
            pageController.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = NSLayoutConstraint(item: pageController, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: accountsBackgroundView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
            let verticalConstraint = NSLayoutConstraint(item: pageController, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: accountsBackgroundView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -15)
            accountsBackgroundView.addConstraints([horizontalConstraint, verticalConstraint])
        }
        pageControl?.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    }
    
    private func setUpNavigationItems() {
    
        // Left Button
        let qRCodeButton = UIButton.init(type: .custom)
        let heightConstraintqRCodeButton = NSLayoutConstraint(item: qRCodeButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        let widthConstraintqRCodeButton = NSLayoutConstraint(item: qRCodeButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        qRCodeButton.addConstraints([heightConstraintqRCodeButton, widthConstraintqRCodeButton])
        qRCodeButton.setImage(Image.QrCode, for: UIControl.State.normal)
        qRCodeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        qRCodeButton.addTarget(self, action: #selector(hitQRcode), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: qRCodeButton)
        
        // PayOut Logo
        let titleImageView = UIImageView(image: Image.PayoutLogo)
        titleImageView.frame = CGRect(x: 0, y: 0, width: 104, height: 30)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        // Right Button
        let filterButton = UIButton.init(type: .custom)
        let heightConstraintFilterButton = NSLayoutConstraint(item: filterButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        let widthConstraintFilterButton = NSLayoutConstraint(item: filterButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        filterButton.addConstraints([heightConstraintFilterButton, widthConstraintFilterButton])
        filterButton.setImage(Image.Filter.imageWithColor(color1: Color.MainRed), for: UIControl.State.normal)
        filterButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        filterButton.addTarget(self, action: #selector(hitFilter), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: filterButton)
        
        
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.backgroundColor = Color.White
            navigationBar.isTranslucent = false
            
            navigationBar.setBackgroundImage(Image.Empty, for: .default)
            navigationBar.shadowImage = Image.Empty
        }
        
    }
    
    @objc func hitQRcode() {
    
    }
    
    @objc func hitFilter() {
        flowDelegate?.showFilter(with: self.filter)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Transaction" {
            if let vc = segue.destination as? TransactionsTableViewController, !accounts.isEmpty, !transactions.isEmpty {
                let accountId = self.accounts[self.selectedAccountIndex ?? 0].id
                vc.account = self.accounts[self.selectedAccountIndex ?? 0]
                vc.transactions = self.transactions.filter({$0.accountId == accountId})
                vc.filter = self.filter
            }
        }
    }
 
}

extension TransactionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return accounts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = accountsCollectionView.dequeueReusableCell(withReuseIdentifier: AccountsTransactionCell.nameOfClass, for: indexPath) as! AccountsTransactionCell
        if let currency = Currency(rawValue: accounts[indexPath.item].currency) {
            cell.amountLabel.text = "\(accounts[indexPath.item].currentBalance) \(currency.getCurrencySymbol())"
            cell.nameOfAccountLabel.text = accounts[indexPath.item].banknName
            var incomingAmount: Double = 0
            var outgoingAmount: Double = 0
            for transaction in transactions {
                if transaction.incomingType != nil, transaction.accountId == accounts[indexPath.item].id {
                    incomingAmount += transaction.amount
                } else if transaction.outgoingType != nil, transaction.accountId == accounts[indexPath.item].id {
                    outgoingAmount += transaction.amount
                }
            cell.incomeAmountLabel.text = "+ \(incomingAmount.rounded(toPlaces: 2)) \(currency.getCurrencySymbol())"
            cell.outgoingAmounLabel.text = "- \(outgoingAmount.rounded(toPlaces: 2)) \(currency.getCurrencySymbol())"
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: accountsCollectionView.bounds.size.width - 40, height: accountsCollectionView.bounds.size.height - 40)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let oldIndex = self.selectedAccountIndex
        let indexPath = accountsCollectionView.indexPathsForVisibleItems
        if !indexPath.isEmpty {
            self.selectedAccountIndex = indexPath[0].item
        }
        if oldIndex != self.selectedAccountIndex {
            self.createNewTransactionViewController()
        }
    }
    
}
