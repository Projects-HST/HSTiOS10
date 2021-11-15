//
//  AddGroupMemberWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 17/09/21.
//
import Foundation
import UIKit

typealias AddGroupMemberresponseHandler = (_ response:AddGroupMemberModel.Fetch.Response) ->()

class AddGroupMemberWorker{

   func fetch(user_id:String,group_member_id:String,group_user_type:String,status:String,group_id:String,dynamic_db:String, onSuccess successCallback:(AddGroupMemberresponseHandler)?,onFailure failureCallback: @escaping(AddGroupMemberresponseHandler)) {
       let manager = APIManager()
       manager.callAPIAddGroupMember(
        user_id:user_id, group_member_id:group_member_id,group_user_type:group_user_type, status:status,group_id:group_id,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(AddGroupMemberModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(AddGroupMemberModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

