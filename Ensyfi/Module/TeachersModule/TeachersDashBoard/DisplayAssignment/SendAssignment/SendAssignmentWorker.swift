//
//  SendAssignmentWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 18/10/21.
//

import Foundation
import UIKit

typealias SendAssignmentresponseHandler = (_ response:SendAssignmentModel.Fetch.Response) ->()

class SendAssignmentWorker{

   func fetch(attend_id:String,msg_type:String, onSuccess successCallback:(SendAssignmentresponseHandler)?,onFailure failureCallback: @escaping(SendAssignmentresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPISendAssignment(
        attend_id:attend_id, msg_type:msg_type,onSuccess: { (resp)  in
               successCallback?(SendAssignmentModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(SendAssignmentModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

