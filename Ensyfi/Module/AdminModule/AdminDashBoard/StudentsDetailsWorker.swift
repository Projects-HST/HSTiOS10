//
//  StudentsDetailsWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/08/21.
//
import Foundation
import UIKit

typealias StudentDetailsresponseHandler = (_ response:StudentDetailsModel.Fetch.Response) ->()

class StudentDetailsWorker{
    
   var respData = [StudentDetailsModels]()
   func fetch(student_id:String,dynamic_db:String, onSuccess successCallback:(StudentDetailsresponseHandler)?,onFailure failureCallback: @escaping(StudentDetailsresponseHandler)) {
       let manager = APIManager()
       manager.callAPIStudentDetails(
        student_id:student_id,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(StudentDetailsModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(StudentDetailsModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}




