//
//  ODApprovallWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation
import UIKit

typealias ODApprovalresponseHandler = (_ response:ODApprovalModel.Fetch.Response) ->()

class ODApprovalWorker{

   func fetch(status:String,od_id:String,dynamic_db:String, onSuccess successCallback:(ODApprovalresponseHandler)?,onFailure failureCallback: @escaping(ODApprovalresponseHandler)) {
       let manager = APIManager()
       manager.callAPIODApproval(
        status:status, od_id:od_id,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(ODApprovalModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ODApprovalModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

