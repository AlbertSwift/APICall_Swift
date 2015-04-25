//
//  Singleton.swift
//  Demo_Second_Swift
//
//  Created by Tops on 14/02/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

import UIKit

@objc class Singleton
{
    var arrAvailability: NSMutableArray = NSMutableArray()
    var arrBriefs: NSMutableArray = NSMutableArray()
    
    var intSelectedProfile: Int = 0
    var intSelectedBriefTab: Int = 0
    
    var strDeviceToken: NSString = ""
    var strTeamId: NSString = ""
    var strCurrentViewController: NSString = ""
    var strBriefId: NSString = ""
    
    var dateServerDate: NSDate = NSDate()
    
    class var sharedSingleton: Singleton {
        struct Static {
            static var instance: Singleton?
            static var token: dispatch_once_t = 0
        }
        dispatch_once(&Static.token) {
            Static.instance = Singleton()
        }
        return Static.instance!
    }
    
    // MARK: - Int
    func setIntSelectedProfile (value: Int) {
        intSelectedProfile = value
    }
    func getIntSelectedProfile () -> Int {
        return intSelectedProfile
    }
    
    func setIntSelectedBriefTab (value: Int) {
        intSelectedBriefTab = value
    }
    func getIntSelectedBriefTab () -> Int {
        return intSelectedBriefTab
    }
    
    // MARK: - NSString
    func setStrDeviceToken (str: NSString) {
        strDeviceToken = str
    }
    func getStrDeviceToken () -> NSString {
        return strDeviceToken
    }
    
    func setStrTeamId (str: NSString) {
        strTeamId = str
    }
    func getStrTeamId () -> NSString {
        return strTeamId
    }
    
    func setStrBriefId (str: NSString) {
        strBriefId = str
    }
    func getStrBriefId () -> NSString {
        return strBriefId
    }
    
    func setStrCurrentViewController (str: NSString) {
        strCurrentViewController = str
    }
    func getStrCurrentViewController () -> NSString {
        return strCurrentViewController
    }
    
    // MARK: - Date
    func setDateServerDate (date: NSDate) {
        dateServerDate = date
    }
    func getDateServerDate () -> NSDate {
        return dateServerDate
    }
    
    // MARK: - Array
    func setArrAvailability (arr: NSMutableArray) {
        arrAvailability = NSMutableArray(array: arr)
    }
    func getArrAvailability () -> NSMutableArray {
        return arrAvailability
    }
    
    func setArrBriefs (arr: NSMutableArray) {
        arrBriefs = NSMutableArray(array: arr)
    }
    func getArrBriefs () -> NSMutableArray {
        return arrBriefs
    }
    
    // MARK: - Other
    func openViewController (viewControllerName: NSString) {
        let dictData :NSDictionary = NSDictionary(objectsAndKeys: viewControllerName, "viewControllerName")
        NSNotificationCenter.defaultCenter().postNotificationName(Global.g_NSNotificationKey.g_SetViewControllerKey, object: nil, userInfo: dictData)
    }
    
    func getClrSelectedDay (intValue: Int) -> UIColor {
        if(intValue == 100) {   // for assign brief     //16, 78, 139
            return StaticClass().getUIColorFromRBG(R: 78, G: 117, B: 156)
        } else if(intValue == 1) {  // click on available
            return StaticClass().getUIColorFromRBG(R: 101, G: 211, B: 90)
        } else if(intValue == 3) { // click on on holiday
            return StaticClass().getUIColorFromRBG(R: 52, G: 198, B: 213)
        } else { // click on busy
            return StaticClass().getUIColorFromRBG(R: 240, G: 80, B: 51)
        }
    }
    
    func canUserSelectDate (date: NSDate, array arrShare: NSMutableArray) -> Bool {
        var intCurrentMonth: Int = StaticClass().getMonthFromDate(Singleton.sharedSingleton.getDateServerDate() as NSDate)  // use current Date
        var intSelectedMonth: Int = StaticClass().getMonthFromDate(date)
        
        var intCurrentYear: NSInteger = StaticClass().getYearFromDate(Singleton.sharedSingleton.getDateServerDate() as NSDate)  // use current Date
        var intSelectedYear: NSInteger = StaticClass().getYearFromDate(date)
        
        for var i:Int = 0; i<2; i++ {       // user can set availability only for current month and next month
            if intCurrentMonth == intSelectedMonth {
                if intCurrentYear == intSelectedYear {
                    
                    var strSelectedDate: NSString = StaticClass().convertDateToString(date)
                    
                    for share in arrShare {
                        let shareObj = share as ShareAvailability
                        if(shareObj.strDate == strSelectedDate && shareObj.strType == "100") {
                            return false
                        }
                    }
                    
                    return true
                }
            }
            intCurrentMonth++
            if intCurrentMonth > 12 {
                intCurrentMonth = 1;
                intCurrentYear++
            }
        }
        
        return false
    }
}
