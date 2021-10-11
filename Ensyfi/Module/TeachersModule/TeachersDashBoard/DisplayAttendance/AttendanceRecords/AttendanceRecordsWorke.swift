//
//  OverViewAttendanceWorke.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 11/10/21.
//

import Foundation
import UIKit

typealias AttendanceRecordListresponseHandler = (_ response:AttendanceRecordListModel.Fetch.Response) ->()

class AttendanceRecordListWorker{
    
   var respData = [AttendanceRecordListModels]()
    func fetch(class_id:String,attend_id:String, onSuccess successCallback:(AttendanceRecordListresponseHandler)?,onFailure failureCallback: @escaping(AttendanceRecordListresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPIAttendanceRecordList(
        class_id:class_id,attend_id:attend_id, onSuccess: { (resp)  in
               successCallback?(AttendanceRecordListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(AttendanceRecordListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
