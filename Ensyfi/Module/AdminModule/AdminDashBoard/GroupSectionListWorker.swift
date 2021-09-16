//
//  GroupSectionListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//

import Foundation
import UIKit

typealias GroupSectionListresponseHandler = (_ response:GroupSectionListModel.Fetch.Response) ->()

class GroupSectionListWorker{
    
   var respData = [GroupSectionListModels]()
    func fetch(user_id:String, onSuccess successCallback:(GroupSectionListresponseHandler)?,onFailure failureCallback: @escaping(GroupSectionListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIGroupSectionList(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(GroupSectionListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(GroupSectionListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
    }
}
