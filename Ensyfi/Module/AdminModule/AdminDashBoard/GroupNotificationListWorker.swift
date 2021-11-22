//
//  GroupNotificationListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/11/21.
//

import Foundation
import UIKit

typealias GroupNotificationListresponseHandler = (_ response:GroupNotificationListModel.Fetch.Response) ->()

class GroupNotificationListWorker{
    
   var respData = [GroupNotificationListModels]()
    func fetch(group_id:String,dynamic_db:String, onSuccess successCallback:(GroupNotificationListresponseHandler)?,onFailure failureCallback: @escaping(GroupNotificationListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIGroupNotificationList(
        group_id:group_id,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(GroupNotificationListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(GroupNotificationListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

