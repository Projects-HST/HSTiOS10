//
//  RoleListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//

import Foundation
import UIKit

typealias RoleListresponseHandler = (_ response:RoleListModel.Fetch.Response) ->()

class RoleListWorker{
    
   var respData = [RoleListModels]()
    func fetch(user_id:String, onSuccess successCallback:(RoleListresponseHandler)?,onFailure failureCallback: @escaping(RoleListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIRoleList(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(RoleListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(RoleListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
