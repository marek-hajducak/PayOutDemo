//
//  Color.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 18/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class Color {
    
    public class var MainRed: UIColor {
        return #colorLiteral(red: 0.7760000229, green: 0.2779999971, blue: 0.2080000043, alpha: 1)
    }
    
    public class var White: UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    public class var MainBackground: UIColor {
        return #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
    }
    
    public class var MainTableViewBackground: UIColor {
        return #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
    }
    
    public class var LighGrey: UIColor {
        return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    public class var MainGrey: UIColor {
        return #colorLiteral(red: 0.5951961279, green: 0.6001907587, blue: 0.6000030637, alpha: 1)
    }
    
    public class var DarkGrey: UIColor {
        return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
    
    public class var Grey: UIColor {
        return #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    public class var IncomingGreen: UIColor {
        return #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    }
    
    public class var IncomingLightGreen: UIColor {
        return #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    }
    
    public class var OutcomingRed: UIColor {
        return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    public class var OutcomingLightRed: UIColor {
        return #colorLiteral(red: 1, green: 0.368627451, blue: 0.2078431373, alpha: 1)
    }
    
    // Incoming Transaction Types
    public class var Pay: UIColor { return #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1) }
    public class var Sell: UIColor { return #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) }
    public class var Rewards: UIColor { return #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) }
    public class var InterestMoney: UIColor { return #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1) }
    public class var GiftMoney: UIColor { return #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1) }
    public class var Others: UIColor { return #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1) }
    
    //Outgoing Transaction Types
    public class var Transport: UIColor { return #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)}
    public class var Buying: UIColor { return #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1) }
    public class var Funn: UIColor { return #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1) }
    public class var Traveling: UIColor { return  #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)}
    public class var EatAndDrink: UIColor { return  #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)}
    public class var RentalsAndServices: UIColor { return #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)}
    public class var FriendsAndLove: UIColor { return  #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)}
    public class var Health: UIColor { return  #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)}
    public class var BuyGift: UIColor { return  #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)}
    public class var Family: UIColor { return  #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)}
    public class var Education: UIColor { return  #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)}
    public class var Investments: UIColor { return  #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)}
    public class var Bussines: UIColor { return  #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)}
    public class var Insurance: UIColor { return  #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)}
    public class var Fees: UIColor { return #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)}
}
