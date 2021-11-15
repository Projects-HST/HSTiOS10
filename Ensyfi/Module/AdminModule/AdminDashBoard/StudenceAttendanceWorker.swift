//
//  StudenceAttendanceWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//

import Foundation
import UIKit

typealias StudentAttendanceresponseHandler = (_ response:StudentAttendanceModel.Fetch.Response) ->()

class StudentAttendanceWorker{
    
   var respData = [StudentAttendanceModels]()
   func fetch(class_id:String,stud_id:String,dynamic_db:String, onSuccess successCallback:(StudentAttendanceresponseHandler)?,onFailure failureCallback: @escaping(StudentAttendanceresponseHandler)) {
       let manager = APIManager()
       manager.callAPIStudentAttendance(
        class_id:class_id,stud_id:stud_id,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(StudentAttendanceModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(StudentAttendanceModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}


