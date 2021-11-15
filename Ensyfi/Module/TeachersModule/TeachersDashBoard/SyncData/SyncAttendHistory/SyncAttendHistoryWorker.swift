//
//  SyncAttendHistoryWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 09/11/21.
//

import Foundation
import UIKit

typealias SyncAttendanceHistoryresponseHandler = (_ response:SyncAttendanceHistoryModel.Fetch.Response) ->()

class SyncAttendanceHistoryWorker{

   func fetch(attend_id:String,class_id:String,student_id:String,abs_date:String,a_status:String,attend_period:String,a_val:String,a_taken_by:String,created_at:String,status:String,dynamic_db:String, onSuccess successCallback:(SyncAttendanceHistoryresponseHandler)?,onFailure failureCallback: @escaping(SyncAttendanceHistoryresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPISyncAttendanceHistory(
        attend_id:attend_id,class_id:class_id,student_id:student_id,abs_date:abs_date, a_status:a_status, attend_period:attend_period,a_val:a_val,a_taken_by:a_taken_by, created_at:created_at,status:status,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(SyncAttendanceHistoryModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(SyncAttendanceHistoryModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

