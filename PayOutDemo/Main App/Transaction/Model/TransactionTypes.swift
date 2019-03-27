//
//  TransactionTypes.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 25/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class TransactionTypes {
    var transactionType: TransactionType // Incoming = 1 or Outgoing = 2
    
    var incomingType: TransactionType.IncomingtransactionTypes?
    var outgoingType: TransactionType.OutgoingtransactionTypes?
    var underOutgoingType: TransactionType.OutgoingtransactionTypes.OutgoingUnderTypes?
    
    init(transactionTypeString: Int = 0, incomingTypeString: String?, outgoingTypeString: String?, underOutgoingType: String?) {
        self.transactionType = TransactionType.init(rawValue: transactionTypeString) ?? .all
        self.incomingType = TransactionType.IncomingtransactionTypes.init(rawValue: incomingTypeString ?? "Empty") ?? .empty
        self.outgoingType = TransactionType.OutgoingtransactionTypes.init(rawValue: outgoingTypeString ?? "Empty") ?? .empty
        setUnderOutgoingType(underOutgoingType: underOutgoingType ?? "Empty")
    }
    
    private func setUnderOutgoingType(underOutgoingType: String) {
        self.underOutgoingType = getUnderType(from: self.outgoingType ?? .empty, under: underOutgoingType)
    }
    
    let underTypesDictionary: [TransactionType.OutgoingtransactionTypes: [String : TransactionType.OutgoingtransactionTypes.OutgoingUnderTypes]] = [
        .transport : [
            "Empty" : .empty,
            "Petrol" : .petrol,
            "Taxi" : .taxi,
            "Parking Fees" : .parkingFees,
            "Maintenance" : .maintenance,
            "Train": .train,
            "Bus" : .bus
        ],
        .buying: [
            "Empty" : .empty,
            "Clothes": .clothes ,
            "Shoes": .shoes ,
            "Accessories": .accessories ,
            "Electronics": .electronics ,
        ],
        .funn: [
            "Empty" : .empty,
            "Movies": .movies ,
            "Games": .games ,
        ],
        .eatAndDrink: [
            "Empty" : .empty,
            "Restaurant": .restaurant ,
            "Coffe": .coffe ,
        ],
        .rentalsAndServices: [
            "Empty" : .empty,
            "Rent": .rent ,
            "Services": .services ,
            "Phone": .phone ,
            "Watter": .watter ,
            "Electricity": .electricity ,
            "Gas": .gas ,
            "TV": .tv ,
            "Internet": .internet ,
        ],
        .health: [
            "Empty" : .empty,
            "Sport": .sport ,
            "Doctor": .doctor ,
            "Others": .other ,
        ],
        .gifts: [
            "Empty" : .empty,
            "Marriage": .marriage ,
            "Funeral": .funeral ,
            "Charity": .charity ,
        ],
        .family: [
            "Empty" : .empty,
            "Kids": .kids ,
            "Home": .home ,
            "Pets": .pets ,
            "House Holds": .houseHolds ,
        ],
        .education: [
            "Empty" : .empty,
            "Books": .books ,
            "Courses": .courses ,
        ]
    ]
    
    private func getUnderType(from outgoing: TransactionType.OutgoingtransactionTypes, under key: String) -> TransactionType.OutgoingtransactionTypes.OutgoingUnderTypes? {
        if let arrayOFundertypes = underTypesDictionary[outgoing] {
            return arrayOFundertypes[key]
        } else {
            return .empty
        }
    }
}

enum TransactionType: Int, CaseIterable {
    case all = 0
    case incoming = 1
    case outgoing = 2
    
    enum IncomingtransactionTypes: String, CaseIterable {
        case empty = "Empty"
        case pay = "Pay"
        case sell = "Sell"
        case rewards = "Rewards"
        case interestMoney = "Interest Money"
        case gifts = "Gifts"
        case others = "Others"
        
        func getImage() -> UIImage {
            switch self {
            case .empty:
                return Image.Empty
            case .pay:
                return Image.Pay
            case .sell:
                return Image.Sell
            case .rewards:
                return Image.Rewards
            case .interestMoney:
                return Image.InterestMoney
            case .gifts:
                return Image.GiftMoney
            case .others:
                return Image.Others
            }
        }
        
        func getString() -> String {
            return self.rawValue
        }
        
    }
    
    enum OutgoingtransactionTypes: String, CaseIterable {
        case empty = "Empty"
        case transport = "Transport"
        case buying = "Buing"
        case funn = "Funn"
        case traveling = "Traveling"
        case eatAndDrink = "Eat and Drink"
        case rentalsAndServices = "Rentals and Services"
        case friendsAndLove = "Friend and Love"
        case health = "Health"
        case gifts = "Gifts"
        case family = "Family"
        case education = "Education"
        case investments = "Investments"
        case bussines = "Bussines"
        case insurance = "Insurance"
        case fees = "Fees"
        case others = "Others"
        
        func getImage() -> UIImage {
            switch self {
            case .empty:
                return Image.Empty
            case .transport:
                return Image.Transport
            case .buying:
                return Image.Buying
            case .funn:
                return Image.Funn
            case .traveling:
                return Image.Traveling
            case .eatAndDrink:
                return Image.EatAndDrink
            case .rentalsAndServices:
                return Image.RentalsAndServices
            case .friendsAndLove:
                return Image.FriendsAndLove
            case .health:
                return Image.Health
            case .gifts:
                return Image.BuyGift
            case .family:
                return Image.Family
            case .education:
                return Image.Education
            case .investments:
                return Image.Investments
            case .bussines:
                return Image.Bussines
            case .insurance:
                return Image.Insurance
            case .fees:
                return Image.Fees
            case .others:
                return Image.Others
            }
        }
        
        func getString() -> String {
            return self.rawValue
        }
        
        enum OutgoingUnderTypes: String, CaseIterable {
            case empty = "Empty"
            // Transport
            case petrol = "Patrol"
            case taxi = "Taxi"
            case parkingFees = "Parking Fees"
            case maintenance = "Maintenance"
            case train = "Train"
            case bus = "Bus"
            // Buying
            case clothes = "Clothes"
            case shoes = "Shoes"
            case accessories = "Accessories"
            case electronics = "Electronics"
            // Fun
            case movies = "Movies"
            case games = "Games"
            // Eat And Drink
            case restaurant = "Restaurant"
            case coffe = "Coffe"
            // Rentals And Services
            case rent = "Rent"
            case services = "Services"
            case phone = "Phone"
            case watter = "Watter"
            case electricity = "Electricity"
            case gas = "Gas"
            case tv = "TV"
            case internet = "Internet"
            // Health
            case sport = "Sport"
            case doctor = "Doctor"
            case other = "Others"
            // Gifts
            case marriage = "Marriage"
            case funeral = "Funeral"
            case charity = "Charity"
            // Family
            case kids = "Kids"
            case home = "Home"
            case pets = "Pets"
            case houseHolds = "House Holds"
            // Education
            case books = "Books"
            case courses = "Courses"
            
            func getImage() -> UIImage {
                switch self {
                case .petrol:
                    return Image.Petrol
                case .taxi:
                    return Image.Taxi
                case .parkingFees:
                    return Image.ParkingFees
                case .maintenance:
                    return Image.Maintenance
                case .train:
                    return Image.Train
                case .bus:
                    return Image.Bus
                case .clothes:
                    return Image.Clothes
                case .shoes:
                    return Image.Shoes
                case .accessories:
                    return Image.Accessories
                case .electronics:
                    return Image.Electronics
                case .movies:
                    return Image.Movies
                case .games:
                    return Image.Games
                case .restaurant:
                    return Image.Restaurant
                case .coffe:
                    return Image.Coffe
                case .rent:
                    return Image.Rent
                case .services:
                    return Image.Services
                case .phone:
                    return Image.Phone
                case .watter:
                    return Image.Watter
                case .electricity:
                    return Image.Electricity
                case .gas:
                    return Image.Gas
                case .tv:
                    return Image.Tv
                case .internet:
                    return Image.Internet
                case .sport:
                    return Image.Sport
                case .doctor:
                    return Image.Doctor
                case .other:
                    return Image.Others
                case .marriage:
                    return Image.Marriage
                case .funeral:
                    return Image.Funeral
                case .charity:
                    return Image.Charity
                case .kids:
                    return Image.Kids
                case .home:
                    return Image.Home
                case .pets:
                    return Image.Pets
                case .houseHolds:
                    return Image.HouseHolds
                case .books:
                    return Image.Books
                case .courses:
                    return Image.Courses
                case .empty:
                    return Image.Empty
                }
            }
            
            func getString() -> String {
                return self.rawValue
            }
        }
    }
    
    func getString() -> String {
        switch self {
        case .all:
            return "All"
        case .incoming:
            return "Incoming"
        case .outgoing:
            return "Outgoing"
        }
    }
}
