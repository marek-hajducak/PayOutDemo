//
//  InputViewController.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 26/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class InputViewController: BaseViewController {
    
    @IBOutlet weak var scrollView: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scrollView = self.scrollView {
            scrollView.keyboardDismissMode = .interactive
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let scrollView = self.scrollView, let userInfo = notification.userInfo, var keyboardFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardFrame = self.view.convert(keyboardFrame, from: nil)
            var contentInset: UIEdgeInsets = scrollView.contentInset
            contentInset.bottom = keyboardFrame.size.height + 50
            scrollView.contentInset = contentInset
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let scrollView = self.scrollView {
            let contentInset: UIEdgeInsets = UIEdgeInsets.zero
            scrollView.contentInset = contentInset
        }
    }
    
}

extension InputViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
