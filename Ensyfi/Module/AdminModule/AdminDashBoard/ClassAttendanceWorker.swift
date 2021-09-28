//
//  ClassAttendanceWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//
import Foundation
import UIKit

typealias ClassAttendanceListresponseHandler = (_ response:ClassAttendanceListModel.Fetch.Response) ->()

class ClassAttendanceListWorker{
    
   var respData = [ClassAttendanceListModels]()
   func fetch(date:String,class_ids:String, onSuccess successCallback:(ClassAttendanceListresponseHandler)?,onFailure failureCallback: @escaping(ClassAttendanceListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIClassAttendanceList(
        date:date,class_ids:class_ids, onSuccess: { (resp)  in
               successCallback?(ClassAttendanceListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ClassAttendanceListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
