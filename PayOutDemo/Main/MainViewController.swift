//
//  ViewController.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 18/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

protocol MainViewControllerFlowDelegate: class {
    
}

class MainViewController: UIViewController {
    
    var flowDelegate: MainViewControllerFlowDelegate?
    
    @IBOutlet weak var backgroundOfView: UIView!
    @IBOutlet weak var backgroundAccountsView: UIView!
    @IBOutlet weak var accountsCollectionView: UICollectionView! {
        didSet {
            let cellNib = UINib(nibName: AccountCell.nameOfClass, bundle: nil)
            accountsCollectionView.register(cellNib, forCellWithReuseIdentifier: AccountCell.nameOfClass)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        backgroundOfView.backgroundColor = Color.MainBackground
        setUpNavigationItems()
        createSeparator()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.accountsCollectionView.delegate = self
        self.accountsCollectionView.dataSource = self
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
        livechatButton.setImage(liveChatImage, for: UIControl.State.normal)
        livechatButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        livechatButton.addTarget(self, action: #selector(hitLiveChat), for: .touchUpInside)
        
        let settingsButton = UIButton.init(type: .custom)
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
        mailBoxButton.setImage(mailBoxImage, for: UIControl.State.normal)
        mailBoxButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        mailBoxButton.addTarget(self, action: #selector(hitMaiilBox), for: .touchUpInside)
        
        let qrCodeButton = UIButton.init(type: .custom)
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
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = accountsCollectionView.dequeueReusableCell(withReuseIdentifier: AccountCell.nameOfClass, for: indexPath) as! AccountCell
        cell.dropShadow()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: accountsCollectionView.bounds.size.width - 40, height: accountsCollectionView.bounds.size.height - 40)
    }
    
    
}

/*
 let livechatButton = UIButton.init(type: .custom)
 livechatButton.setImage(UIImage(named: "live_chat"), for: UIControl.State.normal)
 livechatButton.addTarget(self, action: #selector(hitLiveChat), for: UIControl.Event.touchUpInside)
 navigationItem.leftBarButtonItem = UIBarButtonItem(customView: livechatButton)
 
 let mailBoxButton = UIButton.init(type: .custom)
 mailBoxButton.setImage(UIImage(named: "mail_box"), for: UIControl.State.normal)
 mailBoxButton.addTarget(self, action: #selector(hitMaiilBox), for: UIControl.Event.touchUpInside)
 navigationItem.rightBarButtonItem = UIBarButtonItem(customView: mailBoxButton)
 
 // Create View in Navigation bar
 let view = UIView(frame: CGRect(x: 0, y: 0, width: navigation.navigationBar.bounds.width - 105 , height: navigation.navigationBar.bounds.size.height))
 
 // Settings Button
 let settingsImage = UIImage(named: "settings")
 let settingsButton = UIButton.init(type: .custom)
 settingsButton.setImage(settingsImage, for: UIControl.State.normal)
 settingsButton.addTarget(self, action: #selector(hitSettings), for: UIControl.Event.touchUpInside)
 
 // Payout Logo View
 let payoutLogoImage = UIImage(named: "payout_logo")
 let payoutLogoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 54))
 payoutLogoImageView.image = payoutLogoImage
 
 let qRCodeImage = UIImage(named: "qr_code")
 let qRCodeButton = UIButton.init(type: .custom)
 qRCodeButton.setImage(qRCodeImage, for: UIControl.State.normal)
 qRCodeButton.addTarget(self, action: #selector(hitSettings), for: UIControl.Event.touchUpInside)
 */
