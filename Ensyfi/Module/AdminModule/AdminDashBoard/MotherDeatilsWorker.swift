//
//  MotherDeatilsWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//

import Foundation
import UIKit

typealias MotherDetailsresponseHandler = (_ response:MotherDetailsModel.Fetch.Response) ->()

class MotherDetailsWorker{

   func fetch(admission_id:String,dynamic_db:String, onSuccess successCallback:(MotherDetailsresponseHandler)?,onFailure failureCallback: @escaping(MotherDetailsresponseHandler)) {
       let manager = APIManager()
       manager.callAPIMotherDetails(
        admission_id:admission_id,dynamic_db:dynamic_db,onSuccess: { (resp)  in
               successCallback?(MotherDetailsModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(MotherDetailsModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}
