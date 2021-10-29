//
//  TeacherLeaveListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/10/21.
//

import Foundation
import UIKit

typealias TeacherLeavesListresponseHandler = (_ response:TeacherLeavesListModel.Fetch.Response) ->()

class TeacherLeavesListWorker{
    
   var respData = [TeacherLeavesListModels]()
    func fetch(user_id:String, onSuccess successCallback:(TeacherLeavesListresponseHandler)?,onFailure failureCallback: @escaping(TeacherLeavesListresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPITeacherLeavesList(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(TeacherLeavesListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(TeacherLeavesListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

                                  
