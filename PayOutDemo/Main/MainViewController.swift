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
    
    var flowDelegate: MainViewControllerFlowDelegate?
    
    var viewModel: MainViewModel?
    
    @IBOutlet weak var widgetContainerView: UIView!
    
    @IBOutlet weak var separatorView: UIView!
    
    @IBOutlet weak var accountsSwipeUpButton: UIButton! {
        didSet {
            self.accountsSwipeUpButton.addTarget(self, action: #selector(MainViewController.swipeDown), for: .touchUpInside)
            self.accountsSwipeUpButton.backgroundColor = Color.MainRed
            self.accountsSwipeUpButton.layer.cornerRadius = 15
            let imageForButton = #imageLiteral(resourceName: "arrow_down")
            self.accountsSwipeUpButton.setImage(imageForButton, for: .highlighted)
            self.accountsSwipeUpButton.setImage(imageForButton, for: .normal)
            self.accountsSwipeUpButton.imageView?.bounds.size.width = 14
            self.accountsSwipeUpButton.imageView?.bounds.size.height = 14
            accountsSwipeUpButton.imageView?.contentMode = .scaleAspectFit
            //Shadows
            accountsSwipeUpButton.layer.masksToBounds = false
            accountsSwipeUpButton.layer.shadowColor = Color.DarkGrey.cgColor
            accountsSwipeUpButton.layer.shadowOpacity = 0.6
            accountsSwipeUpButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            accountsSwipeUpButton.layer.shadowRadius = 3.0
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
    
    var accounts: [Account] = [] {
        didSet {
            accountsCollectionView.reloadData()
            createPageController()
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
    
    @objc func swipeUp() {
        if backgroundAccountsView.isDescendant(of: self.view) {
            UIView.animate(withDuration: 0.2, delay: 0.2, animations: {
                if UIScreen.main.bounds.width == 320 { // SE // 4 , 4s
                    self.heightOfAccountNavigationView.constant = -135
                } else if UIScreen.main.bounds.width == 375  { // 7 // 6,  6S, 8, X, Xs
                    self.heightOfAccountNavigationView.constant = -190
                } else if UIScreen.main.bounds.width == 414  { // Xs Max // 7 plus, 8 Plus, Xr,
                   self.heightOfAccountNavigationView.constant = -229
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
        let splitString = accounts[indexPath.item].avalibleBalance.split(separator: ",")
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
        cell.accountNumberLabel.text = accounts[indexPath.item].accountNumber
        cell.nameOfAccountHolderLabel.font = baseInfoFont
        cell.accountNumberLabel.font = baseInfoFont
        cell.accountIBANLabel.attributedText = attributedString
        cell.nameOfAccountLabel.text = accounts[indexPath.item].banknName
        
        // Return cell
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

