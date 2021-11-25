//
//  TimeTableListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/10/21.
//


import Foundation
import UIKit

typealias TimeTableListresponseHandler = (_ response:TimeTableListModel.Fetch.Response) ->()

class TimeTableListWorker{
    
   var respData = [TimeTableListModels]()
   func fetch(class_id:String,dynamic_db:String,from:String, onSuccess successCallback:(TimeTableListresponseHandler)?,onFailure failureCallback: @escaping(TimeTableListresponseHandler)) {
       let manager = StudentsAPIManager()
       manager.callAPITimeTableList(
        class_id:class_id,dynamic_db:dynamic_db,from:from, onSuccess: { (resp)  in
               successCallback?(TimeTableListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(TimeTableListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}


