//
//  LeaveListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/09/21.
//

import Foundation
import UIKit

typealias LeavesListresponseHandler = (_ response:LeavesListModel.Fetch.Response) ->()

class LeavesListWorker{
    
   var respData = [LeavesListModels]()
    func fetch(user_id:String, onSuccess successCallback:(LeavesListresponseHandler)?,onFailure failureCallback: @escaping(LeavesListresponseHandler)) {
       let manager = APIManager()
       manager.callAPILeavesList(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(LeavesListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(LeavesListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

