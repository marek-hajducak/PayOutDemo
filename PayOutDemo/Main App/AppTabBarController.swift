//
//  AppTabBarController.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 22/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

enum AppTab: Int {
    case home = 1
    case transactions = 2
    case statistic = 3
    case settings = 4
}


protocol AppFlowDelegate: class {
    func tabBarItemDidChanged(item: UITabBarItem)
}

class AppTabBarController: UITabBarController, UITabBarControllerDelegate {

    var flowDelegate: AppFlowDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        flowDelegate?.tabBarItemDidChanged(item: item)
    }

}

