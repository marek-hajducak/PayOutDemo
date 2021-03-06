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

class MainViewController: BaseViewController {
    
    var allowCreatePageController: Bool = true
    
    var flowDelegate: MainViewControllerFlowDelegate?
    
    var viewModel: MainViewModel?
    
    @IBOutlet weak var widgetContainerView: UIView!
    
    @IBOutlet weak var separatorView: UIView!
    
    @IBOutlet weak var accountsSwipeUpButton: UIButton! {
        didSet {
            self.accountsSwipeUpButton.addTarget(self, action: #selector(MainViewController.swipeDown), for: .touchUpInside)
            self.accountsSwipeUpButton.backgroundColor = Color.MainColor
            self.accountsSwipeUpButton.layer.cornerRadius = 15
            let imageForButton = Image.ArrowDown
            self.accountsSwipeUpButton.setImage(imageForButton, for: .highlighted)
            self.accountsSwipeUpButton.setImage(imageForButton, for: .normal)
            self.accountsSwipeUpButton.imageView?.bounds.size.width = 14
            self.accountsSwipeUpButton.imageView?.bounds.size.height = 14
            accountsSwipeUpButton.imageView?.contentMode = .scaleAspectFit
            accountsSwipeUpButton.dropButtonShadow(color: Color.DarkGrey.cgColor, radius: 3.0, opacity: 0.6, offsetWidth: 2, offsetHeigt: 2, maskToBounds: false)
            accountsSwipeUpButton.layer.cornerRadius = 15.0
            
        }
    }
    
    @IBOutlet weak var heightOfAccountNavigationView: NSLayoutConstraint!
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
    var transactions: [Transaction] = []
    var accounts: [Account] = [] {
        didSet {
            accountsCollectionView.reloadData()
            if allowCreatePageController {
                createPageController()
                allowCreatePageController = false
            }
            createNewWidgetViewController()
        }
    }
    
    private func createNewWidgetViewController() {
        self.widgetContainerView.subviews.forEach({ $0.removeFromSuperview() })
        self.performSegue(withIdentifier: "Widget", sender: nil)
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpNavigationItems()
        separatorView.layer.backgroundColor = Color.MainGrey.cgColor
        swipeDown()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.accountsCollectionView.delegate = self
        self.accountsCollectionView.dataSource = self
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.swipeUp))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.swipeDown))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        self.accountsSwipeUpButton.isHidden = true
        self.accountsSwipeUpButton.isEnabled = false
    }
    
    override func setupViewModel() {
        super.setupViewModel()
        
        let input = MainViewModel.Input()
        
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
        
        output?.transactionsEvent.drive(onNext: { (event) in
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
    
    private func createPageController() {
        pageControl = CHIPageControlPuya(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        pageControl?.numberOfPages = accounts.count
        pageControl?.radius = 3
        pageControl?.tintColor = Color.MainGrey
        pageControl?.currentPageTintColor = Color.MainColor
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
    
    private func setUpNavigationItems() {
        // Left Buttons
        let livechatButton = UIButton.init(type: .custom)
        
        let heightConstraintLivechatButton = NSLayoutConstraint(item: livechatButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        let widthConstraintLivechatButton = NSLayoutConstraint(item: livechatButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        livechatButton.addConstraints([heightConstraintLivechatButton, widthConstraintLivechatButton])
        
        livechatButton.setImage(Image.Chat, for: UIControl.State.normal)
        livechatButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        livechatButton.addTarget(self, action: #selector(hitLiveChat), for: .touchUpInside)
        
        let settingsButton = UIButton.init(type: .custom)
        
        let heightConstraintSettingsButton = NSLayoutConstraint(item: settingsButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        let widthConstraintSettingsButton = NSLayoutConstraint(item: settingsButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        
        settingsButton.addConstraints([heightConstraintSettingsButton, widthConstraintSettingsButton])
        
        settingsButton.setImage(Image.Settings, for: UIControl.State.normal)
        settingsButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        settingsButton.addTarget(self, action: #selector(hitSettings), for: .touchUpInside)
        
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: settingsButton), UIBarButtonItem(customView: livechatButton)]

        // PayOut Logo
        let titleImageView = UIImageView(image: Image.PayoutLogo)
        titleImageView.frame = CGRect(x: 0, y: 0, width: 104, height: 30)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        // Right Buttons
        let mailBoxButton = UIButton.init(type: .custom)
        
        let heightConstraintMailBoxButton = NSLayoutConstraint(item: mailBoxButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        let widthConstraintMailBoxButton = NSLayoutConstraint(item: mailBoxButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 35)
        mailBoxButton.addConstraints([heightConstraintMailBoxButton, widthConstraintMailBoxButton])
        
        mailBoxButton.setImage(Image.Message, for: UIControl.State.normal)
        mailBoxButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        mailBoxButton.addTarget(self, action: #selector(hitMaiilBox), for: .touchUpInside)
        
        let qrCodeButton = UIButton.init(type: .custom)
        
        let heightConstraintQrCodeButton = NSLayoutConstraint(item: qrCodeButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        let widthConstraintQrCodeButton = NSLayoutConstraint(item: qrCodeButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        qrCodeButton.addConstraints([heightConstraintQrCodeButton, widthConstraintQrCodeButton])
        
        qrCodeButton.setImage(Image.QrCode, for: UIControl.State.normal)
        qrCodeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        qrCodeButton.addTarget(self, action: #selector(hitQRCode), for: .touchUpInside)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: mailBoxButton), UIBarButtonItem(customView: qrCodeButton)]
        
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.backgroundColor = Color.White
            navigationBar.isTranslucent = false
            
            navigationBar.setBackgroundImage(Image.Empty, for: .default)
            navigationBar.shadowImage = Image.Empty
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
    
    @objc func swipeUp() {
        if backgroundAccountsView.isDescendant(of: self.view) {
            UIView.animate(withDuration: 0.2, delay: 0.2, animations: {
                if UIScreen.main.bounds.width == 320 { // SE // 4 , 4s
                    self.heightOfAccountNavigationView.constant = -115
                } else if UIScreen.main.bounds.width == 375  { // 7 // 6,  6S, 8, X, Xs
                    self.heightOfAccountNavigationView.constant = -180
                } else if UIScreen.main.bounds.width == 414  { // Xs Max // 7 plus, 8 Plus, Xr,
                   self.heightOfAccountNavigationView.constant = -209
                }
                self.pageControl?.isHidden = true
                self.accountsCollectionView.isHidden = true
                self.accountsSwipeUpButton.isHidden = false
                self.accountsSwipeUpButton.isEnabled = true
            }) { (_) in 
                // Ukazať nieco na rozkliknutie uctov
            }
        } else {
            self.view.addSubview(backgroundAccountsView)
        }
    }
    
    @objc func swipeDown() {
        UIView.animate(withDuration: 0.2) {
            self.heightOfAccountNavigationView.constant = 20
            self.pageControl?.isHidden = false
            self.accountsCollectionView.isHidden = false
            self.accountsSwipeUpButton.isHidden = true
            self.accountsSwipeUpButton.isEnabled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Widget" {
            if let vc = segue.destination as? WidgetsViewController, !accounts.isEmpty  {
                vc.account = self.accounts[self.selectedAccountIndex ?? 0]
                vc.transactions = self.transactions
            }
        }
    }
    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = accountsCollectionView.dequeueReusableCell(withReuseIdentifier: AccountCell.nameOfClass, for: indexPath) as! AccountCell
        cell.dropShadow()
        if let currency = Currency(rawValue: accounts[indexPath.item].currency) {
            // Defined Fonts
            let baseInfoFont = Font.BaseInfoFont
            let ligtBigestOneAttributedFont = [NSAttributedString.Key.font : Font.BaseLightestBigFont] // zostatok pred desatinou ciarkou
            let lightSmallerOneAttributedFont = [NSAttributedString.Key.font : Font.BaseLightestSmallFont] // Za desatinou ciarkou
            let currencyAtriibutedFont = [NSAttributedString.Key.font: Font.CurrencyLighestFont] // mena za zostatkom
            // Defined attributedStrings
            let splitString = accounts[indexPath.item].avalibleBalance.split(separator: ",")
            let firstAttributedString = NSMutableAttributedString(string: String(splitString[0]), attributes: ligtBigestOneAttributedFont)
            let secondAttributedString = NSAttributedString(string: ",\(String(splitString[1]))", attributes: lightSmallerOneAttributedFont)
            let cuurencyAttributedString = NSMutableAttributedString(string: " \(currency.getCurrencySymbol())", attributes: currencyAtriibutedFont)
            let splitIban = accounts[indexPath.item].IBAN.split(separator: " ")
            let normalAtributes = [NSAttributedString.Key.font: Font.BasicIBANBoldFont]
            let boldAtributedString = [NSAttributedString.Key.font: Font.BasicIBANRegularFont]
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
            cell.accountNumberLabel.text = accounts[indexPath.item].accountNumber
            cell.nameOfAccountHolderLabel.font = baseInfoFont
            cell.accountNumberLabel.font = baseInfoFont
            cell.accountIBANLabel.attributedText = attributedString
            cell.nameOfAccountLabel.text = accounts[indexPath.item].banknName
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
        // Create new widgetviewContrroler only if index change
        if oldIndex != self.selectedAccountIndex {
            self.createNewWidgetViewController()
        }
        
    }
}

