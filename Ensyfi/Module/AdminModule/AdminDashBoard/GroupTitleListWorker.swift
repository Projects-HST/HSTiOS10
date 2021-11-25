//
//  GroupTitleListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 22/11/21.
//

import Foundation
import UIKit

typealias GroupTitleListresponseHandler = (_ response:GroupTitleListModel.Fetch.Response) ->()

class GroupTitleListWorker{
    
   var respData = [GroupTitleListModels]()
    func fetch(user_type:String,user_id:String,dynamic_db:String, onSuccess successCallback:(GroupTitleListresponseHandler)?,onFailure failureCallback: @escaping(GroupTitleListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIGroupTitleList(
        user_type:user_type,user_id:user_id,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(GroupTitleListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(GroupTitleListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
