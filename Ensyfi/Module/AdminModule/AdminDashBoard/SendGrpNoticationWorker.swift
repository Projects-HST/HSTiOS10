//
//  SendGrpNoticationWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 22/11/21.
//

import Foundation
import UIKit

typealias SendGroupNotificationresponseHandler = (_ response:SendGroupNotificationModel.Fetch.Response) ->()

class SendGroupNotificationWorker{

   func fetch(group_id:String,notification_type:String,notes:String,user_id:String,dynamic_db:String, onSuccess successCallback:(SendGroupNotificationresponseHandler)?,onFailure failureCallback: @escaping(SendGroupNotificationresponseHandler)) {
       let manager = APIManager()
       manager.callAPISendGroupNotification(
        group_id:group_id, notification_type:notification_type,notes:notes, user_id:user_id,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(SendGroupNotificationModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(SendGroupNotificationModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}
