//
//  Font.swift
//  PayOutDemo
//
//  Created by Marek Hajdučák on 29/03/2019.
//  Copyright © 2019 Marek Hajdučák. All rights reserved.
//

import UIKit

class Font {
    
    public class var BasicPickerViewButtonTitle: UIFont {
        return UIFont.systemFont(ofSize: 17, weight: .regular)
    }
    
    public class var BasicFont: UIFont {
        return UIFont.systemFont(ofSize: 15, weight: .regular)
    }
    public class var BasicNavigationTitle: UIFont {
        return UIFont.systemFont(ofSize: 25, weight: .semibold)
    }
    
    /// Home Screen
    public class var BaseLightestBigFont: UIFont {
        if UIScreen.main.bounds.width == 320 {
            return UIFont.systemFont(ofSize: 30, weight: .light)
        } else if UIScreen.main.bounds.width == 375  {
            return UIFont.systemFont(ofSize: 38, weight: .light)
        } else if UIScreen.main.bounds.width == 414  {
            return UIFont.systemFont(ofSize: 50, weight: .light)
        } else {
            return BasicFont
        }
    }
    
    public class var BaseLightestSmallFont: UIFont {
        if UIScreen.main.bounds.width == 320 {
            return UIFont.systemFont(ofSize: 15, weight: .light)
        } else if UIScreen.main.bounds.width == 375  {
            return UIFont.systemFont(ofSize: 23, weight: .light)
        } else if UIScreen.main.bounds.width == 414  {
            return UIFont.systemFont(ofSize: 35, weight: .light)
        } else {
            return BasicFont
        }
    }
    
    public class var CurrencyLighestFont: UIFont {
        if UIScreen.main.bounds.width == 320 {
            return UIFont.systemFont(ofSize: 25, weight: .light)
        } else if UIScreen.main.bounds.width == 375  {
            return UIFont.systemFont(ofSize: 33, weight: .light)
        } else if UIScreen.main.bounds.width == 414  {
            return UIFont.systemFont(ofSize: 45, weight: .light)
        } else {
            return BasicFont
        }
    }
    
    public class var BasicSize: CGFloat {
        if UIScreen.main.bounds.width == 320 {
            return 16
        } else if UIScreen.main.bounds.width == 375  {
            return 19
        } else if UIScreen.main.bounds.width == 414  {
            return 22
        } else {
            return 14
        }
    }
    
    public class var BaseInfoFont: UIFont {
        return UIFont.systemFont(ofSize: BasicSize)
    }
    public class var BasicIBANBoldFont: UIFont {
        return UIFont.systemFont(ofSize: BasicSize - 3, weight: .bold)
    }
    public class var BasicIBANRegularFont: UIFont {
        return UIFont.systemFont(ofSize: BasicSize - 3, weight: .regular)
    }
    
    // Widgets
    public class var BasicWidgetTitle: UIFont {
        if UIScreen.main.bounds.width == 320 {
            return UIFont.systemFont(ofSize: 14, weight: .semibold)
        } else if UIScreen.main.bounds.width == 375  {
            return UIFont.systemFont(ofSize: 16, weight: .semibold)
        } else if UIScreen.main.bounds.width == 414  {
            return UIFont.systemFont(ofSize: 18, weight: .semibold)
        } else {
            return BasicFont
        }
    }
    
    public class var BasicWidgetDescription: UIFont {
        if UIScreen.main.bounds.width == 320 {
            return UIFont.systemFont(ofSize: 13, weight: .regular)
        } else if UIScreen.main.bounds.width == 375  {
            return UIFont.systemFont(ofSize: 15, weight: .regular)
        } else if UIScreen.main.bounds.width == 414  {
            return UIFont.systemFont(ofSize: 17, weight: .regular)
        } else {
            return BasicFont
        }
    }
    
    /// Transactions Screen
    public class var BasicTransactionTitle: UIFont {
        if UIScreen.main.bounds.width == 320 {
            return UIFont.systemFont(ofSize: 17, weight: .bold)
        } else if UIScreen.main.bounds.width == 375  {
            return UIFont.systemFont(ofSize: 19, weight: .bold)
        } else if UIScreen.main.bounds.width == 414  {
            return UIFont.systemFont(ofSize: 21, weight: .bold)
        } else {
            return BasicFont
        }
    }
    
    public class var BasicTransactionDescription: UIFont {
        if UIScreen.main.bounds.width == 320 {
            return UIFont.systemFont(ofSize: 13, weight: .regular)
        } else if UIScreen.main.bounds.width == 375  {
            return UIFont.systemFont(ofSize: 15, weight: .regular)
        } else if UIScreen.main.bounds.width == 414  {
            return UIFont.systemFont(ofSize: 17, weight: .regular)
        } else {
            return BasicFont
        }
    }
    
    public class var BasicTransactionAmount: UIFont {
        if UIScreen.main.bounds.width == 320 {
            return UIFont.systemFont(ofSize: 15, weight: .bold)
        } else if UIScreen.main.bounds.width == 375  {
            return UIFont.systemFont(ofSize: 17, weight: .bold)
        } else if UIScreen.main.bounds.width == 414  {
            return UIFont.systemFont(ofSize: 19, weight: .bold)
        } else {
            return BasicFont
        }
    }
    
    // Acount View:
    public class var BasicTransactionAccountTitle: UIFont {
        if UIScreen.main.bounds.width == 320 {
            return UIFont.systemFont(ofSize: 20, weight: .semibold)
        } else if UIScreen.main.bounds.width == 375  {
            return UIFont.systemFont(ofSize: 22, weight: .semibold)
        } else if UIScreen.main.bounds.width == 414  {
            return UIFont.systemFont(ofSize: 22, weight: .semibold)
        } else {
            return BasicFont
        }
        
    }
    
    public class var BasicTransactionActualizationText: UIFont {
        if UIScreen.main.bounds.width == 320 {
            return UIFont.systemFont(ofSize: 12, weight: .light)
        } else if UIScreen.main.bounds.width == 375  {
            return UIFont.systemFont(ofSize: 14, weight: .light)
        } else if UIScreen.main.bounds.width == 414  {
            return UIFont.systemFont(ofSize: 14, weight: .light)
        } else {
            return BasicFont
        }
    }
    
    public class var BasicTransactionAmountTitle: UIFont {
        if UIScreen.main.bounds.width == 320 {
            return UIFont.systemFont(ofSize: 30, weight: .semibold)
        } else if UIScreen.main.bounds.width == 375  {
            return UIFont.systemFont(ofSize: 32, weight: .semibold)
        } else if UIScreen.main.bounds.width == 414  {
            return UIFont.systemFont(ofSize: 32, weight: .semibold)
        } else {
            return BasicFont
        }
    }
    
    public class var BasicTransactionInOutcomeTitle: UIFont {
        if UIScreen.main.bounds.width == 320 {
            return UIFont.systemFont(ofSize: 15, weight: .bold)
        } else if UIScreen.main.bounds.width == 375  {
            return UIFont.systemFont(ofSize: 16, weight: .bold)
        } else if UIScreen.main.bounds.width == 414  {
            return UIFont.systemFont(ofSize: 16, weight: .bold)
        } else {
            return BasicFont
        }
    }
    // Filter screen
    public class var BasicFilterTitle: UIFont {
        if UIScreen.main.bounds.width == 320 {
            return UIFont.systemFont(ofSize: 15, weight: .bold)
        } else if UIScreen.main.bounds.width == 375  {
            return UIFont.systemFont(ofSize: 17, weight: .bold)
        } else if UIScreen.main.bounds.width == 414  {
            return UIFont.systemFont(ofSize: 18, weight: .bold)
        } else {
            return BasicFont
        }
    }
    // Spending Report
    
    public class var BasicTypeOfTransactionButon: UIFont {
        return UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    
    public class var BasicUnderTypeOfTransactionButon: UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    public class var BasicUnderTypeOfOutgoingTransactionButon: UIFont {
        return UIFont.systemFont(ofSize: 13, weight: .bold)
    }
    
    public class var BasicPercentageLabelTitle: UIFont {
        return UIFont.boldSystemFont(ofSize: 12)
    }
    
    
}


/*
 public class var BasicSize: CGFloat {
 if UIScreen.main.bounds.width == 320 {
 return
 } else if UIScreen.main.bounds.width == 375  {
 return
 } else if UIScreen.main.bounds.width == 414  {
 return
 } else {
 return
 }
 */
 
