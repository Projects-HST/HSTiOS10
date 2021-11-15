//
//  LeaveTypeListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/10/21.
//

import Foundation
import UIKit

typealias TeacherLeavesRequestresponseHandler = (_ response:TeacherLeavesRequestModel.Fetch.Response) ->()

class TeacherLeavesRequestWorker{
    
   var respData = [TeacherLeavesRequestModels]()
    func fetch(user_id:String,dynamic_db:String,onSuccess successCallback:(TeacherLeavesRequestresponseHandler)?,onFailure failureCallback: @escaping(TeacherLeavesRequestresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPITeacherLeavesRequest(
        user_id:user_id,dynamic_db:dynamic_db,onSuccess: { (resp)  in
               successCallback?(TeacherLeavesRequestModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(TeacherLeavesRequestModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

                                  

