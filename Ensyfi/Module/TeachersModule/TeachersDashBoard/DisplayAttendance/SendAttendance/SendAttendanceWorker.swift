//
//  SendAttendanceWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 18/10/21.
//

import Foundation
import UIKit

typealias SendAttendanceresponseHandler = (_ response:SendAttendanceModel.Fetch.Response) ->()

class SendAttendanceWorker{

   func fetch(attend_id:String,msg_type:String,dynamic_db:String, onSuccess successCallback:(SendAttendanceresponseHandler)?,onFailure failureCallback: @escaping(SendAttendanceresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPISendAttendance(
        attend_id:attend_id, msg_type:msg_type, dynamic_db:dynamic_db,onSuccess: { (resp)  in
               successCallback?(SendAttendanceModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(SendAttendanceModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}


