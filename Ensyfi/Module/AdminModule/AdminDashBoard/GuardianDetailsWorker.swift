//
//  GuardianDetailsWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//

import Foundation
import UIKit

typealias GuardianDetailsresponseHandler = (_ response:GuardianDetailsModel.Fetch.Response) ->()

class GuardianDetailsWorker{

   func fetch(admission_id:String, onSuccess successCallback:(GuardianDetailsresponseHandler)?,onFailure failureCallback: @escaping(GuardianDetailsresponseHandler)) {
       let manager = APIManager()
       manager.callAPIGuardianDetails(
        admission_id:admission_id, onSuccess: { (resp)  in
               successCallback?(GuardianDetailsModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(GuardianDetailsModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}
