//
//  MainAppFlowController.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 22/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class MainAppFlowController {
    
    fileprivate let navigationController: UINavigationController
    
    fileprivate let dependencies: AppDependency
    
    fileprivate var appTabBar: AppTabBarController?
    
    init(navigationController: UINavigationController, dependencies: AppDependency) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        // If user is not login, start ondoabring
        setUpMain()
    }
    
    func setUpMain() {
        appTabBar = StoryboardScene.AppTabBar.initialScene.instantiate()
        appTabBar?.flowDelegate = self
        
        let viewOffset: CGFloat = 5.0
        let baseWidthOfView: CGFloat = UIScreen.main.bounds.width/4 - viewOffset*2
        let baseHeightOfView: CGFloat = 4
        var yPossitionOfView: CGFloat = (UIScreen.main.bounds.height - (appTabBar?.tabBar.bounds.size.height)!)
        if UIScreen.main.bounds.height >= 812 { // Correction on iPhoneX
            yPossitionOfView = yPossitionOfView - self.navigationController.navigationBar.bounds.height + 10
        } // Testiong on SE, 7, X, X MAX - correct
        
        let homeNavigationController = UINavigationController()
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: Image.HomeTabBar, tag: 1)
        let mainFlowController = MainFlowController(navigationController: homeNavigationController, dependencies: dependencies)
        mainFlowController.start()

        if (UIScreen.main.bounds.width < 768) { // Yellow indicators of selected tabs turn oof for iPads (means if width of screen is higher then 768)
            let homeSelectedView = UIView(frame: CGRect(x: viewOffset, y: yPossitionOfView , width: baseWidthOfView, height: baseHeightOfView))
            homeSelectedView.layer.backgroundColor = Color.MainColor.cgColor
            homeSelectedView.tag = 1
            homeSelectedView.isHidden = false
            appTabBar?.view.addSubview(homeSelectedView)
        }
        
        let transactionsNavigationController = UINavigationController()
        transactionsNavigationController.tabBarItem = UITabBarItem(title: "Transactions", image: Image.TransactionTabBar, tag: 2)
        let transactionFlowController = TransactionFlowController(navigationController: transactionsNavigationController, dependencies: dependencies)
        transactionFlowController.start()
        
        if (UIScreen.main.bounds.width < 768) { // Yellow indicators of selected tabs turn oof for iPads (means if width of screen is higher then 768)
            let carSelectedView = UIView(frame: CGRect(x: baseWidthOfView + viewOffset*3, y: yPossitionOfView , width: baseWidthOfView, height: baseHeightOfView))
            carSelectedView.layer.backgroundColor = Color.MainColor.cgColor
            carSelectedView.tag = 2
            carSelectedView.isHidden = true
            appTabBar?.view.addSubview(carSelectedView)
        }
        
        let statisticNavigationController = UINavigationController()
        statisticNavigationController.tabBarItem = UITabBarItem(title: "Statistics", image: Image.StatisticTabBar, tag: 3)
        
        if (UIScreen.main.bounds.width < 768) { // Yellow indicators of selected tabs turn oof for iPads (means if width of screen is higher then 768)
            let contactSelectedView = UIView(frame: CGRect(x: baseWidthOfView*2 + viewOffset*5, y: yPossitionOfView , width: baseWidthOfView, height: baseHeightOfView))
            contactSelectedView.layer.backgroundColor = Color.MainColor.cgColor
            contactSelectedView.tag = 3
            contactSelectedView.isHidden = true
            appTabBar?.view.addSubview(contactSelectedView)
        }
        
        let settingsNavigationController = UINavigationController()
        settingsNavigationController.tabBarItem = UITabBarItem(title: "Settings", image: Image.SettingsTabBar, tag: 4)
        
        
        if (UIScreen.main.bounds.width < 768) { // Yellow indicators of selected tabs turn oof for iPads (means if width of screen is higher then 768)
            let controlSelectedView = UIView(frame: CGRect(x: baseWidthOfView*3 + viewOffset*7, y: yPossitionOfView , width: baseWidthOfView, height: baseHeightOfView))
            controlSelectedView.layer.backgroundColor = Color.MainColor.cgColor
            controlSelectedView.tag = 4
            controlSelectedView.isHidden = true
            appTabBar?.view.addSubview(controlSelectedView)
        }
        
        appTabBar?.viewControllers = [homeNavigationController,transactionsNavigationController,statisticNavigationController,settingsNavigationController]
        navigationController.navigationBar.isHidden = true
        if let app = appTabBar {
            navigationController.viewControllers = [app]
        }
        
    }
    
}

extension MainAppFlowController: AppFlowDelegate {
    func tabBarItemDidChanged(item: UITabBarItem) {
        if let subviews = appTabBar?.view.subviews {
            for view in subviews {
                if view.tag == item.tag {
                    view.isHidden = false
                } else if view.tag == 1 || view.tag == 2 || view.tag == 3 || view.tag == 4 {
                    view.isHidden = true
                }
            }
        }
    }
}
