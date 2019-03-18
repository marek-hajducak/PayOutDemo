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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.barTintColor = Color.White
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }


}

