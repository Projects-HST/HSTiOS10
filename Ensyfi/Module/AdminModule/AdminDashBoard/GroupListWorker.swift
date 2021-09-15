//
//  GroupListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//

import Foundation
import UIKit

typealias GroupListresponseHandler = (_ response:GroupListModel.Fetch.Response) ->()

class GroupListWorker{
    
   var respData = [GroupListModels]()
    func fetch(user_id:String,user_type:String, onSuccess successCallback:(GroupListresponseHandler)?,onFailure failureCallback: @escaping(GroupListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIGroupList(
        user_id:user_id,user_type:user_type, onSuccess: { (resp)  in
               successCallback?(GroupListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(GroupListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
