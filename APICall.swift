//
//  APICall.swift
//  AvailabilityManager_Freelancer
//
//  Created by TopsTech on 04/03/2015.
//  Copyright (c) 2015 tops. All rights reserved.
//

//code by dipen

import UIKit

class APICall :NSObject {
   
    class var sharedAPICall: APICall {
    struct Static {
        static var instance: APICall?
        static var token: dispatch_once_t = 0
        }
        dispatch_once(&Static.token) {
            Static.instance = APICall()
        }
        return Static.instance!
    }
    
    func callApiUsingGET (urlPath: NSString, withLoader showLoader: Bool, successBlock success:(responceData:AnyObject)->Void) {
        if(!StaticClass().isconnectedToNetwork()) {
            return;
        }
        if(showLoader) {
           // AppDelegate().startSpinerWithOverlay(true);
        }
        
        let manager = AFHTTPRequestOperationManager()
        manager.GET(urlPath, parameters: nil, success: {
            (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
            
            if(showLoader) {
              //  AppDelegate().stopSpiner();
            }
            success(responceData: responseObject)
            }, failure: {
                (operation: AFHTTPRequestOperation!, error: NSError!) in
                
                if(showLoader) {
                  //  AppDelegate().stopSpiner();
                }
                AlertView().showAlertWithOKButton(error.localizedDescription, withType: AJNotificationTypeRed)
        })
    }
    
    func callApiUsingPOST (urlPath: NSString, withParameter dictData: NSMutableDictionary, withLoader showLoader: Bool, successBlock success:(responceData:AnyObject)->Void) {
        if(!StaticClass().isconnectedToNetwork()) {
            return;
        }
        if(showLoader) {
           // AppDelegate().startSpinerWithOverlay(true);
        }
        
        let manager = AFHTTPRequestOperationManager()
        manager.POST(urlPath,
            parameters: dictData,
            success: {
                (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                
                if(showLoader) {
               //     AppDelegate().stopSpiner();
                }
                success(responceData: responseObject)
            },
            failure: {
                (operation: AFHTTPRequestOperation!, error: NSError!) in
                
                if(showLoader) {
                 //   AppDelegate().stopSpiner();
                }
                AlertView().showAlertWithOKButton(error.localizedDescription, withType: AJNotificationTypeRed)
        })
    }
    
    func callApiImageUsingPOST (urlPath: NSString, withParameter dictData: NSMutableDictionary,withImage image:UIImage,withTag tag:NSString, withLoader showLoader: Bool, successBlock success:(responceData:AnyObject)->Void) {
    
        if(!StaticClass().isconnectedToNetwork()) {
            return;
        }
        if(showLoader) {
            // AppDelegate().startSpinerWithOverlay(true);
        }
        let imageData :NSData = UIImageJPEGRepresentation(image, 0.5);
        let manager = AFHTTPRequestOperationManager()
        let op :AFHTTPRequestOperation  = manager.POST(urlPath, parameters: dictData, constructingBodyWithBlock: { (formData:AFMultipartFormData!) -> Void in
            formData.appendPartWithFileData(imageData, name: tag, fileName: "photo.jpg", mimeType: "image/jpeg")
            }, success: { (operation: AFHTTPRequestOperation!, responseObject:AnyObject!) -> Void in
                if(showLoader) {
                    //     AppDelegate().stopSpiner();
                }
                success(responceData: responseObject)
        }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
            if(showLoader) {
                //   AppDelegate().stopSpiner();
            }
            AlertView().showAlertWithOKButton(error.localizedDescription, withType: AJNotificationTypeRed)
        }
    }
}