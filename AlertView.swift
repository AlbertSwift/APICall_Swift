//
//  AlertView.swift
//  Demo_Second_Swift
//
//  Created by Tops on 14/02/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

import UIKit

class AlertView :NSObject, UIAlertViewDelegate
{
    let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    
    class var sharedAlertView: AlertView {
        struct Static {
            static var instance: AlertView?
            static var token: dispatch_once_t = 0
        }
        dispatch_once(&Static.token) {
            Static.instance = AlertView()
        }
        return Static.instance!
    }
    
    func showAlertWithOKButton (message: NSString, withType type: AJNotificationType) {
        AJNotificationView.showNoticeInView(appDelegate.window, type: type, title: self.checkAPIError(message), hideAfter: 3)
    }
    
    func showAlertWithTitle (message: NSString, ok okButton: NSString, cancel cancelButton: NSString, tag tagValue: Int) {
        let alert: UIAlertView = UIAlertView(title: Global.g_AppName, message: self.checkAPIError(message), delegate: self, cancelButtonTitle: cancelButton, otherButtonTitles: okButton)
        alert.tag = tagValue
        alert.show()
    }
    
    func checkAPIError (message: NSString) -> NSString {
        AJNotificationView.hideCurrentNotificationViewAndClearQueue()
        if(message == "") {
            return StaticClass().setLocalizeText("keyAPIError")
        }
        return message
    }
    
    // MARK: - Alertview Delegate Methods
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if(buttonIndex == 1) {
            NSNotificationCenter.defaultCenter().postNotificationName("\(alertView.tag)", object: nil)
        }
    }
}
