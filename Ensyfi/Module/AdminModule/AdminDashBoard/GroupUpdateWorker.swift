//
//  GroupUpdateWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 15/09/21.
//

import Foundation
import UIKit

typealias UpdateGroupresponseHandler = (_ response:UpdateGroupModel.Fetch.Response) ->()

class UpdateGroupWorker{

   func fetch(user_id:String,group_title:String,group_lead_id:String,status:String,group_id:String, onSuccess successCallback:(UpdateGroupresponseHandler)?,onFailure failureCallback: @escaping(UpdateGroupresponseHandler)) {
       let manager = APIManager()
       manager.callAPIUpdateGroup(
        user_id:user_id, group_title:group_title,group_lead_id:group_lead_id, status:status,group_id:group_id, onSuccess: { (resp)  in
               successCallback?(UpdateGroupModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(UpdateGroupModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}


