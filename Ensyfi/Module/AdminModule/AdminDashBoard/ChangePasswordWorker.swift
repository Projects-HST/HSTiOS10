//
//  Change PasswordWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/09/21.
//

import Foundation
import UIKit

typealias ChangePasswordresponseHandler = (_ response:ChangePasswordModel.Fetch.Response) ->()

class ChangePasswordWorker{

   func fetch(user_id:String,old_password:String,password:String,dynamic_db:String,onSuccess successCallback:(ChangePasswordresponseHandler)?,onFailure failureCallback: @escaping(ChangePasswordresponseHandler)) {
       let manager = APIManager()
       manager.callAPIChangePassword(
        user_id:user_id, old_password:old_password,password:password,dynamic_db:dynamic_db,onSuccess: { (resp)  in
               successCallback?(ChangePasswordModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ChangePasswordModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}
