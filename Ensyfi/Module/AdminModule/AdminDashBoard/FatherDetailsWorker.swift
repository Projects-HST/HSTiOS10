//
//  ParentDetailsWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation
import UIKit

typealias FatherDeatilsresponseHandler = (_ response:FatherDeatilsModel.Fetch.Response) ->()

class FatherDeatilsWorker{

   func fetch(admission_id:String,dynamic_db:String, onSuccess successCallback:(FatherDeatilsresponseHandler)?,onFailure failureCallback: @escaping(FatherDeatilsresponseHandler)) {
       let manager = APIManager()
       manager.callAPIFatherDeatils(
        admission_id:admission_id,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(FatherDeatilsModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(FatherDeatilsModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

