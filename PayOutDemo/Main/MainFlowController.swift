//
//  MainFlowController.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 18/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class MainFlowController {
    
    fileprivate let navigationController: UINavigationController
    
    fileprivate let dependencies: AppDependency
    
    init(navigationController: UINavigationController, dependencies: AppDependency) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let mainStoryBoard = StoryboardScene.Main.initialScene.instantiate()
        mainStoryBoard.flowDelegate = self
        navigationController.viewControllers = [mainStoryBoard]
        navigationController.navigationBar.isHidden = false
        UIApplication.shared.statusBarView?.backgroundColor = Color.White
    }
    
}

extension MainFlowController: MainViewControllerFlowDelegate {
    
    
}
