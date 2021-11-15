//
//  StudentsONDutyWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 23/10/21.
//

import Foundation
import UIKit

typealias StudentsONDutyresponseHandler = (_ response:StudentsONDutyModel.Fetch.Response) ->()

class StudentsONDutyWorker{
    
   var respData = [StudentsONDutyModels]()
   func fetch(user_id:String,user_type:String,dynamic_db:String, onSuccess successCallback:(StudentsONDutyresponseHandler)?,onFailure failureCallback: @escaping(StudentsONDutyresponseHandler)) {
       let manager = StudentsAPIManager()
       manager.callAPIStudentsONDuty(
        user_id:user_id,user_type:user_type, dynamic_db:dynamic_db,onSuccess: { (resp)  in
               successCallback?(StudentsONDutyModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(StudentsONDutyModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

