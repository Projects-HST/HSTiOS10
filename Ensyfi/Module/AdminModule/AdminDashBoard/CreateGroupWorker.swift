//
//  CreateGroupWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//


import Foundation
import UIKit

typealias CreateGroupresponseHandler = (_ response:CreateGroupModel.Fetch.Response) ->()

class CreateGroupWorker{

   func fetch(user_id:String,group_title:String,group_lead_id:String,status:String,dynamic_db:String, onSuccess successCallback:(CreateGroupresponseHandler)?,onFailure failureCallback: @escaping(CreateGroupresponseHandler)) {
       let manager = APIManager()
       manager.callAPICreateGroup(
        user_id:user_id, group_title:group_title,group_lead_id:group_lead_id, status:status,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(CreateGroupModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(CreateGroupModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

