//
//  StudentsAdminWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 24/08/21.
//

import Foundation
import UIKit

typealias ClassViewresponseHandler = (_ response:ClassViewModel.Fetch.Response) ->()

class ClassViewWorker{
    
   var respData = [ClassViewModels]()
   func fetch(user_id:String,dynamic_db:String,onSuccess successCallback:(ClassViewresponseHandler)?,onFailure failureCallback: @escaping(ClassViewresponseHandler)) {
       let manager = APIManager()
       manager.callAPIClassView(
        user_id:user_id,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(ClassViewModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ClassViewModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}


