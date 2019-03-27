//
//  Image.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 25/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class Image {
    
    // System Images
    public class var Empty: UIImage { return UIImage() }
    public class var ArrowDown: UIImage { return #imageLiteral(resourceName: "arrow_down") }
    public class var Cancel: UIImage { return #imageLiteral(resourceName: "cancel") }
    
    // Logos
    public class var PayoutLogo: UIImage { return #imageLiteral(resourceName: "payout_logo") }
    
    // Navigation Bar
    public class var Settings: UIImage { return #imageLiteral(resourceName: "settings") }
    public class var Chat: UIImage { return #imageLiteral(resourceName: "live_chat") }
    public class var QrCode: UIImage { return #imageLiteral(resourceName: "qr_code") }
    public class var Message: UIImage { return #imageLiteral(resourceName: "mail_box") }
    public class var Filter: UIImage { return #imageLiteral(resourceName: "filter") }
    
    // Tab Bar
    public class var HomeTabBar: UIImage { return #imageLiteral(resourceName: "home") }
    public class var TransactionTabBar: UIImage { return #imageLiteral(resourceName: "transactions") }
    public class var StatisticTabBar: UIImage { return #imageLiteral(resourceName: "statistics") }
    public class var SettingsTabBar: UIImage { return #imageLiteral(resourceName: "service") }
    
    // Widgets
    public class var CreditCard: UIImage { return #imageLiteral(resourceName: "credit_card") }
    public class var Loan: UIImage { return #imageLiteral(resourceName: "loans") }
    public class var Atm: UIImage { return #imageLiteral(resourceName: "atm_branches") }
    public class var ExchangeRate: UIImage { return #imageLiteral(resourceName: "exchange_rate") }
    public class var SpendingReport: UIImage { return #imageLiteral(resourceName: "spending_report_red") }
    public class var Asset: UIImage { return #imageLiteral(resourceName: "assets_ liabilities") }
    public class var Fund: UIImage { return #imageLiteral(resourceName: "mutual_funds") }
    public class var Pension: UIImage { return #imageLiteral(resourceName: "dds_pension") }
    public class var Goal: UIImage { return #imageLiteral(resourceName: "goals") }
    
    // Flags
    public class var SVK: UIImage { return #imageLiteral(resourceName: "slovakia") }
    public class var CZE: UIImage { return #imageLiteral(resourceName: "czech_republic") }
    public class var USD: UIImage { return #imageLiteral(resourceName: "united_states") }
    public class var GBP: UIImage { return #imageLiteral(resourceName: "united_kingdom") }
    // Transaction Cells
    public class var Replay: UIImage { return #imageLiteral(resourceName: "replay") }
    public class var SaveContact: UIImage { return #imageLiteral(resourceName: "employee") }
    public class var AddPhoto: UIImage { return #imageLiteral(resourceName: "camera") }
    // Transaction Cells
    
    /// Transaction Types
    // Incoming
    public class var Pay: UIImage { return #imageLiteral(resourceName: "money") }
    public class var Sell: UIImage { return #imageLiteral(resourceName: "sale") }
    public class var Rewards: UIImage { return #imageLiteral(resourceName: "reward") }
    public class var InterestMoney: UIImage { return #imageLiteral(resourceName: "interest_money") }
    public class var GiftMoney: UIImage { return #imageLiteral(resourceName: "gift_money") }
    public class var Others: UIImage { return #imageLiteral(resourceName: "others") }

    // Ountcoming
    public class var Transport: UIImage { return #imageLiteral(resourceName: "transport") }
    public class var Buying: UIImage { return #imageLiteral(resourceName: "buying") }
    public class var Funn: UIImage { return #imageLiteral(resourceName: "funn") }
    public class var Traveling: UIImage { return #imageLiteral(resourceName: "traveling") }
    public class var EatAndDrink: UIImage { return #imageLiteral(resourceName: "eat_and_drink") }
    public class var RentalsAndServices: UIImage { return #imageLiteral(resourceName: "rental_and_services") }
    public class var FriendsAndLove: UIImage { return #imageLiteral(resourceName: "friends_and_love") }
    public class var Health: UIImage { return #imageLiteral(resourceName: "health") }
    public class var BuyGift: UIImage { return #imageLiteral(resourceName: "buy_gifts") }
    public class var Family: UIImage { return #imageLiteral(resourceName: "family") }
    public class var Education: UIImage { return #imageLiteral(resourceName: "education") }
    public class var Investments: UIImage { return #imageLiteral(resourceName: "investments") }
    public class var Bussines: UIImage { return #imageLiteral(resourceName: "bussines") }
    public class var Insurance: UIImage { return #imageLiteral(resourceName: "insurance") }
    public class var Fees: UIImage { return #imageLiteral(resourceName: "fees")}
    
    // UInder Types
    public class var Petrol: UIImage { return #imageLiteral(resourceName: "petrol") }
    public class var Taxi: UIImage { return #imageLiteral(resourceName: "taxi") }
    public class var ParkingFees: UIImage { return #imageLiteral(resourceName: "parking_fee") }
    public class var Maintenance: UIImage { return #imageLiteral(resourceName: "maintenance") }
    public class var Train: UIImage { return #imageLiteral(resourceName: "train") }
    public class var Bus: UIImage { return #imageLiteral(resourceName: "bus") }
    public class var Clothes: UIImage { return #imageLiteral(resourceName: "clothes") }
    public class var Shoes: UIImage { return #imageLiteral(resourceName: "shoes") }
    public class var Accessories: UIImage { return #imageLiteral(resourceName: "accessories") }
    public class var Electronics: UIImage { return #imageLiteral(resourceName: "electronics") }
    public class var Movies: UIImage { return #imageLiteral(resourceName: "movie") }
    public class var Games: UIImage { return #imageLiteral(resourceName: "games") }
    public class var Restaurant: UIImage { return #imageLiteral(resourceName: "restaurant") }
    public class var Coffe: UIImage { return #imageLiteral(resourceName: "coffee") }
    public class var Rent: UIImage { return #imageLiteral(resourceName: "rent") }
    public class var Services: UIImage { return #imageLiteral(resourceName: "services") }
    public class var Phone: UIImage { return #imageLiteral(resourceName: "phone_services") }
    public class var Watter: UIImage { return #imageLiteral(resourceName: "water") }
    public class var Electricity: UIImage { return #imageLiteral(resourceName: "electricity") }
    public class var Gas: UIImage { return #imageLiteral(resourceName: "gas") }
    public class var Tv: UIImage { return #imageLiteral(resourceName: "tv") }
    public class var Internet: UIImage { return #imageLiteral(resourceName: "internet") }
    public class var Sport: UIImage { return #imageLiteral(resourceName: "sport") }
    public class var Doctor: UIImage { return #imageLiteral(resourceName: "doctor") }
    public class var Marriage: UIImage { return #imageLiteral(resourceName: "marriage") }
    public class var Funeral: UIImage { return #imageLiteral(resourceName: "funeral") }
    public class var Charity: UIImage { return #imageLiteral(resourceName: "charity") }
    public class var Kids: UIImage { return #imageLiteral(resourceName: "kids") }
    public class var Home: UIImage { return #imageLiteral(resourceName: "home_ico") }
    public class var Pets: UIImage { return #imageLiteral(resourceName: "pets") }
    public class var HouseHolds: UIImage { return #imageLiteral(resourceName: "house_holds") }
    public class var Books: UIImage { return #imageLiteral(resourceName: "books") }
    public class var Courses: UIImage { return #imageLiteral(resourceName: "courses") }
}



