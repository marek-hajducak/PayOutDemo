//
//  FilterFlowController.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 26/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

protocol FilterDelegate: class {
    func filter(with filter: Filter)
}

class FilterFlowController {
    
    fileprivate let navigationController: UINavigationController
    
    fileprivate let dependencies: AppDependency
    
    var filterDelegate: FilterDelegate?
    
    init(navigationController: UINavigationController, dependencies: AppDependency) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start(with filter: Filter?) {
        let filterStoryBoard = StoryboardScene.Filter.initialScene.instantiate()
        filterStoryBoard.flowDelegate = self
        filterStoryBoard.filter = filter
        navigationController.viewControllers = [filterStoryBoard]
        navigationController.navigationBar.isHidden = false
        UIApplication.shared.statusBarView?.backgroundColor = Color.White
    }
    
}

extension FilterFlowController: FilterFlowDelegate {
    func filter(with filter: Filter) {
        filterDelegate?.filter(with: filter)
        navigationController.dismiss(animated: true, completion: nil)
    }
    
    func backToTransaction() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}

