//
//  Global.swift
//  SwiftDemo
//
//  Created by TopsTech on 02/03/2015.
//  Copyright (c) 2015 tops. All rights reserved.
//
// change by ilesh panchal....:)
struct Global {
    
    // API base Url
//    static let g_APIBaseURL = "http://192.168.0.33/availability_manager/trunk/ws/"  //Ruchi
//    static let g_APIBaseURL = "http://192.168.0.28/availability_manager/trunk/ws/"  //Meet
//    static let g_APIBaseURL = "http://192.168.0.14/availability_manager/trunk/ws/"  //Kaushik
    static let g_APIBaseURL = "http://topsdemo.in/mit/availability_manager/ws/"   //Topsdemo
    
    
    static let g_AppName = "Nimble"
    static let g_DateFormat = "yyyy-MM-dd"
    
    static let g_WidthSideBarLeft: CGFloat = 280.0
    
    struct g_UserData {
        static let g_UserId = "loginUserId"
        static let g_dictUserData = "dictLoginuserdata"
    }
    
    struct g_Font {
        static let g_Lato_Light = "Lato-Light"
        static let g_Lato_Regular = "Lato-Regular"
        static let g_Lato_LightItalic = "Lato-LightItalic"
    }
    
    struct g_UserDefaultKey {
        static let g_isUserLogin = "isUserLogin"
    }
    
    struct g_NSNotificationKey {
        static let g_LogoutKey = "100"
        static let g_NextMonthKey = "200"
        static let g_PreviousMonthKey = "300"
        static let g_SetViewControllerKey = "400"
        static let g_SetSelectedImageKey = "500"
        static let g_AddNotificationKey = "600"
        static let g_DeleteBriefKey = "700"
    }
    
    struct g_ViewController {
        static let g_LoginVC = "LoginVC"
        static let g_ForgotPasswordVC = "ForgotPasswordVC"
        static let g_AvailabilityVC = "AvailabilityVC"
        static let g_BriefsVC = "BriefsVC"
        static let g_NotificationVC = "NotificationVC"
        static let g_MyProfileVC = "MyProfileVC"
    }
    
    struct directoryPath {
        static let Documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        static let Tmp = NSTemporaryDirectory()
    }
    
    //Device Compatibility
    struct is_Device {
        static let _iPhone = (UIDevice.currentDevice().model as NSString).isEqualToString("iPhone") ? true : false
        static let _iPad = (UIDevice.currentDevice().model as NSString).isEqualToString("iPad") ? true : false
        static let _iPod = (UIDevice.currentDevice().model as NSString).isEqualToString("iPod touch") ? true : false
    }
    //IOS Version Compatibility
    struct is_Ios {
        
        static let _8 = ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0) ? true : false
        static let _7 = ((UIDevice.currentDevice().systemVersion as NSString).floatValue >= 7.0 && (UIDevice.currentDevice().systemVersion as NSString).floatValue < 8.0) ? true : false
        static let _6 = ((UIDevice.currentDevice().systemVersion as NSString).floatValue <= 6.0 ) ? true : false
    }
    
    //Display Size Compatibility
    struct is_Iphone {
        static let _6p = (UIScreen.mainScreen().bounds.size.height >= 736.0 ) ? true : false
        static let _6 = (UIScreen.mainScreen().bounds.size.height <= 667.0 && UIScreen.mainScreen().bounds.size.height > 568.0) ? true : false
        static let _5 = (UIScreen.mainScreen().bounds.size.height <= 568.0 && UIScreen.mainScreen().bounds.size.height > 480.0) ? true : false
        static let _4 = (UIScreen.mainScreen().bounds.size.height <= 480.0) ? true : false
    }
}