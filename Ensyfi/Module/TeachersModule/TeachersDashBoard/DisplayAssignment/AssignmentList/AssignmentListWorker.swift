//
//  AssignmentListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 12/10/21.
//

import Foundation
import UIKit

typealias AssignmentListresponseHandler = (_ response:AssignmentListModel.Fetch.Response) ->()

class AssignmentListWorker{
    
   var respData = [AssignmentListModels]()
    func fetch(class_id:String,dynamic_db:String,onSuccess successCallback:(AssignmentListresponseHandler)?,onFailure failureCallback: @escaping(AssignmentListresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPIAssignmentList(
        class_id:class_id,dynamic_db:dynamic_db,onSuccess: { (resp)  in
               successCallback?(AssignmentListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(AssignmentListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

