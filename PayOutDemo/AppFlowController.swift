//
//  AppFlowController.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 18/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class AppFlowController {
    
    fileprivate let window: UIWindow
    
    fileprivate let dependencies: AppDependency
    
    fileprivate var app: AppTabBarController?
    
    init(window: UIWindow) {
        self.window = window
        dependencies = AppDependency(transactionService: TransactionService(), accountService: AccountService())
    }
    
    func start() {
        let navController = UINavigationController()
        navController.navigationBar.backgroundColor = Color.White
        window.rootViewController = navController
        window.makeKeyAndVisible()
        let flowController = MainAppFlowController(navigationController: navController, dependencies: dependencies)
        flowController.start()
    }
}
