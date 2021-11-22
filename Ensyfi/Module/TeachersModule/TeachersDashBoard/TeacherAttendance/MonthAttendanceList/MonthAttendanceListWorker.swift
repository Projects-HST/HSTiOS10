//
//  MonthAttendanceListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/11/21.
//

import Foundation
import UIKit

typealias MonthAttendanceListresponseHandler = (_ response:MonthAttendanceListModel.Fetch.Response) ->()

class MonthAttendanceListWorker{
    
   var respData = [MonthAttendanceListModels]()
    func fetch(class_id:String,dynamic_db:String,disp_type:String,disp_date:String,month_year:String,onSuccess successCallback:(MonthAttendanceListresponseHandler)?,onFailure failureCallback: @escaping(MonthAttendanceListresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPIMonthAttendanceList(
        class_id:class_id,dynamic_db:dynamic_db,disp_type:disp_type,disp_date:disp_date,month_year:month_year, onSuccess: { (resp)  in
               successCallback?(MonthAttendanceListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(MonthAttendanceListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
