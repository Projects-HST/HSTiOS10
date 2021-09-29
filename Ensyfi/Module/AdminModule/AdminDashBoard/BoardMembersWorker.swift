//
//  BoardMembersWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//

import Foundation
import UIKit

typealias BoardMembersListresponseHandler = (_ response:BoardMembersListModel.Fetch.Response) ->()

class BoardMembersListWorker{
    
   var respData = [BoardMembersListModels]()
   func fetch(user_id:String, onSuccess successCallback:(BoardMembersListresponseHandler)?,onFailure failureCallback: @escaping(BoardMembersListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIBoardMembersList(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(BoardMembersListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(BoardMembersListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}



