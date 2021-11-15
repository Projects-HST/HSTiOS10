//
//  TeachersWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/08/21.
//

import Foundation
import UIKit

typealias TeachersListresponseHandler = (_ response:TeachersListModel.Fetch.Response) ->()

class TeachersListWorker{
    
   var respData = [TeachersListModels]()
   func fetch(user_id:String,dynamic_db:String, onSuccess successCallback:(TeachersListresponseHandler)?,onFailure failureCallback: @escaping(TeachersListresponseHandler)) {
       let manager = APIManager()
       manager.callAPITeachersList(
        user_id:user_id,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(TeachersListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(TeachersListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}




