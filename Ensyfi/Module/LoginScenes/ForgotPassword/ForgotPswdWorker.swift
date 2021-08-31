//
//  ForgotPswdWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 23/08/21.
//


import Foundation
import UIKit

typealias ForgotPasswordresponseHandler = (_ response:ForgotPasswordModel.Fetch.Response) ->()

class ForgotPasswordWorker{

   func fetch(userName:String, onSuccess successCallback:(ForgotPasswordresponseHandler)?,onFailure failureCallback: @escaping(ForgotPasswordresponseHandler)) {
       let manager = APIManager()
       manager.callAPIForgotPassword(
        userName:userName, onSuccess: { (resp)  in
               successCallback?(ForgotPasswordModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ForgotPasswordModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}
