//
//  FilterViewController.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 26/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

protocol FilterFlowDelegate: class {
    func backToTransaction()
    func filter(with filter: Filter)
}

class FilterViewController: InputViewController {
    
    @IBOutlet weak var filterButton: UIButton!
    
    // TEXT
    @IBOutlet weak var nameOfTransactionTextField: UITextField!
    @IBOutlet weak var merchantTextField: UITextField!
    
    // TEXT //
    
    // DATE AND AMOUNT
    @IBOutlet weak var dateSignSegmentControl: UISegmentedControl!
    @IBOutlet weak var amoutSignSegmentControl: UISegmentedControl!
    @IBOutlet weak var postingDatePickerView: PickerViewTextField! {
        didSet {
            postingDatePickerView.pickerView.tag = 5
        }
    }
    @IBOutlet weak var amountTextField: UITextField!
    
    private static let months = ["Január", "Február", "Marec", "Apríl", "Máj", "Jún", "Júl", "August", "September", "Október", "November", "December"]
    var day: Int = 1
    var month: String = "Január"
    var year: Int = 1950
    // DATE AND AMOUNT //
    
    // TYPES
    @IBOutlet weak var typeOfTransactionPickerView: PickerViewTextField! {
        didSet {
            typeOfTransactionPickerView.pickerView.tag = 1
            typeOfTransactionPickerView.text = TransactionType.allCases[0].getString()
        }
    }
    
    @IBOutlet weak var typeOfIncomingTransactionStackView: UIStackView!
    @IBOutlet weak var typeOfIncomingTransactionPickerView: PickerViewTextField! {
        didSet {
            typeOfIncomingTransactionPickerView.text = TransactionType.IncomingtransactionTypes.allCases[0].getString()
            typeOfIncomingTransactionPickerView.pickerView.tag = 2
        }
    }
    
    @IBOutlet weak var typeOutgoingTreansactionStackView: UIStackView!
    @IBOutlet weak var typeOfOutgoingTransactionPickerView: PickerViewTextField! {
        didSet {
            typeOfOutgoingTransactionPickerView.text = TransactionType.OutgoingtransactionTypes.OutgoingUnderTypes.allCases[0].getString()
            typeOfOutgoingTransactionPickerView.pickerView.tag = 3
        }
    }
    
    
    @IBOutlet weak var typeOfUnderOutgoingTransactionStackView: UIStackView!
    @IBOutlet weak var underTypeOfOutgoingTransactionPickerView: PickerViewTextField! {
        didSet {
            underTypeOfOutgoingTransactionPickerView.text = TransactionType.OutgoingtransactionTypes.OutgoingUnderTypes.allCases[0].getString()
            underTypeOfOutgoingTransactionPickerView.pickerView.tag = 4
        }
    }
    
    var indexOfUnderOutgoingType: Int = 0 {
        didSet {
            print(indexOfUnderOutgoingType)
        }
    }
    private let transactionTypes = TransactionTypes(incomingTypeString: nil, outgoingTypeString: nil, underOutgoingType: nil)
    var outgoingType: TransactionType.OutgoingtransactionTypes = .empty {
        didSet {
            underTypeOfOutgoingTransactionPickerView.pickerView.reloadAllComponents()
        }
    }
    // TYPES //
    
    var flowDelegate: FilterFlowDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        typeOfTransactionPickerView.delegate = self
        typeOfIncomingTransactionPickerView.delegate = self
        typeOfOutgoingTransactionPickerView.delegate = self
        underTypeOfOutgoingTransactionPickerView.delegate = self
        postingDatePickerView.delegate = self
        
        typeOfTransactionPickerView.pickerView.delegate = self
        typeOfTransactionPickerView.pickerView.dataSource = self
        
        typeOfIncomingTransactionPickerView.pickerView.delegate = self
        typeOfIncomingTransactionPickerView.pickerView.dataSource = self
        
        typeOfOutgoingTransactionPickerView.pickerView.delegate = self
        typeOfOutgoingTransactionPickerView.pickerView.dataSource = self
        
        underTypeOfOutgoingTransactionPickerView.pickerView.delegate = self
        underTypeOfOutgoingTransactionPickerView.pickerView.dataSource = self
        
        postingDatePickerView.pickerView.delegate = self
        postingDatePickerView.pickerView.dataSource = self
        
        typeOfIncomingTransactionStackView.isHidden = true
        typeOutgoingTreansactionStackView.isHidden = true
        typeOfUnderOutgoingTransactionStackView.isHidden = true
        
        dateSignSegmentControl.setTitle("<", forSegmentAt: 0)
        dateSignSegmentControl.setTitle(">", forSegmentAt: 1)
        dateSignSegmentControl.setTitle("=", forSegmentAt: 2)
        
        amoutSignSegmentControl.setTitle("<", forSegmentAt: 0)
        amoutSignSegmentControl.setTitle(">", forSegmentAt: 1)
        amoutSignSegmentControl.setTitle("=", forSegmentAt: 2)
        
        filterButton.layer.cornerRadius = 15
        filterButton.layer.backgroundColor = Color.MainRed.cgColor
        
        filterButton.layer.masksToBounds = false
        filterButton.layer.shadowColor = Color.DarkGrey.cgColor
        filterButton.layer.shadowOpacity = 0.6
        filterButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        filterButton.layer.shadowRadius = 6.0
        filterButton.layer.cornerRadius = 15.0
        
        title = "Filter"
    }
    
    var filter: Filter?
    
    private func setUpNavigationBar() {
        // Right Button
        let cancelbutton = UIButton.init(type: .custom)
        let heightConstraintFilterButton = NSLayoutConstraint(item: cancelbutton, attribute: NSLayoutConstraint.Attribute.height, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        let widthConstraintFilterButton = NSLayoutConstraint(item: cancelbutton, attribute: NSLayoutConstraint.Attribute.width, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        cancelbutton.addConstraints([heightConstraintFilterButton, widthConstraintFilterButton])
        cancelbutton.setImage(Image.Cancel, for: UIControl.State.normal)
        cancelbutton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        cancelbutton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cancelbutton)
        
        
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.barTintColor = Color.White
            navigationBar.titleTextAttributes = [.foregroundColor: Color.MainRed, .font : UIFont.systemFont(ofSize: 25, weight: .semibold)]
        }
    }
    
    @objc func cancel() {
        flowDelegate?.backToTransaction()
    }
    
    @IBAction func filterTransactions() {
        
        let typeOdTransactionIndex = typeOfTransactionPickerView.pickerView.selectedRow(inComponent: 0)
        let typeOfTransaction = TransactionType(rawValue: typeOdTransactionIndex)
        let incomingString = typeOfIncomingTransactionPickerView.text
        let outgoingString = typeOfOutgoingTransactionPickerView.text
        let underOutgoingString = underTypeOfOutgoingTransactionPickerView.text
        
        var date: String? = nil
        if let dateText = postingDatePickerView.text, dateText != "" {
            let array = dateText.split(separator: " ")
            if let month = FilterViewController.months.index(of: String(array[1])) {
                date = "\(array[0]) \(month + 1). \(array[2])"
            }
        }
        var signForDate: Sign?
        if let titleForSign = dateSignSegmentControl.titleForSegment(at: dateSignSegmentControl.selectedSegmentIndex) {
             signForDate = Sign(rawValue: titleForSign)
        }
        
        var amout: Double? = nil
        if let amountString = amountTextField.text, amountString != "" {
            let splitArray = amountString.split(separator: ",")
            if splitArray.count == 2 {
                amout = Double("\(splitArray[0]).\(splitArray[1])")
            } else if splitArray.count == 1 {
                amout = Double("\(splitArray[0])")
            }
        }
        
        var signForAmout: Sign?
        if let titleForSign = amoutSignSegmentControl.titleForSegment(at: amoutSignSegmentControl.selectedSegmentIndex) {
            signForAmout = Sign(rawValue: titleForSign)
        }
        
        var merchant: String? = nil
        if merchantTextField.text != "" {
            merchant = merchantTextField.text
        }
        
        var name:String? = nil
        if nameOfTransactionTextField.text != "" {
            name = nameOfTransactionTextField.text
        }
        filter = Filter(typeOfTransaction: typeOfTransaction, incomingType: TransactionType.IncomingtransactionTypes(rawValue: incomingString ?? "Empty"), outgoingType: TransactionType.OutgoingtransactionTypes(rawValue: outgoingString ?? "Empty"), outgoingUnderType: TransactionType.OutgoingtransactionTypes.OutgoingUnderTypes(rawValue: underOutgoingString ?? "Empty"), postingDate: date, ammount: amout, signForAmount: signForAmout, signForDate: signForDate, merchant: merchant, name: name)

        if let filter = self.filter {
            flowDelegate?.filter(with: filter)
        }
    }
    
    
}

extension FilterViewController: UpdatePickerViewDelegate {
    func didTouchDone() {
        
    }
}

extension FilterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView.tag {
        case 1...4:
            return 1
        case 5:
            return 3
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return TransactionType.allCases.count
        } else if pickerView.tag == 2 {
            return TransactionType.IncomingtransactionTypes.allCases.count
        } else if pickerView.tag == 3 {
            return TransactionType.OutgoingtransactionTypes.allCases.count
        } else if pickerView.tag == 4 {
            if let dictionary = transactionTypes.underTypesDictionary[outgoingType] {
                let keys = Array(dictionary.keys)
                typeOfUnderOutgoingTransactionStackView.isHidden = false
                return keys.count
            } else {
                typeOfUnderOutgoingTransactionStackView.isHidden = true
                return 0
            }
        } else if pickerView.tag == 5 {
            switch component {
            case 0:
                return 31
            case 1:
                return 12
            case 2:
                return 100
            default:
                return 0
            }
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return TransactionType.allCases[row].getString()
        } else if pickerView.tag == 2 {
            guard TransactionType.IncomingtransactionTypes.allCases[row] != .empty else {
                return "-"
            }
            return TransactionType.IncomingtransactionTypes.allCases[row].getString()
        } else if pickerView.tag == 3 {
            guard TransactionType.OutgoingtransactionTypes.allCases[row] != .empty else {
                return "-"
            }
            return TransactionType.OutgoingtransactionTypes.allCases[row].getString()
        } else if pickerView.tag == 4 {
            if let dictionary = transactionTypes.underTypesDictionary[outgoingType] {
                let keys = Array(dictionary.keys)
                guard keys[row] != "Empty" else {
                    return "-"
                }
                return keys[row]
            } else {
                return "-"
            }
        } else if pickerView.tag == 5 {
            switch component {
            case 0:
                return "\(row + 1)."
            case 1:
                return FilterViewController.months[row]
            case 2:
                 return "\(row + year)"
            default:
                return "-"
            }
        } else {
            return "-"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let choosen = TransactionType.allCases[row]
            typeOfTransactionPickerView.text = choosen.getString()
            switch choosen{
            case .incoming:
                typeOfIncomingTransactionStackView.isHidden = false
                typeOutgoingTreansactionStackView.isHidden = true
                typeOfUnderOutgoingTransactionStackView.isHidden = true
            case .outgoing:
                typeOfIncomingTransactionStackView.isHidden = true
                typeOutgoingTreansactionStackView.isHidden = false
                typeOfUnderOutgoingTransactionStackView.isHidden = typeOfOutgoingTransactionPickerView.text == "Empty"
            case .all:
                typeOfIncomingTransactionStackView.isHidden = true
                typeOutgoingTreansactionStackView.isHidden = true
                typeOfUnderOutgoingTransactionStackView.isHidden = true
            }
        } else if pickerView.tag == 2 {
            let choosen = TransactionType.IncomingtransactionTypes.allCases[row]
            typeOfIncomingTransactionPickerView.text = choosen.getString()
            typeOutgoingTreansactionStackView.isHidden = true
            typeOfTransactionPickerView.text = TransactionType.incoming.getString()
        } else if pickerView.tag == 3 {
            let choosen = TransactionType.OutgoingtransactionTypes.allCases[row]
            typeOfOutgoingTransactionPickerView.text = choosen.getString()
            typeOfUnderOutgoingTransactionStackView.isHidden = false
            typeOfIncomingTransactionStackView.isHidden = true
            typeOfTransactionPickerView.text = TransactionType.outgoing.getString()
            outgoingType = choosen
            guard outgoingType != .empty else {
                typeOfUnderOutgoingTransactionStackView.isHidden = true
                return
            }
            typeOfUnderOutgoingTransactionStackView.isHidden = false
            if let dictionary = transactionTypes.underTypesDictionary[outgoingType] {
                guard  Array(dictionary.keys).count > indexOfUnderOutgoingType else {
                    underTypeOfOutgoingTransactionPickerView.text = Array(dictionary.keys).last
                    return
                }
                underTypeOfOutgoingTransactionPickerView.text = Array(dictionary.keys)[indexOfUnderOutgoingType]
            }
           
        } else if pickerView.tag == 4 {
            typeOfUnderOutgoingTransactionStackView.isHidden = false
            if let dictionary = transactionTypes.underTypesDictionary[outgoingType] {
                let keys = Array(dictionary.keys)
                underTypeOfOutgoingTransactionPickerView.text = keys[row]
            }
            indexOfUnderOutgoingType = pickerView.selectedRow(inComponent: 0)
        } else if pickerView.tag == 5 {
            var yearToShow: Int = 0
            switch component {
                case 0:
                    day = row + 1
                case 1:
                    month = FilterViewController.months[row]
                case 2:
                    yearToShow = row + self.year
                default:()
            }
            postingDatePickerView.text = "\(day). \(month) \(yearToShow)"
        }
    }
    
}
