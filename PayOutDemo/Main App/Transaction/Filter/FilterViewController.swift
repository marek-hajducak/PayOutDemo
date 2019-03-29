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
    
    @IBOutlet var filterTitles: [UILabel]!
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
    var yearToShow: Int = 1950
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
    
    var filter: Filter? {
        didSet {
            
        }
    }
    
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
        filterButton.dropButtonShadow(color: Color.DarkGrey.cgColor, radius: 6.0, opacity: 0.6, offsetWidth: 4, offsetHeigt: 4, maskToBounds: false)
        setFilterScreen()
        
        for label in filterTitles {
            label.font = Font.BasicFilterTitle
        }
        
        title = "Filter"
    }
    
    private func setFilterScreen() {
        if let filter = filter  {
            //TODO: Nastaviť typy podla filtra
            if let type = filter.typeOfTransaction {
                switch type {
                case .all:
                    typeOfTransactionPickerView.pickerView.selectRow(0, inComponent: 0, animated: true)
                    typeOfIncomingTransactionStackView.isHidden = true
                    typeOutgoingTreansactionStackView.isHidden = true
                    typeOfUnderOutgoingTransactionStackView.isHidden = true
                case .incoming:
                    typeOfTransactionPickerView.pickerView.selectRow(1, inComponent: 0, animated: true)
                    typeOfIncomingTransactionStackView.isHidden = false
                    typeOutgoingTreansactionStackView.isHidden = true
                    typeOfUnderOutgoingTransactionStackView.isHidden = true
                    if let incomingType = filter.incomingTypeOfTransactions {
                        if let casesOfIncomingTypes = TransactionType.IncomingtransactionTypes.allCases.index(of: incomingType) {
                            typeOfIncomingTransactionPickerView.pickerView.selectRow(casesOfIncomingTypes, inComponent: 0, animated: true)
                        }
                        typeOfIncomingTransactionPickerView.text = incomingType.getString()
                    }
                case .outgoing:
                    typeOfTransactionPickerView.pickerView.selectRow(2, inComponent: 0, animated: true)
                    typeOfIncomingTransactionStackView.isHidden = true
                    typeOutgoingTreansactionStackView.isHidden = false
                    typeOfUnderOutgoingTransactionStackView.isHidden = false
                    if let outgoingType = filter.outgoingTypeOfTransactions {
                        self.outgoingType = outgoingType
                        if let casesOfOutgoingTypes = TransactionType.OutgoingtransactionTypes.allCases.index(of: outgoingType) {
                            typeOfOutgoingTransactionPickerView.pickerView.selectRow(casesOfOutgoingTypes, inComponent: 0, animated: true)
                        }
                        typeOfOutgoingTransactionPickerView.text = outgoingType.getString()
                        typeOfUnderOutgoingTransactionStackView.isHidden = outgoingType == .empty
                        if let outgoingUnderType = filter.outgoingUnderTypeOfTransaction {
                            if let dictionaryOfIUnderTypes = transactionTypes.underTypesDictionary[outgoingType],
                                let index = dictionaryOfIUnderTypes.index(forKey: outgoingUnderType.getString()) {
                                let distance = dictionaryOfIUnderTypes.distance(from: dictionaryOfIUnderTypes.startIndex, to: index)
                                underTypeOfOutgoingTransactionPickerView.pickerView.selectRow(distance, inComponent: 0, animated: true)
                                underTypeOfOutgoingTransactionPickerView.text = outgoingUnderType.getString()
                            }
                        }
                    }
                }
                typeOfTransactionPickerView.text = type.getString()
                
            }
            // Set date and dateSign
            if let date = filter.postingDate {
                let arrayDates = date.split(separator: " ")
                let mounth = arrayDates[1].split(separator: ".")
                let indexOfMount = (Int(String(mounth[0])) ?? 1) - 1
                let monthString = FilterViewController.months[indexOfMount]
                postingDatePickerView.text = "\(arrayDates[0]) \(monthString) \(arrayDates[2])"
                
                // Select day
                if let day = Int(String(arrayDates[0].split(separator: ".")[0])) {
                    let dayIndex = day - 1
                    postingDatePickerView.pickerView.selectRow(dayIndex, inComponent: 0, animated: true)
                }
                // Select month
                postingDatePickerView.pickerView.selectRow(indexOfMount, inComponent: 1, animated: true)
                // Select Year
                if let year = Int(String(arrayDates[2])) {
                    let yearIndex = year - self.year
                    postingDatePickerView.pickerView.selectRow(yearIndex, inComponent: 2, animated: true)
                }
                
                if let sign = filter.signForDate {
                    switch sign {
                    case .equal:
                        dateSignSegmentControl.selectedSegmentIndex = 2
                    case .less:
                        dateSignSegmentControl.selectedSegmentIndex = 0
                    case .more:
                        dateSignSegmentControl.selectedSegmentIndex = 1
                    }
                }
            } else {
                postingDatePickerView.text = ""
                postingDatePickerView.pickerView.selectRow(0, inComponent: 0, animated: true)
                postingDatePickerView.pickerView.selectRow(0, inComponent: 1, animated: true)
                postingDatePickerView.pickerView.selectRow(0, inComponent: 2, animated: true)
                dateSignSegmentControl.selectedSegmentIndex = 0
            }
            // Set amount and amountSign
            if let amount = filter.ammount {
                amountTextField.text = "\(amount)"
                if let sign = filter.signForAmount {
                    switch sign {
                    case .equal:
                        amoutSignSegmentControl.selectedSegmentIndex = 2
                    case .less:
                        amoutSignSegmentControl.selectedSegmentIndex = 0
                    case .more:
                        amoutSignSegmentControl.selectedSegmentIndex = 1
                    }
                }
            } else {
                amountTextField.text = ""
                amoutSignSegmentControl.selectedSegmentIndex = 0
            }
            // Set Name and Merchant based on Filter
            nameOfTransactionTextField.text = filter.name
            merchantTextField.text = filter.merchant
        }
    }
    
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
        
        // Left Button
        let resetButton = UIButton.init(type: .custom)
        let heightConstraintResetButton = NSLayoutConstraint(item: resetButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        let widthConstraintResetButton = NSLayoutConstraint(item: resetButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy:  NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 30)
        resetButton.addConstraints([heightConstraintResetButton, widthConstraintResetButton])
        resetButton.setImage(Image.ResetFilter, for: UIControl.State.normal)
        resetButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        resetButton.addTarget(self, action: #selector(resetFilter), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: resetButton)
        
        
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.barTintColor = Color.White
            navigationBar.titleTextAttributes = [.foregroundColor: Color.MainRed, .font : Font.BasicNavigationTitle]
        }
    }
    
    @objc func resetFilter() {
        self.filter = Filter(typeOfTransaction: .all, incomingType: nil, outgoingType: nil, outgoingUnderType: nil, postingDate: nil, ammount: nil, signForAmount: nil, signForDate: nil, merchant: nil, name: nil)
        setFilterScreen()
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
                //typeOfUnderOutgoingTransactionStackView.isHidden = false
                return keys.count
            } else {
                //typeOfUnderOutgoingTransactionStackView.isHidden = true
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
