//
//  GroupMembersListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 15/09/21.
//

import Foundation
import UIKit

typealias GroupMembersListresponseHandler = (_ response:GroupMembersListModel.Fetch.Response) ->()

class GroupMembersListWorker{
    
   var respData = [GroupMembersListModels]()
    func fetch(group_id:String, onSuccess successCallback:(GroupMembersListresponseHandler)?,onFailure failureCallback: @escaping(GroupMembersListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIGroupMembersList(
        group_id:group_id, onSuccess: { (resp)  in
               successCallback?(GroupMembersListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(GroupMembersListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
