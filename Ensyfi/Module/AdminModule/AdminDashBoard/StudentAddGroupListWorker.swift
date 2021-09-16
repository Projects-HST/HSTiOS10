//
//  StudentAddGroupListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//

import Foundation
import UIKit

typealias StudentGroupAddListresponseHandler = (_ response:StudentGroupAddListModel.Fetch.Response) ->()

class StudentGroupAddListWorker{
    
   var respData = [StudentGroupAddListModels]()
    func fetch(group_id:String,group_user_type:String,class_id:String, onSuccess successCallback:(StudentGroupAddListresponseHandler)?,onFailure failureCallback: @escaping(StudentGroupAddListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIStudentGroupAddList(
        group_id:group_id,group_user_type:group_user_type,class_id:class_id, onSuccess: { (resp)  in
               successCallback?(StudentGroupAddListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(StudentGroupAddListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
