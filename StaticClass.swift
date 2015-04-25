//
//  StaticClass.swift
//  SwiftDemo
//
//  Created by TopsTech on 02/03/2015.
//  Copyright (c) 2015 tops. All rights reserved.
//

import UIKit

@objc class StaticClass {
    
    class var sharedInstance: StaticClass {
        struct Static {
            static var instance: StaticClass?
            static var token: dispatch_once_t = 0
        }
        dispatch_once(&Static.token) {
            Static.instance = StaticClass()
        }
        return Static.instance!
    }
    
    // MARK: - Save to NSUserdefault
    func saveToUserDefaults (value: AnyObject?, forKey key: NSString) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(value, forKey: key)
    }
    
    func retriveFromUserDefaults (key: NSString) -> AnyObject? {
        let defaults = NSUserDefaults.standardUserDefaults()
        return defaults.objectForKey(key)
    }
    
    // MARK: - Validation
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailText = NSPredicate(format:"SELF MATCHES [c]%@",emailRegex)
        return (emailText.evaluateWithObject(email))
    }
    
    // MARK: - Set localize text
    func setLocalizeText (text: NSString) -> NSString {
        return LocalizeHelper.sharedLocalSystem().localizedStringForKey(text)
    }
    
    // MARK: - Date and time methods
    func convertDateToString (date: NSDate) -> NSString {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = Global.g_DateFormat
        return dateFormatter.stringFromDate(date) as NSString
    }
    
    func convertStringToDate (date: NSString) -> NSDate {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = Global.g_DateFormat
        return dateFormatter.dateFromString(date) as NSDate!
    }
    
    func removeTimeFromDate (date: NSDate) -> NSDate {
        let calendarObj: NSCalendar = NSCalendar.autoupdatingCurrentCalendar()
        
        let dateComponentsObj = calendarObj.components(.DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit , fromDate: date)
        dateComponentsObj.hour = 00;
        dateComponentsObj.minute = 00;
        dateComponentsObj.second = 00;
        
        return calendarObj.dateFromComponents(dateComponentsObj)! as NSDate
    }
    
    func getMonthFromDate (date: NSDate) -> Int {
        let components = NSCalendar.currentCalendar().components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitDay, fromDate: date)
        return components.month as Int
    }
    
    func getYearFromDate (date: NSDate) -> NSInteger {
        let components = NSCalendar.currentCalendar().components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitDay, fromDate: date)
        return components.year as NSInteger
    }
    
    // MARK: - General Methods
    func removeNull (str:NSString) -> NSString {
        if (str == "<null>" || str == "(null)" || str == "N/A" || str == "n/a") {
            return ""
        } else {
            return str
        }
    }
    
    func setPrefixHttp (str:NSString) -> NSString {
        if (str == "" || str .hasPrefix("http://") || str .hasPrefix("https://")) {
            return str
        } else {
            return "http://".stringByAppendingString(str)
        }
    }
    
    func isconnectedToNetwork() -> Bool {
       let reachability = Reachability.reachabilityForInternetConnection()
        
        if !reachability.isReachable() {
            AlertView().showAlertWithOKButton(self.setLocalizeText("keyInternetConnectionError"), withType: AJNotificationTypeRed)
        }
        
        return reachability.isReachable()
    }
    
    func getUIColorFromRBG (R rVal: CGFloat, G gVal: CGFloat, B bVal: CGFloat) -> UIColor {
        return UIColor(red: rVal/255.0, green: gVal/255.0, blue: bVal/255.0, alpha: 1.0)
    }
    
    func getUIColorFromRBGAlpha (R rVal: CGFloat, G gVal: CGFloat, B bVal: CGFloat, Alpha alpha: CGFloat) -> UIColor {
        return UIColor(red: rVal/255.0, green: gVal/255.0, blue: bVal/255.0, alpha: alpha)
    }
    
    func getSizeFromString (str: NSString, stringWidth width: CGFloat, fontname font: UIFont, minimumHeight minHeight: CGFloat) -> CGSize {
        let height: CGFloat = 100000
        let labelBounds: CGRect = str.boundingRectWithSize(CGSizeMake(width, height), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context: nil) as CGRect
        
        if(labelBounds.size.height < minHeight) {
            return CGSizeMake(CGFloat(ceilf(Float(labelBounds.size.width))), minHeight)
        }
        
        return CGSizeMake(CGFloat(ceilf(Float(labelBounds.size.width))), CGFloat(ceilf(Float(labelBounds.size.height))))
    }
}


