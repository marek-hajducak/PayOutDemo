//
//  BaseWidgetTableViewCell.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 19/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

enum TypeOfWidget: String {
    case cards = "Credit & Debit Cards"
    case loans = "Loans"
    case branches = "Branches & ATMs"
    case exangeRates = "Exchange Rates"
    case spendingreport = "Spending Report"
    case assets = "Assets & Liabilities"
    case funds = "Mutual funds"
    case pension = "DDS pension"
    case goals = "Goals"
}

class BaseWidgetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameOfWidgetLabel: UILabel!
    @IBOutlet weak var widgetView: UIView!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var iconOfWidgetImageView: UIImageView!
    @IBOutlet weak var backgroundViewOfWidget: UIView!
    @IBOutlet weak var dataWidgetTableView: UITableView! {
        didSet {
            
            let creditCardsCellNib = UINib(nibName: CreditCardsTableViewCell.nameOfClass, bundle: nil)
            let loansCellNib = UINib(nibName: LoansTableViewCell.nameOfClass, bundle: nil)
            let branchesAndAtmsCellNib = UINib(nibName: BranchesAndAtmsTableViewCell.nameOfClass, bundle: nil)
            let exchangeRatesCellNib = UINib(nibName: ExchangeRatesTableViewCell.nameOfClass, bundle: nil)
            let spendingReportCellNib = UINib(nibName: SpendingReportTableViewCell.nameOfClass, bundle: nil)
            let asstetsAndLiabilitiesCellNib = UINib(nibName: AssetsAndLiabilitiesTableViewCell.nameOfClass, bundle: nil)
            let mutalFundsCellNib = UINib(nibName: MutalFundsTableViewCell.nameOfClass, bundle: nil)
            let pensionsCellNib = UINib(nibName: PensionsTableViewCell.nameOfClass, bundle: nil)
            let goalsCellNib = UINib(nibName: GoalsTableViewCell.nameOfClass, bundle: nil)
            
            dataWidgetTableView.register(creditCardsCellNib, forCellReuseIdentifier: CreditCardsTableViewCell.nameOfClass)
            dataWidgetTableView.register(loansCellNib, forCellReuseIdentifier: LoansTableViewCell.nameOfClass)
            dataWidgetTableView.register(branchesAndAtmsCellNib, forCellReuseIdentifier: BranchesAndAtmsTableViewCell.nameOfClass)
            dataWidgetTableView.register(exchangeRatesCellNib, forCellReuseIdentifier: ExchangeRatesTableViewCell.nameOfClass)
            dataWidgetTableView.register(spendingReportCellNib, forCellReuseIdentifier: SpendingReportTableViewCell.nameOfClass)
            dataWidgetTableView.register(asstetsAndLiabilitiesCellNib, forCellReuseIdentifier: AssetsAndLiabilitiesTableViewCell.nameOfClass)
            dataWidgetTableView.register(mutalFundsCellNib, forCellReuseIdentifier: MutalFundsTableViewCell.nameOfClass)
            dataWidgetTableView.register(pensionsCellNib, forCellReuseIdentifier: PensionsTableViewCell.nameOfClass)
            dataWidgetTableView.register(goalsCellNib, forCellReuseIdentifier: GoalsTableViewCell.nameOfClass)
            dataWidgetTableView.separatorStyle = .none
        }
    }
    @IBOutlet weak var heightOfWidgetTableViewConstraint: NSLayoutConstraint!
    
    var transactions: [Transaction] = [] {
        didSet {
            dataWidgetTableView.reloadData()
        }
    }
    /// Informations from Cell //
    var heightForRow: CGFloat = 0
    var typeOfWidgetTableViewCell: TypeOfWidget?
    var dataSetForWidget: Account? {
        didSet {
            dataWidgetTableView.reloadData()
        }
    }
    /// Informations from Cell //
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.size.width = UIScreen.main.bounds.width - 30
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        nameOfWidgetLabel.textColor = Color.MainColor
        // All atributes to one atributes and set on layers
        nameOfWidgetLabel.dropLabelShadow(color: Color.DarkGrey.cgColor, radius: 2.5, opacity: 0.6, offsetWidth: 2, offsetHeigt: 2, maskToBounds: false)
        separatorView.layer.cornerRadius = 10
        backgroundViewOfWidget.layer.backgroundColor = Color.White.cgColor
        backgroundViewOfWidget.layer.cornerRadius = 10
        backgroundViewOfWidget.dropViewShadow(color: Color.DarkGrey.cgColor, radius: 6.0, opacity: 0.4, offsetWidth: 8, offsetHeigt: 8, maskToBounds: false)
        widgetView.layer.cornerRadius = 9
        layer.cornerRadius = 10
        
        dataWidgetTableView.delegate = self
        dataWidgetTableView.dataSource = self
        dataWidgetTableView.reloadData()
    }
    
    
}

extension BaseWidgetTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let type = typeOfWidgetTableViewCell else {
            return 0.0
        }
        return type.getHeightForRow()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let type = typeOfWidgetTableViewCell, let account = dataSetForWidget else {
            return 0
        }
        
        return type.getNumberOfRows(account: account)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        guard let type = typeOfWidgetTableViewCell, let account = dataSetForWidget else {
            return cell
        }
        
        let currency: String = account.currency
        // Cells:
        switch type {
        case .cards:
            let cell = dataWidgetTableView.dequeueReusableCell(withIdentifier: CreditCardsTableViewCell.nameOfClass, for: indexPath) as! CreditCardsTableViewCell
            cell.cardNameLabel.text = account.cards[indexPath.item].cardName
            cell.cardNumberLabel.text = account.cards[indexPath.item].cardNumber
            cell.creditTypeLabel.text = "type: \(account.cards[indexPath.item].type)"
            cell.validDateLabel.text = "valid: \(account.cards[indexPath.item].validDate)"
            return cell
        case .loans:
            let cell = dataWidgetTableView.dequeueReusableCell(withIdentifier: LoansTableViewCell.nameOfClass, for: indexPath) as! LoansTableViewCell
            cell.nameOfLoanLabel.text = account.loans[indexPath.item].name
            //FIXME: Count me!
            cell.loanProgresView.progress = 0.0134
            cell.loanAmountLabel.text = "Loan amount:  \(account.loans[indexPath.item].amount) \(currency)"
            cell.currentAmountLeanLabel.text =  "\(account.loans[indexPath.item].amoutOfPayment) \(currency)"
            cell.typeOfLoanLabel.text = account.loans[indexPath.item].type
            return cell
        case .branches:
            let cell = dataWidgetTableView.dequeueReusableCell(withIdentifier: BranchesAndAtmsTableViewCell.nameOfClass, for: indexPath) as! BranchesAndAtmsTableViewCell
            if indexPath.item < account.branches.count {
                cell.addressLabel.text = account.branches[indexPath.item].address
                cell.distanceLabel.text = "\(account.branches[indexPath.item].distance) m"
                cell.branchOrATMSTitleLabel.text = "Branch"
            } else {
                cell.addressLabel.text = account.atms[indexPath.item - account.branches.count].address
                cell.distanceLabel.text = "\(account.atms[indexPath.item - account.branches.count].distance) m"
                cell.branchOrATMSTitleLabel.text = "ATM"
            }
            return cell
        case .exangeRates:
            let cell = dataWidgetTableView.dequeueReusableCell(withIdentifier: ExchangeRatesTableViewCell.nameOfClass, for: indexPath) as! ExchangeRatesTableViewCell
            let currencyString = account.exchangeRates[indexPath.item].currency
            cell.currency = Currency(rawValue: currencyString)
            cell.rateLabel.text = account.exchangeRates[indexPath.item].buyAmount
            cell.stateNameLabel.text = account.exchangeRates[indexPath.item].country
            return cell
        case .spendingreport:
            let cell = dataWidgetTableView.dequeueReusableCell(withIdentifier: SpendingReportTableViewCell.nameOfClass, for: indexPath) as! SpendingReportTableViewCell
            cell.spendingReportView.transactions = transactions
            return cell
        case .assets:
            let cell = dataWidgetTableView.dequeueReusableCell(withIdentifier: AssetsAndLiabilitiesTableViewCell.nameOfClass, for: indexPath) as! AssetsAndLiabilitiesTableViewCell
            cell.assetsBalanceLabel.text = "\(account.assetsAndLiabilities[indexPath.item].assetsBalance) \(currency)"
            cell.liabilitiesBalanceLabel.text = "\(account.assetsAndLiabilities[indexPath.item].liabilitiesBalance) \(currency)"
            // FIXME: Count dufference and progress view percentage
            cell.differentLabel.text = "Difference: 18 099,00 \(currency)"
            cell.assetsProgressView.progress = 0.753
            cell.liabilitiesProgressView.progress = 0.247
            ////
            return cell
        case .funds:
            let cell = dataWidgetTableView.dequeueReusableCell(withIdentifier: MutalFundsTableViewCell.nameOfClass, for: indexPath) as! MutalFundsTableViewCell
            cell.accountNamberLabel.text = account.mutalFunds[indexPath.item].accountNumber
            cell.actualBalanceLabel.text = "\(account.mutalFunds[indexPath.item].actualBalance) \(currency)"
            cell.funds = account.mutalFunds[indexPath.item].funds
            return cell
        case .pension:
            let cell = dataWidgetTableView.dequeueReusableCell(withIdentifier: PensionsTableViewCell.nameOfClass, for: indexPath) as! PensionsTableViewCell
            cell.savedAmountLabel.text = "\(account.pensions[indexPath.item].savedAmount) \(currency)"
            cell.pension = account.pensions[indexPath.item]
            return cell
        case .goals:
            let cell = dataWidgetTableView.dequeueReusableCell(withIdentifier: GoalsTableViewCell.nameOfClass, for: indexPath) as! GoalsTableViewCell
            cell.currentSavingAmounLabel.text = "\(account.goals[indexPath.item].currentSaving) \(currency)"
            cell.typeOfGoalLabel.text = account.goals[indexPath.item].type
            cell.amountProgresView.progress = 0.75
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataWidgetTableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension TypeOfWidget {
    
    func getHeightForRow() -> CGFloat {
        switch self {
        case .cards:
            return 74
        case .loans:
            return 60
        case .branches:
            return 40
        case .exangeRates:
            return 34
        case .spendingreport:
            return 365
        case .assets:
            return 120
        case .funds:
            return 65
        case .pension:
            return 24
        case .goals:
            return 55
        }
    }
    
    func getNumberOfRows(account: Account) -> Int {
        switch self {
        case .cards:
            if (account.cards.count == 1) && (account.cards[0].id == 0)
            {return 0}
            return account.cards.count
        case .loans:
            if (account.loans.count == 1) && (account.loans[0].id == 0)
            {return 0}
            return account.loans.count
        case .branches:
            if ((account.branches.count == 1) && (account.branches[0].id == 0)) || (account.atms.count == 1) && (account.atms[0].id == 0)
            {return 0}
            return account.atms.count + account.branches.count
        case .exangeRates:
            if (account.exchangeRates.count == 1) && (account.exchangeRates[0].id == 0)
            {return 0}
            return account.exchangeRates.count
        case .spendingreport:
            //TODO: Chnage 1 to show spending report
            return 0
        case .assets:
            if (account.assetsAndLiabilities.count == 1) && (account.assetsAndLiabilities[0].id == 0)
            {return 0}
            return account.assetsAndLiabilities.count
        case .funds:
            if (account.mutalFunds.count == 1) && (account.mutalFunds[0].id == 0)
            {return 0}
            return account.mutalFunds.count
        case .pension:
            if (account.pensions.count == 1) && (account.pensions[0].id == 0)
            {return 0}
            return account.pensions.count
        case .goals:
            if (account.goals.count == 1) && (account.goals[0].id == 0)
            {return 0}
            return account.goals.count
        }
    }
}

