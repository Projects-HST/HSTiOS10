//
//  ApplyLeaveRequestWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/10/21.
//

import Foundation
import UIKit

typealias ApplyLeaveRequestresponseHandler = (_ response:ApplyLeaveRequestModel.Fetch.Response) ->()

class ApplyLeaveRequestWorker{

   func fetch(user_type:String,user_id:String,leave_master_id:String,leave_type:String,date_from:String,date_to:String,fromTime:String,toTime:String,description:String,dynamic_db:String, onSuccess successCallback:(ApplyLeaveRequestresponseHandler)?,onFailure failureCallback: @escaping(ApplyLeaveRequestresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPIApplyLeaveRequest(
        user_type:user_type, user_id:user_id,leave_master_id:leave_master_id, leave_type:leave_type,date_from:date_from, date_to:date_to,fromTime:fromTime,toTime:toTime,description:description,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(ApplyLeaveRequestModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ApplyLeaveRequestModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

