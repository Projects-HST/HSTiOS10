//
//  StaffsAddGroupListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 17/09/21.
//

import Foundation
import UIKit

typealias StaffGroupAddListresponseHandler = (_ response:StaffGroupAddListModel.Fetch.Response) ->()

class StaffGroupAddListWorker{
    
   var respData = [StaffGroupAddListModels]()
    func fetch(group_id:String,group_user_type:String,class_id:String,dynamic_db:String, onSuccess successCallback:(StaffGroupAddListresponseHandler)?,onFailure failureCallback: @escaping(StaffGroupAddListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIStaffGroupAddList(
        group_id:group_id,group_user_type:group_user_type,class_id:class_id,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(StaffGroupAddListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(StaffGroupAddListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

