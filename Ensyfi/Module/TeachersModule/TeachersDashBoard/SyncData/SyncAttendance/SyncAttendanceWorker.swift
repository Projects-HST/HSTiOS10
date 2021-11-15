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

   func fetch(ac_year:String,class_id:String,class_total:String,no_of_present:String,no_of_absent:String,attendence_period:String,created_by:String,created_at:String,status:String,dynamic_db:String, onSuccess successCallback:(SyncAttendanceresponseHandler)?,onFailure failureCallback: @escaping(SyncAttendanceresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPISyncAttendance(
        ac_year:ac_year, class_id:class_id,class_total:class_total, no_of_present:no_of_present,no_of_absent:no_of_absent,attendence_period:attendence_period, created_by:created_by,created_at:created_at, status:status,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(SyncAttendanceModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(SyncAttendanceModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

