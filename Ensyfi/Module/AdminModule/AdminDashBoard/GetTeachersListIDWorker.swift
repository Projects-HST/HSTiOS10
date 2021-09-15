//
//  GetTeachersListIDWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//

import Foundation
import UIKit

typealias TeacherListIDresponseHandler = (_ response:TeacherListIDModel.Fetch.Response) ->()

class TeacherListIDWorker{
    
   var respData = [TeacherListIDModels]()
    func fetch(user_id:String,user_type:String, onSuccess successCallback:(TeacherListIDresponseHandler)?,onFailure failureCallback: @escaping(TeacherListIDresponseHandler)) {
       let manager = APIManager()
       manager.callAPITeacherListID(
        user_id:user_id,user_type:user_type, onSuccess: { (resp)  in
               successCallback?(TeacherListIDModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(TeacherListIDModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
