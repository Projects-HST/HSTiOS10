//
//  TeacherGroupListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import Foundation
import UIKit

typealias TeacherGroupListresponseHandler = (_ response:TeacherGroupListModel.Fetch.Response) ->()

class TeacherGroupListWorker{
    
   var respData = [TeacherGroupListModels]()
    func fetch(user_id:String,user_type:String,onSuccess successCallback:(TeacherGroupListresponseHandler)?,onFailure failureCallback: @escaping(TeacherGroupListresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPITeacherGroupList(
        user_id:user_id,user_type:user_type,onSuccess: { (resp)  in
               successCallback?(TeacherGroupListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(TeacherGroupListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

