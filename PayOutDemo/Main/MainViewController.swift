//
//  ViewController.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 18/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit
import CHIPageControl

protocol MainViewControllerFlowDelegate: class {
    
}

class MainViewController: UIViewController {
    
    var flowDelegate: MainViewControllerFlowDelegate?
    
    @IBOutlet weak var dragAndDropTableView: UITableView! {
        didSet {
            let cellNib = UINib(nibName: BaseWidgetTableViewCell.nameOfClass, bundle: nil)
            dragAndDropTableView.register(cellNib, forCellReuseIdentifier: BaseWidgetTableViewCell.nameOfClass)
        }
    }
    var model = Model()
    
    @IBOutlet weak var backgroundAccountsView: UIView!
    @IBOutlet weak var accountsCollectionView: UICollectionView! {
        didSet {
            let cellNib = UINib(nibName: AccountCell.nameOfClass, bundle: nil)
            accountsCollectionView.register(cellNib, forCellWithReuseIdentifier: AccountCell.nameOfClass)
        }
    }
    
    var selectedAccountIndex: Int? {
        didSet {
            updatePageController()
        }
    }
    let accounts: [Account] = [Account(id: 0, name: "Tatra Banka", amount: "46 300,00", holder: "Marek Hajdučák", IBAN: "SK92 1100 0000 0029 8374 2003", number: "29 8374 2003/1100"),
                               Account(id: 1, name: "Slovenská sporiteľna", amount: "2 300,89", holder: "Marek Hajdučák", IBAN: "SK92 3300 0000 0034 1234 9620", number: "34 1234 9620/3300"),
                               Account(id: 2, name: "Fio Banka", amount: "125 840,19", holder: "Marek Hajdučák", IBAN: "SK92 9800 0000 0045 1038 3041", number: "45 1038 3041/9800")]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpNavigationItems()
        createSeparator()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.accountsCollectionView.delegate = self
        self.accountsCollectionView.dataSource = self
        createPageController()
        
        dragAndDropTableView.dragDelegate = self
        dragAndDropTableView.dropDelegate = self
        dragAndDropTableView.delegate = self
        dragAndDropTableView.dataSource = self
        dragAndDropTableView.dragInteractionEnabled = true
    }
    
    var pageControl: CHIPageControlPuya?
    
    private func createPageController() {
        pageControl = CHIPageControlPuya(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        pageControl?.numberOfPages = accounts.count
        pageControl?.radius = 3
        pageControl?.tintColor = Color.MainGrey
        pageControl?.currentPageTintColor = Color.MainRed
        pageControl?.padding = 6
        if let pageController = pageControl {
            backgroundAccountsView.addSubview(pageController)
            
            pageController.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = NSLayoutConstraint(item: pageController, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: backgroundAccountsView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
            let verticalConstraint = NSLayoutConstraint(item: pageController, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: backgroundAccountsView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -15)
            backgroundAccountsView.addConstraints([horizontalConstraint, verticalConstraint])
        }
        pageControl?.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
        
        
    }
    
    private func updatePageController() {
        //set progress with animation
        if let index = selectedAccountIndex {
            pageControl?.set(progress: index, animated: true)
        }
    }
    
    private func createSeparator() {
        let separator = UIView(frame: CGRect(x: 0, y: backgroundAccountsView.bounds.size.height - 1, width: backgroundAccountsView.bounds.size.width, height: 0.5))
        separator.layer.backgroundColor = Color.MainGrey.cgColor
        backgroundAccountsView.addSubview(separator)
    }
    
    private func setUpNavigationItems() {
        
        let payoutLogoImage = UIImage(named: "payout_logo")
        let liveChatImage = UIImage(named: "live_chat")
        let mailBoxImage = UIImage(named: "mail_box")
        let qRCodeImage = UIImage(named: "qr_code")
        let settingsImage = UIImage(named: "settings")
        
        // Left Buttons
        let livechatButton = UIButton.init(type: .custom)
        
        let heightConstraintLivechatButton = NSLayoutConstraint(item: livechatButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        let widthConstraintLivechatButton = NSLayoutConstraint(item: livechatButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        livechatButton.addConstraints([heightConstraintLivechatButton, widthConstraintLivechatButton])
        
        livechatButton.setImage(liveChatImage, for: UIControl.State.normal)
        livechatButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        livechatButton.addTarget(self, action: #selector(hitLiveChat), for: .touchUpInside)
        
        let settingsButton = UIButton.init(type: .custom)
        
        let heightConstraintSettingsButton = NSLayoutConstraint(item: settingsButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        let widthConstraintSettingsButton = NSLayoutConstraint(item: settingsButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        
        settingsButton.addConstraints([heightConstraintSettingsButton, widthConstraintSettingsButton])
        
        settingsButton.setImage(settingsImage, for: UIControl.State.normal)
        settingsButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        settingsButton.addTarget(self, action: #selector(hitSettings), for: .touchUpInside)
        
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: settingsButton), UIBarButtonItem(customView: livechatButton)]

        // PayOut Logo
        let titleImageView = UIImageView(image: payoutLogoImage)
        titleImageView.frame = CGRect(x: 0, y: 0, width: 104, height: 30)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        // Right Buttons
        let mailBoxButton = UIButton.init(type: .custom)
        
        let heightConstraintMailBoxButton = NSLayoutConstraint(item: mailBoxButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        let widthConstraintMailBoxButton = NSLayoutConstraint(item: mailBoxButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 35)
        mailBoxButton.addConstraints([heightConstraintMailBoxButton, widthConstraintMailBoxButton])
        
        mailBoxButton.setImage(mailBoxImage, for: UIControl.State.normal)
        mailBoxButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        mailBoxButton.addTarget(self, action: #selector(hitMaiilBox), for: .touchUpInside)
        
        let qrCodeButton = UIButton.init(type: .custom)
        
        let heightConstraintQrCodeButton = NSLayoutConstraint(item: qrCodeButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        let widthConstraintQrCodeButton = NSLayoutConstraint(item: qrCodeButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        qrCodeButton.addConstraints([heightConstraintQrCodeButton, widthConstraintQrCodeButton])
        
        qrCodeButton.setImage(qRCodeImage, for: UIControl.State.normal)
        qrCodeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        qrCodeButton.addTarget(self, action: #selector(hitQRCode), for: .touchUpInside)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: mailBoxButton), UIBarButtonItem(customView: qrCodeButton)]
        
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.backgroundColor = Color.White
            navigationBar.isTranslucent = false
            
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
        }
        
    }
    
    
    @objc func hitLiveChat() {
        
    }
    
    @objc func hitMaiilBox() {
        
    }
    
    @objc func hitSettings() {
        
    }
    
    @objc func hitQRCode() {
        
    }
    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = accountsCollectionView.dequeueReusableCell(withReuseIdentifier: AccountCell.nameOfClass, for: indexPath) as! AccountCell
        cell.dropShadow()

        // Standard
        var ligtBigestOneAttributedFont = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 35, weight: .light)] // zostatok pred desatinou ciarkou
        var lightSmallerOneAttributedFont = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .light)] // za desatinou čiarkou
        var currencyAtriibutedFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .light)] // mena za zostatkom
        var baseSizeOfFont: CGFloat = 14.0
        var baseInfoFont = UIFont.systemFont(ofSize: baseSizeOfFont)
        
        // Based on width of device
        if UIScreen.main.bounds.width == 320 { // SE // 4 , 4s
            ligtBigestOneAttributedFont = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 30, weight: .light)]
            lightSmallerOneAttributedFont = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .light)]
            currencyAtriibutedFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .light)]
            baseSizeOfFont = 16
            baseInfoFont = UIFont.systemFont(ofSize: baseSizeOfFont)
        } else if UIScreen.main.bounds.width == 375  { // 7 // 6,  6S, 8, X, Xs
            ligtBigestOneAttributedFont = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 38, weight: .light)]
            lightSmallerOneAttributedFont = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 23, weight: .light)]
            currencyAtriibutedFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 33, weight: .light)]
            baseSizeOfFont = 19
            baseInfoFont = UIFont.systemFont(ofSize: baseSizeOfFont)
        } else if UIScreen.main.bounds.width == 414  { // Xs Max // 7 plus, 8 Plus, Xr,
            ligtBigestOneAttributedFont = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 50, weight: .light)]
            lightSmallerOneAttributedFont = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 35, weight: .light)]
            currencyAtriibutedFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 45, weight: .light)]
            baseSizeOfFont = 22
            baseInfoFont = UIFont.systemFont(ofSize: baseSizeOfFont)
        }
        
        // Defined attributedStrings
        let splitString = accounts[indexPath.item].amount.split(separator: ",")
        let firstAttributedString = NSMutableAttributedString(string: String(splitString[0]), attributes: ligtBigestOneAttributedFont)
        let secondAttributedString = NSAttributedString(string: ",\(String(splitString[1]))", attributes: lightSmallerOneAttributedFont)
        let cuurencyAttributedString = NSMutableAttributedString(string: " Kč", attributes: currencyAtriibutedFont)
        let splitIban = accounts[indexPath.item].IBAN.split(separator: " ")
        let baseSizeOfFontForIBAN = baseSizeOfFont - 3
        let normalAtributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: baseSizeOfFontForIBAN, weight: .regular)]
        let boldAtributedString = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: baseSizeOfFontForIBAN, weight: .bold)]
        let attributedString = NSMutableAttributedString(string: String(splitIban[0]), attributes: normalAtributes)
        let attributedStringNumberOfAccount = NSAttributedString(string: " \(String(splitIban[1]))", attributes: boldAtributedString)
        let attributedZerous = NSAttributedString(string: " \(String(splitIban[2]))", attributes: normalAtributes)
        let attributedStringOthers = NSAttributedString(string: " \(String(splitIban[3])) \(String(splitIban[4])) \(String(splitIban[5]))", attributes: boldAtributedString)
        
        // Apeend Atributes Strings
        firstAttributedString.append(secondAttributedString)
        firstAttributedString.append(cuurencyAttributedString)
        attributedString.append(attributedStringNumberOfAccount)
        attributedString.append(attributedZerous)
        attributedString.append(attributedStringOthers)
        
        // Cell inicialization
        cell.amountLabel.attributedText = firstAttributedString
        cell.nameOfAccountHolderLabel.text = accounts[indexPath.item].holder
        cell.accountNumberLabel.text = accounts[indexPath.item].number
        cell.nameOfAccountHolderLabel.font = baseInfoFont
        cell.accountNumberLabel.font = baseInfoFont
        cell.accountIBANLabel.attributedText = attributedString
        cell.nameOfAccountLabel.text = accounts[indexPath.item].name
        
        // Return cell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: accountsCollectionView.bounds.size.width - 40, height: accountsCollectionView.bounds.size.height - 40)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let indexPath = accountsCollectionView.indexPathsForVisibleItems
        if !indexPath.isEmpty {
            self.selectedAccountIndex = indexPath[0].item
        }
    }
    
}

extension MainViewController: UITableViewDragDelegate {
    // MARK: - UITableViewDragDelegate
    
    /**
     The `tableView(_:itemsForBeginning:at:)` method is the essential method
     to implement for allowing dragging from a table.
     */
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return model.dragItems(for: indexPath)
    }
}

extension MainViewController : UITableViewDropDelegate {
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

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
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
}
