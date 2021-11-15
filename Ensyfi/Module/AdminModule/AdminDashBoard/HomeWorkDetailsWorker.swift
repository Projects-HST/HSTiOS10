//
//  HomeWorkDetailsWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//

import Foundation
import UIKit

typealias HomeWorkDetailsresponseHandler = (_ response:HomeWorkDetailsModel.Fetch.Response) ->()

class HomeWorkDetailsWorker{
    
   var respData = [HomeWorkDetailsModels]()
   func fetch(class_id:String,hw_type:String,dynamic_db:String, onSuccess successCallback:(HomeWorkDetailsresponseHandler)?,onFailure failureCallback: @escaping(HomeWorkDetailsresponseHandler)) {
       let manager = APIManager()
       manager.callAPIHomeWorkDetails(
        class_id:class_id,hw_type:hw_type,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(HomeWorkDetailsModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(HomeWorkDetailsModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}


