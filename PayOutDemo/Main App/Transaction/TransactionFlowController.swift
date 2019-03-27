//
//  TransactionFlowController.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 22/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class TransactionFlowController {
    
    fileprivate let navigationController: UINavigationController
    
    fileprivate let dependencies: AppDependency
    
    init(navigationController: UINavigationController, dependencies: AppDependency) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let transactionStoryBoard = StoryboardScene.Transaction.initialScene.instantiate()
        transactionStoryBoard.flowDelegate = self
        transactionStoryBoard.viewModel = TransacstionViewModel(dependencies: dependencies)
        navigationController.viewControllers = [transactionStoryBoard]
        navigationController.navigationBar.isHidden = false
        UIApplication.shared.statusBarView?.backgroundColor = Color.White
    }
    
}

extension TransactionFlowController: TransactionFlowDelegate {
    func showFilter(with filter: Filter?) {
        let navController = UINavigationController()
        let filterFlowController = FilterFlowController(navigationController: navController, dependencies: dependencies)
        navigationController.present(navController, animated: true, completion: nil)
        filterFlowController.filterDelegate = self
        filterFlowController.start(with: filter)
    }
}

extension TransactionFlowController: FilterDelegate {
    func filter(with filter: Filter) {
        if let navigationController = navigationController.viewControllers[0] as? TransactionViewController {
            navigationController.filter = filter
        }
    }

}


