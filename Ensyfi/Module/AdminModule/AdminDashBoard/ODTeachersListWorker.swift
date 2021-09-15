//
//  ODTeachersListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation
import UIKit

typealias ODTeachersListresponseHandler = (_ response:ODTeachersListModel.Fetch.Response) ->()

class ODTeachersListWorker{
    
   var respData = [ODTeachersListModels]()
   func fetch(user_type:String,onSuccess successCallback:(ODTeachersListresponseHandler)?,onFailure failureCallback: @escaping(ODTeachersListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIODTeachersList(
        user_type:user_type, onSuccess: { (resp)  in
               successCallback?(ODTeachersListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ODTeachersListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

