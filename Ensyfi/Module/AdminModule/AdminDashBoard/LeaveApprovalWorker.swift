//
//  LeaveApprovalWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/09/21.
//

import Foundation
import UIKit

typealias LeaveApprovalresponseHandler = (_ response:LeaveApprovalModel.Fetch.Response) ->()

class LeaveApprovalWorker{

   func fetch(status:String,leave_id:String,dynamic_db:String, onSuccess successCallback:(LeaveApprovalresponseHandler)?,onFailure failureCallback: @escaping(LeaveApprovalresponseHandler)) {
       let manager = APIManager()
       manager.callAPILeaveApproval(
        status:status, leave_id:leave_id,dynamic_db:dynamic_db,  onSuccess: { (resp)  in
               successCallback?(LeaveApprovalModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(LeaveApprovalModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

