//
//  AssignmentOverViewWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 12/10/21.
//

import Foundation
import UIKit

typealias AssignmentOverViewresponseHandler = (_ response:AssignmentOverViewModel.Fetch.Response) ->()

class AssignmentOverViewWorker{
    
   var respData = [AssignmentOverViewModels]()
    func fetch(class_id:String,hw_date:String,dynamic_db:String, onSuccess successCallback:(AssignmentOverViewresponseHandler)?,onFailure failureCallback: @escaping(AssignmentOverViewresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPIAssignmentOverView(
        class_id:class_id,hw_date:hw_date,dynamic_db:dynamic_db,onSuccess: { (resp)  in
               successCallback?(AssignmentOverViewModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(AssignmentOverViewModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}


