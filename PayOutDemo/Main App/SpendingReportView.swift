//
//  SpendingReportView.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 27/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class SpendingReportView: BasicReportView {
    
    // Properties //
    var outgoingTransactionsShapeLayer = CAShapeLayer()
    var outgoingTransportShapeLayer = CAShapeLayer()
    var outgoingBuyingShapeLayer = CAShapeLayer()
    var outgoingFunnShapeLayer = CAShapeLayer()
    var outgoingTravelingShapeLayer = CAShapeLayer()
    var outgoingEatAndDrinkShapeLayer = CAShapeLayer()
    var outgoingRentalsAndServicesShapeLayer = CAShapeLayer()
    var outgoingFriendsAndLoveShapeLayer = CAShapeLayer()
    var outgoingHealthShapeLayer = CAShapeLayer()
    var outgoingGiftsShapeLayer = CAShapeLayer()
    var outgoingFamilyShapeLayer = CAShapeLayer()
    var outgoingEducationShapeLayer = CAShapeLayer()
    var outgoingInvestmentsShapeLayer = CAShapeLayer()
    var outgoingBussinesShapeLayer = CAShapeLayer()
    var outgoingInsuranceShapeLayer = CAShapeLayer()
    var outgoingFeesShapeLayer = CAShapeLayer()
    var outgoingOthersShapeLayer = CAShapeLayer()
    var incomingTransactionsShapeLayer = CAShapeLayer()
    var incomingPaysShapeLayer = CAShapeLayer()
    var incomingSellLayer = CAShapeLayer()
    var incomingRewardsShapeLayer = CAShapeLayer()
    var incomingInterestMoneyShapeLayer = CAShapeLayer()
    var incomingGiftsShapeLayer = CAShapeLayer()
    var incomingOthersShapeLayer = CAShapeLayer()
    
    let incomingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Income", for: .normal)
        button.setTitleColor(Color.IncomingLightGreen, for: .normal)
        button.setImage(Image.IncomingImage, for: .normal)
        button.addTarget(self, action: #selector(hitIncoming), for: .touchUpInside)
        return button
    }()
    let payButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pay", for: .normal)
        button.setTitleColor(Color.Pay, for: .normal)
        button.setImage(Image.Pay, for: .normal)
        return button
    }()
    let sellButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sell", for: .normal)
        button.setTitleColor(Color.Sell, for: .normal)
        button.setImage(Image.Sell, for: .normal)
        return button
    }()
    let rewardsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Rewards", for: .normal)
        button.setTitleColor(Color.Rewards, for: .normal)
        button.setImage(Image.Rewards, for: .normal)
        return button
    }()
    let interestMoneyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Int. Money", for: .normal)
        button.setTitleColor(Color.InterestMoney, for: .normal)
        button.setImage(Image.InterestMoney, for: .normal)
        return button
    }()
    let giftsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Gifts", for: .normal)
        button.setTitleColor(Color.GiftMoney, for: .normal)
        button.setImage(Image.GiftMoney, for: .normal)
        return button
    }()
    let otherButton: UIButton = {
        let button = UIButton()
        button.setTitle("Others", for: .normal)
        button.setTitleColor(Color.Others, for: .normal)
        button.setImage(Image.Others, for: .normal)
        return button
    }()
    let outgoingButton: UIButton = {
            let button = UIButton()
            button.setTitle("Outcome", for: .normal)
            button.setTitleColor(Color.OutcomingLightRed, for: .normal)
            button.setImage(Image.OutgoingImage, for: .normal)
            button.addTarget(self, action: #selector(hitOutgoing), for: .touchUpInside)
            return button
    }()
    let transportButton: UIButton = {
        let button = UIButton()
        button.setTitle("Transport", for: .normal)
        button.setTitleColor(Color.Transport, for: .normal)
        button.setImage(Image.Transport, for: .normal)
        return button
    }()
    let buyingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buying", for: .normal)
        button.setTitleColor(Color.Buying, for: .normal)
        button.setImage(Image.Buying, for: .normal)
        return button
    }()
    let funnButton: UIButton = {
        let button = UIButton()
        button.setTitle("Funn", for: .normal)
        button.setTitleColor(Color.Funn, for: .normal)
        button.setImage(Image.Funn, for: .normal)
        return button
    }()
    let travelingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Traveling", for: .normal)
        button.setTitleColor(Color.Traveling, for: .normal)
        button.setImage(Image.Traveling, for: .normal)
        return button
    }()
    let eatAndDrinkButton: UIButton = {
        let button = UIButton()
        button.setTitle("Eat & Drink", for: .normal)
        button.setTitleColor(Color.EatAndDrink, for: .normal)
        button.setImage(Image.EatAndDrink, for: .normal)
        return button
    }()
    let rentalsAndServicesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Rents", for: .normal)
        button.setTitleColor(Color.RentalsAndServices, for: .normal)
        button.setImage(Image.RentalsAndServices, for: .normal)
        return button
    }()
    let friendsAndLoveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Love", for: .normal)
        button.setTitleColor(Color.FriendsAndLove, for: .normal)
        button.setImage(Image.FriendsAndLove, for: .normal)
        return button
    }()
    let healthButton: UIButton = {
        let button = UIButton()
        button.setTitle("Health", for: .normal)
        button.setTitleColor(Color.Health, for: .normal)
        button.setImage(Image.Health, for: .normal)
        return button
    }()
    let giftsOutgoingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Gifts", for: .normal)
        button.setTitleColor(Color.BuyGift, for: .normal)
        button.setImage(Image.BuyGift, for: .normal)
        return button
    }()
    let familyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Family", for: .normal)
        button.setTitleColor(Color.Family, for: .normal)
        button.setImage(Image.Family, for: .normal)
        return button
    }()
    let educationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Education", for: .normal)
        button.setTitleColor(Color.Education, for: .normal)
        button.setImage(Image.Education, for: .normal)
        return button
    }()
    let investmentsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Invest", for: .normal)
        button.setTitleColor(Color.Investments, for: .normal)
        button.setImage(Image.Investments, for: .normal)
        return button
    }()
    let bussinesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Bussines", for: .normal)
        button.setTitleColor(Color.Bussines, for: .normal)
        button.setImage(Image.Bussines, for: .normal)
        return button
    }()
    let insuranceButton: UIButton = {
        let button = UIButton()
        button.setTitle("Insurance", for: .normal)
        button.setTitleColor(Color.Insurance, for: .normal)
        button.setImage(Image.Insurance, for: .normal)
        return button
    }()
    let feesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Fees", for: .normal)
        button.setTitleColor(Color.Fees, for: .normal)
        button.setImage(Image.Fees, for: .normal)
        return button
    }()
    let othersButton: UIButton = {
        let button = UIButton()
        button.setTitle("Others", for: .normal)
        button.setTitleColor(Color.Others, for: .normal)
        button.setImage(Image.Others, for: .normal)
        return button
    }()
    
    var currency: Currency?
    var incomingTransactions: [Transaction] = []
    var outgoingTransactions: [Transaction] = []
    
    var transactions: [Transaction] = [] {
        didSet {
            startReportView(back: false)
        }
    }
    
    private func startReportView(back: Bool) {
        self.outgoingTransactions = transactions.filter({$0.type == 2})
        self.incomingTransactions = transactions.filter({$0.type == 1})
        createBasicGraph(back: back)
        addAnimationForBasicGraph()
        showBasicPercentageLabel(back: back)
        showBasicLegend()
    }
    
    let percentageLabelForIncomingTypesGraph: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Font.BasicPercentageLabelTitle
        label.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        return label
    }()
    
    let percentageLabelForOutgoingTypesGraph: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Font.BasicPercentageLabelTitle
        label.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        return label
    }()
    
    var percentageLabels: [UILabel] = []
    var buttonsOfBasicGraph: [UIButton] = []
    var incomingTypeButons: [UIButton] = []
    var outgoingTypeButons: [UIButton] = []
    var allShapeLayers: [CAShapeLayer] = []
    var incomingShapeLayers: [CAShapeLayer] = []
    var outgoingShapeLayers: [CAShapeLayer] = []
    var basicTypesLayers: [CAShapeLayer] = []
    
    // Funkcions //
    override func awakeFromNib() {
        super.awakeFromNib()
        self.basicTypesLayers = [outgoingTransactionsShapeLayer, incomingTransactionsShapeLayer]
        self.percentageLabels = [percentageLabelOfBasedGraph, percentageLabelForOutgoingTypesGraph, percentageLabelForIncomingTypesGraph]
        self.allShapeLayers = [outgoingTransactionsShapeLayer, outgoingTransportShapeLayer, outgoingBuyingShapeLayer, outgoingFunnShapeLayer, outgoingTravelingShapeLayer, outgoingEatAndDrinkShapeLayer, outgoingRentalsAndServicesShapeLayer, outgoingFriendsAndLoveShapeLayer, outgoingHealthShapeLayer, outgoingGiftsShapeLayer, outgoingFamilyShapeLayer, outgoingEducationShapeLayer, outgoingInvestmentsShapeLayer, outgoingBussinesShapeLayer, outgoingInsuranceShapeLayer, outgoingFeesShapeLayer, outgoingOthersShapeLayer, incomingTransactionsShapeLayer, incomingPaysShapeLayer, incomingSellLayer, incomingRewardsShapeLayer, incomingInterestMoneyShapeLayer, incomingGiftsShapeLayer, incomingOthersShapeLayer]
        self.incomingShapeLayers = [incomingPaysShapeLayer, incomingSellLayer, incomingRewardsShapeLayer, incomingInterestMoneyShapeLayer, incomingGiftsShapeLayer, incomingOthersShapeLayer]
        outgoingShapeLayers = [outgoingTransportShapeLayer, outgoingBuyingShapeLayer, outgoingFunnShapeLayer, outgoingTravelingShapeLayer, outgoingEatAndDrinkShapeLayer, outgoingRentalsAndServicesShapeLayer, outgoingFriendsAndLoveShapeLayer, outgoingHealthShapeLayer, outgoingGiftsShapeLayer, outgoingFamilyShapeLayer, outgoingEducationShapeLayer, outgoingInvestmentsShapeLayer, outgoingBussinesShapeLayer, outgoingInsuranceShapeLayer, outgoingFeesShapeLayer, outgoingOthersShapeLayer]
        for layer in allShapeLayers {
            layer.isHidden = true
        }
        self.outgoingTypeButons = [transportButton, buyingButton, funnButton, travelingButton, eatAndDrinkButton, rentalsAndServicesButton, friendsAndLoveButton, healthButton, giftsOutgoingButton, familyButton, educationButton, investmentsButton, bussinesButton, insuranceButton, feesButton, othersButton]
        
        for button in outgoingTypeButons {
            button.backgroundColor = UIColor.clear
            button.widthAnchor.constraint(equalToConstant: frame.width/3).isActive = true
            button.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.font = Font.BasicUnderTypeOfTransactionButon
            button.imageView?.contentMode = .scaleAspectFit
            button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        self.incomingTypeButons = [payButton, sellButton, rewardsButton, interestMoneyButton, giftsButton, otherButton]
        for button in incomingTypeButons {
            button.backgroundColor = UIColor.clear
            button.widthAnchor.constraint(equalToConstant: frame.width/3).isActive = true
            button.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.font = Font.BasicUnderTypeOfTransactionButon
            button.imageView?.contentMode = .scaleAspectFit
            button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        self.buttonsOfBasicGraph = [incomingButton, outgoingButton]
        for button in buttonsOfBasicGraph {
            button.backgroundColor = UIColor.clear
            button.widthAnchor.constraint(equalToConstant: frame.width/3).isActive = true
            button.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
            button.titleLabel?.font = Font.BasicTypeOfTransactionButon
            button.titleLabel?.textAlignment = .center
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        }
        trackLayer.isHidden = true
        percentageLabelOfBasedGraph.isHidden = true
        percentageLabelForIncomingTypesGraph.isHidden = true
    }
    
    func swipeUp() {
        for layer in allShapeLayers {
            layer.isHidden = true
        }
        trackLayer.isHidden = true
        for label in percentageLabels {
            label.isHidden = true
        }
        legendStackView.isHidden = true
        for item in legendStackView.subviews {
            legendStackView.removeArrangedSubview(item)
        }
        backButton.isHidden = true
    }
    
    @objc func hitIncoming () {
        incomingGraph()
        addAnimationForIncomingTypes()
    }
    
    @objc func hitOutgoing () {
        outgoingGraph()
        addAnimationForOutgoingTypes()
    }
    
    @objc override func hitBack() {
        super.hitBack()
        swipeUp()
        backButton.isHidden = true
        startReportView(back: true)
    }
    
    /// Basic Graph:
    override func createBasicGraph(back : Bool) {
        super.createBasicGraph(back: back)
        incomingButton.isEnabled = !transactions.isEmpty
        outgoingButton.isEnabled = !transactions.isEmpty
        incomingTransactionsShapeLayer.isHidden = false
        outgoingTransactionsShapeLayer.isHidden = false
        var fullamount: Double = 0
        var outgoingAmount: Double = 0
        var incomingAmount: Double = 0
        for transaction in incomingTransactions {
            incomingAmount += transaction.amount
            fullamount += transaction.amount
        }
        for transaction in outgoingTransactions {
            outgoingAmount += transaction.amount
            fullamount += transaction.amount
        }
        setPercentageLabel(outgoingAmount: outgoingAmount, incomingAmount: incomingAmount)
        let percentageOfOugoing = (outgoingAmount/fullamount).rounded(toPlaces: 2)
        let percentageOfIncoming = (incomingAmount/fullamount).rounded(toPlaces: 2)
        let degreesOutgoing = percentageOfOugoing * 360
        let degreesIncoming = percentageOfIncoming * 360
        var backOffset: CGFloat = 0
        back ? (backOffset = 85) : (backOffset = 0)
        let centerPoint = CGPoint(x: center.x - grafXOffset, y: center.y - backOffset + grafYOffset)
        let startOfOutgoing = -CGFloat.pi / 2
        let endOfOutgoing = CGFloat(degreesOutgoing) * CGFloat.pi/180 + startOfOutgoing
        let circularPathForOutgoing = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: startOfOutgoing, endAngle: endOfOutgoing, clockwise: true)
        outgoingTransactionsShapeLayer.path = circularPathForOutgoing.cgPath
        outgoingTransactionsShapeLayer.strokeColor = Color.OutcomingLightRed.cgColor
        
        let endOfIncoming = CGFloat(degreesIncoming) * CGFloat.pi/180 + endOfOutgoing
        let circularPathForIncoming = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfOutgoing, endAngle: endOfIncoming, clockwise: true)
        incomingTransactionsShapeLayer.path = circularPathForIncoming.cgPath
        incomingTransactionsShapeLayer.strokeColor = Color.IncomingLightGreen.cgColor
        
        for basicLayer in basicTypesLayers {
            basicLayer.lineWidth = widthOfGraphPath
            basicLayer.fillColor = UIColor.clear.cgColor
            basicLayer.strokeEnd = 0
            layer.addSublayer(basicLayer)
        }
    }
    
    override func showBasicPercentageLabel(back: Bool) {
        super.showBasicPercentageLabel(back: back)
        percentageLabelForIncomingTypesGraph.isHidden = true
        percentageLabelForOutgoingTypesGraph.isHidden = true
        var backOffset: CGFloat = 0
        back ? (backOffset = 85) : (backOffset = 0)
        percentageLabelOfBasedGraph.center = CGPoint(x: center.x - grafXOffset , y: center.y - backOffset + grafYOffset)
    }
    
    override func showBasicLegend() {
        super.showBasicLegend()
        for button in incomingTypeButons {
            button.isHidden = true
        }
        for button in outgoingTypeButons {
            button.isHidden = true
        }
        for button in buttonsOfBasicGraph {
            button.isHidden = false
            legendStackView.addArrangedSubview(button)
        }
    }
    
    override func addAnimationForBasicGraph() {
        super.addAnimationForBasicGraph()
        outgoingTransactionsShapeLayer.add(basicAnimation, forKey: "outgoingBasic")
        incomingTransactionsShapeLayer.add(basicAnimation, forKey: "incomingBasic")
    }
    
    private func setPercentageLabel(outgoingAmount: Double, incomingAmount: Double) {
        if let currency = currency {
            let attributetIncomingString = NSMutableAttributedString(string: "- \(outgoingAmount.rounded(toPlaces: 2)) \(currency.getCurrencySymbol())", attributes: [NSAttributedString.Key.foregroundColor: Color.OutcomingLightRed,
                                                                                                                                                                      NSAttributedString.Key.font: Font.BasicTypeOfTransactionButon])
            let attributeOutgoingString = NSAttributedString(string: "\n+ \(incomingAmount.rounded(toPlaces: 2) )\(currency.getCurrencySymbol())", attributes: [NSAttributedString.Key.foregroundColor : Color.IncomingLightGreen,
                                                                                                                                                                NSAttributedString.Key.font: Font.BasicTypeOfTransactionButon])
            attributetIncomingString.append(attributeOutgoingString)
            percentageLabelOfBasedGraph.attributedText = attributetIncomingString
            percentageLabelOfBasedGraph.numberOfLines = 2
        }
    }

    /// Outgoing graph:
    func showPercentageLabelForOutgoingTypes(transportPercentage: Double, buyingPercentage: Double, funnPercentage: Double, travelingPercentage: Double, eatanddrinkPercentage: Double, rentalAndServicePercentage: Double, friendandlovePercentage: Double, healthPercentage: Double, giftsPercentage: Double, familyPercentage: Double, educationPercentage: Double, investmentsPercentage: Double, bussinesPercentage: Double, insurancePercentage: Double, feesPercentage: Double, othersPercentage: Double) {
        percentageLabelOfBasedGraph.isHidden = true
        percentageLabelForIncomingTypesGraph.isHidden = true
        percentageLabelForOutgoingTypesGraph.isHidden = false
        percentageLabelForOutgoingTypesGraph.numberOfLines = 16
        percentageLabelForOutgoingTypesGraph.center = CGPoint(x: center.x - grafXOffset , y: center.y - 10)
        let attributetAllString = NSMutableAttributedString(string: "")
        // All strings percentages :
        // .transport
        if transportPercentage != 0.0 {
            let attributetString = NSMutableAttributedString(string: "\(transportPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.Transport, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
            attributetAllString.append(attributetString)
        }
        // .buyins
        if buyingPercentage != 0.0 {
            let attributetString = NSMutableAttributedString(string: "\n\(buyingPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.Buying, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
            attributetAllString.append(attributetString)
        }
        // .funn
        if funnPercentage != 0.0 {
            let attributetString = NSMutableAttributedString(string: "\n\(funnPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.Funn, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
            attributetAllString.append(attributetString)
        }
        // .traveling
        if travelingPercentage != 0.0 {
            let attributetString = NSMutableAttributedString(string: "\n\(travelingPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.Traveling, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
            attributetAllString.append(attributetString)
        }
        // .eatAndDrink
        if eatanddrinkPercentage != 0.0 {
            let attributetString = NSMutableAttributedString(string: "\n\(eatanddrinkPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.EatAndDrink, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
            attributetAllString.append(attributetString)
        }
        // .rentalsAndServices
        if rentalAndServicePercentage != 0.0 {
            let attributetString = NSMutableAttributedString(string: "\n\(rentalAndServicePercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.RentalsAndServices, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
            attributetAllString.append(attributetString)
        }
        // .friendsAndLove
        if friendandlovePercentage != 0.0 {
            let attributetString = NSMutableAttributedString(string: "\n\(friendandlovePercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.RentalsAndServices, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
            attributetAllString.append(attributetString)
        }
        // .healt
        if healthPercentage != 0.0 {
            let attributetString = NSMutableAttributedString(string: "\n\(healthPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.Health, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
            attributetAllString.append(attributetString)
        }
        // .gifts
        if giftsPercentage != 0.0 {
            let attributetString = NSMutableAttributedString(string: "\n\(giftsPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.BuyGift, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
            attributetAllString.append(attributetString)
        }
        // .family
        if familyPercentage != 0.0 {
            let attributetString = NSMutableAttributedString(string: "\n\(familyPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.Family, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
            attributetAllString.append(attributetString)
        }
        // .education
        if educationPercentage != 0.0 {
            let attributetString = NSMutableAttributedString(string: "\n\(educationPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.Education, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
            attributetAllString.append(attributetString)
        }
        // .investments
        if investmentsPercentage != 0.0 {
            let attributetString = NSMutableAttributedString(string: "\n\(investmentsPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.Investments, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
            attributetAllString.append(attributetString)
        }
        // .bussines
        if bussinesPercentage != 0.0 {
            let attributetString = NSMutableAttributedString(string: "\n\(bussinesPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.Bussines, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
            attributetAllString.append(attributetString)
        }
        
        // .insurance
        if insurancePercentage != 0.0 {
            let attributetString = NSMutableAttributedString(string: "\n\(insurancePercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.Insurance, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
            attributetAllString.append(attributetString)
        }
        // .fees
        if feesPercentage != 0.0 {
            let attributetString = NSMutableAttributedString(string: "\n\(feesPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.Fees, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
            attributetAllString.append(attributetString)
        }
        // .others
        if othersPercentage != 0.0 {
            let attributetString = NSMutableAttributedString(string: "\n\(othersPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.Others, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
            attributetAllString.append(attributetString)
        }
        percentageLabelForOutgoingTypesGraph.attributedText = attributetAllString
        addSubview(percentageLabelForOutgoingTypesGraph)
    }
    
    func updateLegendToOutgoingTypes(transportPercentage: Double, buyingPercentage: Double, funnPercentage: Double, travelingPercentage: Double, eatanddrinkPercentage: Double, rentalAndServicePercentage: Double, friendandlovePercentage: Double, healthPercentage: Double, giftsPercentage: Double, familyPercentage: Double, educationPercentage: Double, investmentsPercentage: Double, bussinesPercentage: Double, insurancePercentage: Double, feesPercentage: Double, othersPercentage: Double) {
        outgoingButton.isHidden = true
        incomingButton.isHidden = true
        transportButton.isHidden = transportPercentage == 0
        buyingButton.isHidden = buyingPercentage == 0
        funnButton.isHidden = funnPercentage == 0
        travelingButton.isHidden = travelingPercentage == 0
        eatAndDrinkButton.isHidden = eatanddrinkPercentage == 0
        rentalsAndServicesButton.isHidden = rentalAndServicePercentage == 0
        friendsAndLoveButton.isHidden = friendandlovePercentage == 0
        healthButton.isHidden = healthPercentage == 0
        giftsButton.isHidden = giftsPercentage == 0
        familyButton.isHidden = familyPercentage == 0
        educationButton.isHidden = educationPercentage == 0
        investmentsButton.isHidden = investmentsPercentage == 0
        bussinesButton.isHidden = bussinesPercentage == 0
        insuranceButton.isHidden = insurancePercentage == 0
        feesButton.isHidden = feesPercentage == 0
        othersButton.isHidden = othersPercentage  == 0
        for subview in legendStackView.subviews {
            legendStackView.removeArrangedSubview(subview)
        }
        legendStackView.isHidden = false
        
        if transportPercentage != 0.0 {
            legendStackView.addArrangedSubview(transportButton)
        }
        if buyingPercentage != 0.0 {
            legendStackView.addArrangedSubview(buyingButton)
        }
        if funnPercentage != 0.0 {
            legendStackView.addArrangedSubview(funnButton)
        }
        if travelingPercentage != 0.0 {
            legendStackView.addArrangedSubview(travelingButton)
        }
        if eatanddrinkPercentage != 0.0 {
            legendStackView.addArrangedSubview(eatAndDrinkButton)
        }
        if rentalAndServicePercentage != 0.0 {
            legendStackView.addArrangedSubview(rentalsAndServicesButton)
        }
        if friendandlovePercentage != 0.0 {
            legendStackView.addArrangedSubview(friendsAndLoveButton)
        }
        if healthPercentage != 0.0 {
            legendStackView.addArrangedSubview(healthButton)
        }
        if giftsPercentage != 0.0 {
            legendStackView.addArrangedSubview(giftsButton)
        }
        if familyPercentage != 0.0 {
            legendStackView.addArrangedSubview(familyButton)
        }
        if educationPercentage != 0.0 {
            legendStackView.addArrangedSubview(educationButton)
        }
        if investmentsPercentage != 0.0 {
            legendStackView.addArrangedSubview(investmentsButton)
        }
        if bussinesPercentage != 0.0 {
            legendStackView.addArrangedSubview(bussinesButton)
        }
        if insurancePercentage != 0.0 {
            legendStackView.addArrangedSubview(insuranceButton)
        }
        if feesPercentage != 0.0 {
            legendStackView.addArrangedSubview(feesButton)
        }
        if othersPercentage != 0.0 {
            legendStackView.addArrangedSubview(othersButton)
        }
    }
    
    func outgoingGraph() {
        percentageLabelOfBasedGraph.isHidden = true
        incomingTransactionsShapeLayer.isHidden = true
        outgoingTransactionsShapeLayer.isHidden = true
        trackLayer.isHidden = false
        // Outgoing Types :
        let centerPoint = CGPoint(x: center.x - grafXOffset, y: center.y - 10)
        var fullamountOutgoingType: Double = 0.0
        var ougoingTrasportTypeAmount: Double = 0.0
        var ougoingBuingTypeAmount: Double = 0.0
        var ougoingFunnTypeAmount: Double = 0.0
        var ougoingTravelingTypeAmount: Double = 0.0
        var ougoingEatAndDrinkTypeAmount: Double = 0.0
        var ougoingRentalsAndServicesTypeAMount: Double = 0.0
        var ougoingFALTypeAmount: Double = 0.0
        var ougoingHealthTypeAmount: Double = 0.0
        var ougoingGiftsTypeAmount: Double = 0.0
        var ougoingFamilyTypeAmount: Double = 0.0
        var ougoingEducationTypeAmount: Double = 0.0
        var ougoingInvestmentsTypeAmount: Double = 0.0
        var ougoingBussinesTypeAmount: Double = 0.0
        var ougoingInsuranceTypeAmount: Double = 0.0
        var ougoingFeesTypeAmount: Double = 0.0
        var ougoingOthersTypeAmount: Double = 0.0
        for transaction in outgoingTransactions {
            if transaction.outgoingType == TransactionType.OutgoingtransactionTypes.transport.getString() {
                ougoingTrasportTypeAmount += transaction.amount
            }
            if transaction.outgoingType == TransactionType.OutgoingtransactionTypes.buying.getString() {
                ougoingBuingTypeAmount += transaction.amount
            }
            if transaction.outgoingType == TransactionType.OutgoingtransactionTypes.funn.getString() {
                ougoingFunnTypeAmount += transaction.amount
            }
            if transaction.outgoingType == TransactionType.OutgoingtransactionTypes.traveling.getString() {
                ougoingTravelingTypeAmount += transaction.amount
            }
            if transaction.outgoingType == TransactionType.OutgoingtransactionTypes.eatAndDrink.getString() {
                ougoingEatAndDrinkTypeAmount += transaction.amount
            }
            if transaction.outgoingType == TransactionType.OutgoingtransactionTypes.rentalsAndServices.getString() {
                ougoingRentalsAndServicesTypeAMount += transaction.amount
            }
            if transaction.outgoingType == TransactionType.OutgoingtransactionTypes.friendsAndLove.getString() {
                ougoingFALTypeAmount += transaction.amount
            }
            if transaction.outgoingType == TransactionType.OutgoingtransactionTypes.health.getString() {
                ougoingHealthTypeAmount += transaction.amount
            }
            if transaction.outgoingType == TransactionType.OutgoingtransactionTypes.gifts.getString() {
                ougoingGiftsTypeAmount += transaction.amount
            }
            if transaction.outgoingType == TransactionType.OutgoingtransactionTypes.family.getString() {
                ougoingFamilyTypeAmount += transaction.amount
            }
            if transaction.outgoingType == TransactionType.OutgoingtransactionTypes.education.getString() {
                ougoingEducationTypeAmount += transaction.amount
            }
            if transaction.outgoingType == TransactionType.OutgoingtransactionTypes.investments.getString() {
                ougoingInvestmentsTypeAmount += transaction.amount
            }
            if transaction.outgoingType == TransactionType.OutgoingtransactionTypes.bussines.getString() {
                ougoingBussinesTypeAmount += transaction.amount
            }
            if transaction.outgoingType == TransactionType.OutgoingtransactionTypes.insurance.getString() {
                ougoingInsuranceTypeAmount += transaction.amount
            }
            if transaction.outgoingType == TransactionType.OutgoingtransactionTypes.fees.getString() {
                ougoingFeesTypeAmount += transaction.amount
            }
            if transaction.outgoingType == TransactionType.OutgoingtransactionTypes.others.getString() {
                ougoingOthersTypeAmount += transaction.amount
            }
            fullamountOutgoingType += transaction.amount
        }
        let percentageOfTransportTypes = (ougoingTrasportTypeAmount/fullamountOutgoingType).rounded(toPlaces: 4)
        let degreesOutgoingTransportTypes = percentageOfTransportTypes * 360
        let percentageOfBuyingTypes = (ougoingBuingTypeAmount/fullamountOutgoingType).rounded(toPlaces: 4)
        let degreesOutgoingBuyingTypes = percentageOfBuyingTypes * 360
        let percentageOfFunTypes = (ougoingFunnTypeAmount/fullamountOutgoingType).rounded(toPlaces: 4)
        let degreesOutgoingFunTypes = percentageOfFunTypes * 360
        let percentageOfTravelingTypes = (ougoingTravelingTypeAmount/fullamountOutgoingType).rounded(toPlaces: 4)
        let degreesOutgoingTravelingTypes = percentageOfTravelingTypes * 360
        let percentageOfEatAndDrinkTypes = (ougoingEatAndDrinkTypeAmount/fullamountOutgoingType).rounded(toPlaces: 4)
        let degreesOutgoingEatAndDrinkTypes = percentageOfEatAndDrinkTypes * 360
        let percentageOfRentalsAndServicesTypes = (ougoingRentalsAndServicesTypeAMount/fullamountOutgoingType).rounded(toPlaces: 4)
        let degreesOutgoingRentalsAndServicesTypes = percentageOfRentalsAndServicesTypes * 360
        let percentageOfFALTypes = (ougoingFALTypeAmount/fullamountOutgoingType).rounded(toPlaces: 4)
        let degreesOutgoingFALTypes = percentageOfFALTypes * 360
        let percentageOfHealthTypes = (ougoingHealthTypeAmount/fullamountOutgoingType).rounded(toPlaces: 4)
        let degreesOutgoingHealtTypes = percentageOfHealthTypes * 360
        let percentageOfGiftsTypes = (ougoingGiftsTypeAmount/fullamountOutgoingType).rounded(toPlaces: 4)
        let degreesOutgoingGiftsTypes = percentageOfGiftsTypes * 360
        let percentageOfFamilyTypes = (ougoingFamilyTypeAmount/fullamountOutgoingType).rounded(toPlaces: 4)
        let degreesOutgoingFamilyTypes = percentageOfFamilyTypes * 360
        let percentageOfEducationTypes = (ougoingEducationTypeAmount/fullamountOutgoingType).rounded(toPlaces: 4)
        let degreesOutgoingEducationTypes = percentageOfEducationTypes * 360
        let percentageOfInvestmentsTypes = (ougoingInvestmentsTypeAmount/fullamountOutgoingType).rounded(toPlaces: 4)
        let degreesOutgoingInvestmentsTypes = percentageOfInvestmentsTypes * 360
        let percentageOfBussinesTypes = (ougoingBussinesTypeAmount/fullamountOutgoingType).rounded(toPlaces: 4)
        let degreesOutgoingBussinesTypes = percentageOfBussinesTypes * 360
        let percentageOfInsuranceTypes = (ougoingInsuranceTypeAmount/fullamountOutgoingType).rounded(toPlaces: 4)
        let degreesOutgoingInsuranceTypes = percentageOfInsuranceTypes * 360
        let percentageOfFeesTypes = (ougoingFeesTypeAmount/fullamountOutgoingType).rounded(toPlaces: 4)
        let degreesOutgoingFeesTypes = percentageOfFeesTypes * 360
        let percentageOfOthersTypes = (ougoingOthersTypeAmount/fullamountOutgoingType).rounded(toPlaces: 4)
        let degreesOutgoingOthersTypes = percentageOfOthersTypes * 360
        
        percentageLabelForOutgoingTypesGraph.isHidden = false
        showPercentageLabelForOutgoingTypes(transportPercentage: percentageOfTransportTypes, buyingPercentage: percentageOfBuyingTypes, funnPercentage: percentageOfFunTypes, travelingPercentage: percentageOfTravelingTypes, eatanddrinkPercentage: percentageOfEatAndDrinkTypes, rentalAndServicePercentage: percentageOfRentalsAndServicesTypes, friendandlovePercentage: percentageOfFALTypes, healthPercentage: percentageOfHealthTypes, giftsPercentage: percentageOfGiftsTypes, familyPercentage: percentageOfFamilyTypes, educationPercentage: percentageOfEducationTypes, investmentsPercentage: percentageOfInvestmentsTypes, bussinesPercentage: percentageOfBussinesTypes, insurancePercentage: percentageOfInsuranceTypes, feesPercentage: percentageOfFeesTypes, othersPercentage: percentageOfOthersTypes) // . dalsie percentage
        updateLegendToOutgoingTypes(transportPercentage: percentageOfTransportTypes, buyingPercentage: percentageOfBuyingTypes, funnPercentage: percentageOfFunTypes, travelingPercentage: percentageOfTravelingTypes, eatanddrinkPercentage: percentageOfEatAndDrinkTypes, rentalAndServicePercentage: percentageOfRentalsAndServicesTypes, friendandlovePercentage: percentageOfFALTypes, healthPercentage: percentageOfHealthTypes, giftsPercentage: percentageOfGiftsTypes, familyPercentage: percentageOfFamilyTypes, educationPercentage: percentageOfEducationTypes, investmentsPercentage: percentageOfInvestmentsTypes, bussinesPercentage: percentageOfBussinesTypes, insurancePercentage: percentageOfInsuranceTypes, feesPercentage: percentageOfFeesTypes, othersPercentage: percentageOfOthersTypes) // . dalsie prcentage
        // All Circular Path:
        // .transport
        let startOfTransportTypes = -CGFloat.pi / 2
        let endOfTransportTypes = CGFloat(degreesOutgoingTransportTypes) * CGFloat.pi/180 + startOfTransportTypes
        let circularPathTransportLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: startOfTransportTypes, endAngle: endOfTransportTypes, clockwise: true)
        outgoingTransportShapeLayer.path = circularPathTransportLayer.cgPath
        outgoingTransportShapeLayer.strokeColor = Color.Transport.cgColor
        // .buying
        let endOfBuyingTypes = CGFloat(degreesOutgoingBuyingTypes) * CGFloat.pi/180 + endOfTransportTypes
        let circularPathBuyingLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfTransportTypes, endAngle: endOfBuyingTypes, clockwise: true)
        outgoingBuyingShapeLayer.path = circularPathBuyingLayer.cgPath
        outgoingBuyingShapeLayer.strokeColor = Color.Buying.cgColor
        // .funn
        let endOfFunnTypes = CGFloat(degreesOutgoingFunTypes) * CGFloat.pi/180 + endOfBuyingTypes
        let circularPathFunLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfBuyingTypes, endAngle: endOfFunnTypes, clockwise: true)
        outgoingFunnShapeLayer.path = circularPathFunLayer.cgPath
        outgoingFunnShapeLayer.strokeColor = Color.Funn.cgColor
        // .traveling
        let endOfTravelingTypes = CGFloat(degreesOutgoingTravelingTypes) * CGFloat.pi/180 + endOfFunnTypes
        let circularPathTravelingLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfFunnTypes, endAngle: endOfTravelingTypes, clockwise: true)
        outgoingTravelingShapeLayer.path = circularPathTravelingLayer.cgPath
        outgoingTravelingShapeLayer.strokeColor = Color.Traveling.cgColor
        // .eatAndDrink
        let endOfeatAndDrinkTypes = CGFloat(degreesOutgoingEatAndDrinkTypes) * CGFloat.pi/180 + endOfTravelingTypes
        let circularPathEatAndDrinkLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfTravelingTypes, endAngle: endOfeatAndDrinkTypes, clockwise: true)
        outgoingEatAndDrinkShapeLayer.path = circularPathEatAndDrinkLayer.cgPath
        outgoingEatAndDrinkShapeLayer.strokeColor = Color.EatAndDrink.cgColor
        // .rentalsAndServices
        let endOfRentalsAndServicesTypes = CGFloat(degreesOutgoingRentalsAndServicesTypes) * CGFloat.pi/180 + endOfeatAndDrinkTypes
        let circularPathRentalsAndServicesLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfeatAndDrinkTypes, endAngle: endOfRentalsAndServicesTypes, clockwise: true)
        outgoingRentalsAndServicesShapeLayer.path = circularPathRentalsAndServicesLayer.cgPath
        outgoingRentalsAndServicesShapeLayer.strokeColor = Color.RentalsAndServices.cgColor
        // .friendsAndLove
        let endOfFALTypes = CGFloat(degreesOutgoingFALTypes) * CGFloat.pi/180 + endOfRentalsAndServicesTypes
        let circularPathFALLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfRentalsAndServicesTypes, endAngle: endOfFALTypes, clockwise: true)
        outgoingFriendsAndLoveShapeLayer.path = circularPathFALLayer.cgPath
        outgoingFriendsAndLoveShapeLayer.strokeColor = Color.FriendsAndLove.cgColor
        // .health
        let endOfHelthTypes = CGFloat(degreesOutgoingHealtTypes) * CGFloat.pi/180 + endOfFALTypes
        let circularPathHealthLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfFALTypes, endAngle: endOfHelthTypes, clockwise: true)
        outgoingHealthShapeLayer.path = circularPathHealthLayer.cgPath
        outgoingHealthShapeLayer.strokeColor = Color.Health.cgColor
        // .gifts
        let endOfGiftsTypes = CGFloat(degreesOutgoingGiftsTypes) * CGFloat.pi/180 + endOfHelthTypes
        let circularPathGiftsLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfHelthTypes, endAngle: endOfGiftsTypes, clockwise: true)
        outgoingGiftsShapeLayer.path = circularPathGiftsLayer.cgPath
        outgoingGiftsShapeLayer.strokeColor = Color.BuyGift.cgColor
        // .family
        let endOfFamilyTypes = CGFloat(degreesOutgoingFamilyTypes) * CGFloat.pi/180 + endOfGiftsTypes
        let circularPathFamilyLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfGiftsTypes, endAngle: endOfFamilyTypes, clockwise: true)
        outgoingFamilyShapeLayer.path = circularPathFamilyLayer.cgPath
        outgoingFamilyShapeLayer.strokeColor = Color.Family.cgColor
        // .education
        let endOfEducationTypes = CGFloat(degreesOutgoingEducationTypes) * CGFloat.pi/180 + endOfFamilyTypes
        let circularPathEducationLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfFamilyTypes, endAngle: endOfEducationTypes, clockwise: true)
        outgoingEducationShapeLayer.path = circularPathEducationLayer.cgPath
        outgoingEducationShapeLayer.strokeColor = Color.Education.cgColor
        // .investments
        let endOfInvestmentsTypes = CGFloat(degreesOutgoingInvestmentsTypes) * CGFloat.pi/180 + endOfEducationTypes
        let circularPathInvestmentsLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfEducationTypes, endAngle: endOfInvestmentsTypes, clockwise: true)
        outgoingInvestmentsShapeLayer.path = circularPathInvestmentsLayer.cgPath
        outgoingInvestmentsShapeLayer.strokeColor = Color.Investments.cgColor
        // .bussines
        let endOfBussinesTypes = CGFloat(degreesOutgoingBussinesTypes) * CGFloat.pi/180 + endOfInvestmentsTypes
        let circularPathBussinesLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfInvestmentsTypes, endAngle: endOfBussinesTypes, clockwise: true)
        outgoingBussinesShapeLayer.path = circularPathBussinesLayer.cgPath
        outgoingBussinesShapeLayer.strokeColor = Color.Bussines.cgColor
        // .insurance
        let endOfInsurenceTypes = CGFloat(degreesOutgoingInsuranceTypes) * CGFloat.pi/180 + endOfBussinesTypes
        let circularPathInsuranceLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfBussinesTypes, endAngle: endOfInsurenceTypes, clockwise: true)
        outgoingInsuranceShapeLayer.path = circularPathInsuranceLayer.cgPath
        outgoingInsuranceShapeLayer.strokeColor = Color.Insurance.cgColor
        // .fees
        let endOfFeesTypes = CGFloat(degreesOutgoingFeesTypes) * CGFloat.pi/180 + endOfInsurenceTypes
        let circularPathFeesLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfInsurenceTypes, endAngle: endOfFeesTypes, clockwise: true)
        outgoingFeesShapeLayer.path = circularPathFeesLayer.cgPath
        outgoingFeesShapeLayer.strokeColor = Color.Fees.cgColor
        // .others
        let endOfOthersTypes = CGFloat(degreesOutgoingOthersTypes) * CGFloat.pi/180 + endOfFeesTypes
        let circularPathOthersLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfFeesTypes, endAngle: endOfOthersTypes, clockwise: true)
        outgoingOthersShapeLayer.path = circularPathOthersLayer.cgPath
        outgoingOthersShapeLayer.strokeColor = Color.Others.cgColor
        
        for outgoingLayer in outgoingShapeLayers {
            outgoingLayer.isHidden = false
            outgoingLayer.strokeEnd = 0
            outgoingLayer.fillColor = UIColor.clear.cgColor
            outgoingLayer.lineWidth = widthOfGraphPath
            layer.addSublayer(outgoingLayer)
        }
    }
    
    func addAnimationForOutgoingTypes() {
        outgoingTransportShapeLayer.add(basicAnimation, forKey: "outgoingTransport")
        outgoingBuyingShapeLayer.add(basicAnimation, forKey: "outgoingBuing")
        outgoingFunnShapeLayer.add(basicAnimation, forKey: "outgoingFunn")
        outgoingTravelingShapeLayer.add(basicAnimation, forKey: "outgoingTraveling")
        outgoingEatAndDrinkShapeLayer.add(basicAnimation, forKey: "outgoingEatAndDrink")
        outgoingRentalsAndServicesShapeLayer.add(basicAnimation, forKey: "outgoingRentAndServbices")
        outgoingFriendsAndLoveShapeLayer.add(basicAnimation, forKey: "outgoingFriendAndLove")
        outgoingHealthShapeLayer.add(basicAnimation, forKey: "outgoingHealth")
        outgoingGiftsShapeLayer.add(basicAnimation, forKey: "outgoingGifts")
        outgoingFamilyShapeLayer.add(basicAnimation, forKey: "outgoingFamily")
        outgoingEducationShapeLayer.add(basicAnimation, forKey: "outgoingEducation")
        outgoingInvestmentsShapeLayer.add(basicAnimation, forKey: "outgoingInvestments")
        outgoingBussinesShapeLayer.add(basicAnimation, forKey: "outgoingBussines")
        outgoingInsuranceShapeLayer.add(basicAnimation, forKey: "outgoingInsurance")
        outgoingFeesShapeLayer.add(basicAnimation, forKey: "outgoingFees")
        outgoingOthersShapeLayer.add(basicAnimation, forKey: "outgoingOthers")
    }
    
    /// Incoming Graph:
    private func showPercentageLabelForIncomingTypesGraph(payPercentage: Double, sellPercentage: Double, rewardsPercentage: Double, intMoneyPercentage: Double, giftsPercentage: Double, othersPercentage: Double) {
        percentageLabelOfBasedGraph.isHidden = true
        percentageLabelForOutgoingTypesGraph.isHidden = true
        percentageLabelForIncomingTypesGraph.isHidden = false
        percentageLabelForIncomingTypesGraph.numberOfLines = 6
        percentageLabelForIncomingTypesGraph.center = CGPoint(x: center.x - grafXOffset , y: center.y - 10)
        let attributetAllString = NSMutableAttributedString(string: "\(payPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor: Color.Pay, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
        let attributeSellString = NSAttributedString(string: "\n\(sellPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor : Color.Sell, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
        attributetAllString.append(attributeSellString)
        let attributeRewardsString = NSAttributedString(string: "\n\(rewardsPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor : Color.Rewards, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
        attributetAllString.append(attributeRewardsString)
        let attributeintMoneyString = NSAttributedString(string: "\n\(intMoneyPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor : Color.InterestMoney, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
        attributetAllString.append(attributeintMoneyString)
        let attributeGiftsString = NSAttributedString(string: "\n\(giftsPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor : Color.GiftMoney, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
        attributetAllString.append(attributeGiftsString)
        let attributeOthersString = NSAttributedString(string: "\n\(othersPercentage.rounded(toPlaces: 4)) %", attributes: [NSAttributedString.Key.foregroundColor : Color.Others, NSAttributedString.Key.font: Font.BasicUnderTypeOfOutgoingTransactionButon])
        attributetAllString.append(attributeOthersString)
        percentageLabelForIncomingTypesGraph.attributedText = attributetAllString
        addSubview(percentageLabelForIncomingTypesGraph)
    }
    
    private func updateLegendToIncomingTypes() {
        outgoingButton.isHidden = true
        incomingButton.isHidden = true
        for subview in legendStackView.subviews {
            legendStackView.removeArrangedSubview(subview)
        }
        backButton.isHidden = false
        legendStackView.addArrangedSubview(backButton)
        legendStackView.isHidden = false
        for button in incomingTypeButons {
            button.isHidden = false
            legendStackView.addArrangedSubview(button)
        }
    }
    
    private func incomingGraph() {
        updateLegendToIncomingTypes()
        percentageLabelOfBasedGraph.isHidden = true
        
        trackLayer.isHidden = false
        incomingTransactionsShapeLayer.isHidden = true
        outgoingTransactionsShapeLayer.isHidden = true
        // Incoming Types :
        let centerPoint = CGPoint(x: center.x - grafXOffset, y: center.y - 10)
        
        var fullamountIncomingType: Double = 0.0
        var incomingPayTypeAmount: Double = 0.0
        var incomingSelltypeAmount: Double = 0.0
        var incomingRewardsTypeAmount: Double = 0.0
        var incomingInterestMoneyTypesAmount: Double = 0.0
        var incomingGiftsTypesAmount: Double = 0.0
        var incomingOthersTypesAmount: Double = 0.0
        for transaction in incomingTransactions {
            if transaction.incomingType == TransactionType.IncomingtransactionTypes.pay.getString() {
                incomingPayTypeAmount += transaction.amount
            }
            if transaction.incomingType == TransactionType.IncomingtransactionTypes.sell.getString() {
                incomingSelltypeAmount += transaction.amount
            }
            if transaction.incomingType == TransactionType.IncomingtransactionTypes.rewards.getString() {
                incomingRewardsTypeAmount += transaction.amount
            }
            if transaction.incomingType == TransactionType.IncomingtransactionTypes.interestMoney.getString() {
                incomingInterestMoneyTypesAmount += transaction.amount
            }
            if transaction.incomingType == TransactionType.IncomingtransactionTypes.gifts.getString() {
                incomingGiftsTypesAmount += transaction.amount
            }
            if transaction.incomingType == TransactionType.IncomingtransactionTypes.others.getString() {
                incomingOthersTypesAmount += transaction.amount
            }
            fullamountIncomingType += transaction.amount
        }
        let percentageOfPayTypes = (incomingPayTypeAmount/fullamountIncomingType).rounded(toPlaces: 4)
        let degreesIncomingPyTypes = percentageOfPayTypes * 360
        let percentageOfSellTypes = (incomingSelltypeAmount/fullamountIncomingType).rounded(toPlaces: 4)
        let degreesIncomingSellTypes = percentageOfSellTypes * 360
        let percentageOfRewardTypes = (incomingRewardsTypeAmount/fullamountIncomingType).rounded(toPlaces: 4)
        let degreesIncomingRewardTypes = percentageOfRewardTypes * 360
        let percentageOfInterestMoneyTypes = (incomingInterestMoneyTypesAmount/fullamountIncomingType).rounded(toPlaces: 4)
        let degreesIncomingInterestMoneyTypes = percentageOfInterestMoneyTypes * 360
        let percentageOfGiftsTypes = (incomingGiftsTypesAmount/fullamountIncomingType).rounded(toPlaces: 4)
        let degreesIncomingGiftsTypes = percentageOfGiftsTypes * 360
        let percentageOfOthersTypes = (incomingOthersTypesAmount/fullamountIncomingType).rounded(toPlaces: 4)
        let degreesIncomingOthersTypes = percentageOfOthersTypes * 360
        
        showPercentageLabelForIncomingTypesGraph(payPercentage: percentageOfPayTypes, sellPercentage: percentageOfSellTypes, rewardsPercentage: percentageOfRewardTypes, intMoneyPercentage: percentageOfInterestMoneyTypes, giftsPercentage: percentageOfGiftsTypes, othersPercentage: percentageOfOthersTypes)
        // All Circular Path:
        // .pay
        let startOfPayTypes = -CGFloat.pi / 2
        let endOfPayTypes = CGFloat(degreesIncomingPyTypes) * CGFloat.pi/180 + startOfPayTypes
        let circularPathPayLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: startOfPayTypes, endAngle: endOfPayTypes, clockwise: true)
        incomingPaysShapeLayer.path = circularPathPayLayer.cgPath
        incomingPaysShapeLayer.strokeColor = Color.Pay.cgColor
        // .sell
        let endOfIncomingSellType = CGFloat(degreesIncomingSellTypes) * CGFloat.pi/180 + endOfPayTypes
        let circularPathSellILayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfPayTypes, endAngle: endOfIncomingSellType, clockwise: true)
        incomingSellLayer.path = circularPathSellILayer.cgPath
        incomingSellLayer.strokeColor = Color.Sell.cgColor
        // .reward
        let endOfIncomingRewardsType = CGFloat(degreesIncomingRewardTypes) * CGFloat.pi/180 + endOfIncomingSellType
        let circularPathRewardsLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfIncomingSellType, endAngle: endOfIncomingRewardsType, clockwise: true)
        incomingRewardsShapeLayer.path = circularPathRewardsLayer.cgPath
        incomingRewardsShapeLayer.strokeColor = Color.Rewards.cgColor
        // .interestMoney
        let endOfIncomingInterestMoneyType = CGFloat(degreesIncomingInterestMoneyTypes) * CGFloat.pi/180 + endOfIncomingRewardsType
        let circularPathInterestMoneyLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfIncomingRewardsType, endAngle: endOfIncomingInterestMoneyType, clockwise: true)
        incomingInterestMoneyShapeLayer.path = circularPathInterestMoneyLayer.cgPath
        incomingInterestMoneyShapeLayer.strokeColor = Color.InterestMoney.cgColor
        // .gifts
        let endOfIncomingGiftsType = CGFloat(degreesIncomingGiftsTypes) * CGFloat.pi/180 + endOfIncomingInterestMoneyType
        let circularPathGiftsLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfIncomingInterestMoneyType, endAngle: endOfIncomingGiftsType, clockwise: true)
        incomingGiftsShapeLayer.path = circularPathGiftsLayer.cgPath
        incomingGiftsShapeLayer.strokeColor = Color.GiftMoney.cgColor
        // .others
        let endOfIncomingOthersType = CGFloat(degreesIncomingOthersTypes) * CGFloat.pi/180 + endOfIncomingGiftsType
        let circularPathOthersLayer = UIBezierPath(arcCenter: centerPoint, radius: 75, startAngle: endOfIncomingGiftsType, endAngle: endOfIncomingOthersType, clockwise: true)
        incomingOthersShapeLayer.path = circularPathOthersLayer.cgPath
        incomingOthersShapeLayer.strokeColor = Color.Others.cgColor
        // Add all layers :
        for incominglayer in incomingShapeLayers {
            incominglayer.isHidden = false
            incominglayer.strokeEnd = 0
            incominglayer.fillColor = UIColor.clear.cgColor
            incominglayer.lineWidth = widthOfGraphPath
            layer.addSublayer(incominglayer)
        }
    }
    
    func addAnimationForIncomingTypes() {
        incomingPaysShapeLayer.add(basicAnimation, forKey: "incomingPay")
        incomingSellLayer.add(basicAnimation, forKey: "incomingSell")
        incomingRewardsShapeLayer.add(basicAnimation, forKey: "incomingReward")
        incomingInterestMoneyShapeLayer.add(basicAnimation, forKey: "incomingIngnterestMoney")
        incomingGiftsShapeLayer.add(basicAnimation, forKey: "incomingGifts")
        incomingOthersShapeLayer.add(basicAnimation, forKey: "incomingOthers")
    }
    
}

