//
//  TeacherDetailsWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//

import Foundation
import UIKit

typealias TeacherDetailsresponseHandler = (_ response:TeacherDetailsModel.Fetch.Response) ->()

class TeacherDetailsWorker{
    
   var respData = [TeacherDetailsModels]()
   func fetch(teacher_id:String, onSuccess successCallback:(TeacherDetailsresponseHandler)?,onFailure failureCallback: @escaping(TeacherDetailsresponseHandler)) {
       let manager = APIManager()
       manager.callAPITeacherDetails(
        teacher_id:teacher_id, onSuccess: { (resp)  in
               successCallback?(TeacherDetailsModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(TeacherDetailsModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}



