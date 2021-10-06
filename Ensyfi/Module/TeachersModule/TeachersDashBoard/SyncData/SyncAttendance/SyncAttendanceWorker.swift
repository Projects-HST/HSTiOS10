//
//  SyncAttendanceWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 06/10/21.
//

import Foundation
import UIKit

typealias SyncAttendanceresponseHandler = (_ response:SyncAttendanceModel.Fetch.Response) ->()

class SyncAttendanceWorker{

   func fetch(user_id:String,group_title:String,group_lead_id:String,status:String,group_id:String, onSuccess successCallback:(SyncAttendanceresponseHandler)?,onFailure failureCallback: @escaping(SyncAttendanceresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPISyncAttendance(
        user_id:user_id, group_title:group_title,group_lead_id:group_lead_id, status:status,group_id:group_id, onSuccess: { (resp)  in
               successCallback?(SyncAttendanceModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(SyncAttendanceModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}


