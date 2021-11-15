//
//  InstituteLoginWorker.swift
//  Ensyfi
//
//  Created by HappysanziMac on 19/08/21.
//

import Foundation
import UIKit

typealias InstituteLoginresponseHandler = (_ response:InstituteLoginModel.Fetch.Response) ->()

class InstituteLoginWorker{

   func fetch(institue_code:String,userName:String,password:String,dynamic_db:String, onSuccess successCallback:(InstituteLoginresponseHandler)?,onFailure failureCallback: @escaping(InstituteLoginresponseHandler)) {
       let manager = APIManager()
       manager.callAPIInstituteLogin(
        institue_code:institue_code,userName:userName,password:password,dynamic_db:dynamic_db,  onSuccess: { (resp)  in
               successCallback?(InstituteLoginModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(InstituteLoginModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

