//
//  LoginWorker.swift
//  Ensyfi
//
//  Created by HappysanziMac on 19/08/21.
//

import Foundation
import UIKit

typealias responseHandler = (_ response:LoginModel.Fetch.Response) ->()

class LoginWorker{

   func fetch(institue_id:String, onSuccess successCallback:(responseHandler)?,onFailure failureCallback: @escaping(responseHandler)) {
       let manager = APIManager()
       manager.callAPILogin(
        institue_id:institue_id, onSuccess: { (resp)  in
               successCallback?(LoginModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(LoginModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}
