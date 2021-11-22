//
//  DayMonthAttendListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 17/11/21.
//

import Foundation
import UIKit

typealias DayMonthAttendanceListresponseHandler = (_ response:DayMonthAttendanceListModel.Fetch.Response) ->()

class DayMonthAttendanceListWorker{
    
   var respData = [DayMonthAttendanceListModels]()
    func fetch(class_id:String,dynamic_db:String,disp_type:String,disp_date:String,month_year:String,onSuccess successCallback:(DayMonthAttendanceListresponseHandler)?,onFailure failureCallback: @escaping(DayMonthAttendanceListresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPIDayMonthAttendanceList(
        class_id:class_id,dynamic_db:dynamic_db,disp_type:disp_type,disp_date:disp_date,month_year:month_year, onSuccess: { (resp)  in
               successCallback?(DayMonthAttendanceListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(DayMonthAttendanceListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
