//
//  TeacherGroupTypeListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//


import Foundation
import UIKit

typealias TeacherGroupTypleListresponseHandler = (_ response:TeacherGroupTypleListModel.Fetch.Response) ->()

class TeacherGroupTypleListWorker{
    
   var respData = [TeacherGroupTypleListModels]()
    func fetch(user_id:String,user_type:String,onSuccess successCallback:(TeacherGroupTypleListresponseHandler)?,onFailure failureCallback: @escaping(TeacherGroupTypleListresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPITeacherGroupTypleList(
        user_id:user_id,user_type:user_type,onSuccess: { (resp)  in
               successCallback?(TeacherGroupTypleListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(TeacherGroupTypleListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
