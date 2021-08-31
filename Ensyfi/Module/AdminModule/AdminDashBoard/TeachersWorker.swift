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
   func fetch(user_id:String, onSuccess successCallback:(TeachersListresponseHandler)?,onFailure failureCallback: @escaping(TeachersListresponseHandler)) {
       let manager = APIManager()
       manager.callAPITeachersList(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(TeachersListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(TeachersListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}



