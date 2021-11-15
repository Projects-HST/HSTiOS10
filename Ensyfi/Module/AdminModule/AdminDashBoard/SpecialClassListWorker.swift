//
//  SpecialClassListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/10/21.
//

import Foundation
import UIKit

typealias SpecialClassListresponseHandler = (_ response:SpecialClassListModel.Fetch.Response) ->()

class SpecialClassListWorker{
    
   var respData = [SpecialClassListModels]()
    func fetch(user_id:String,from:String,dynamic_db:String, onSuccess successCallback:(SpecialClassListresponseHandler)?,onFailure failureCallback: @escaping(SpecialClassListresponseHandler)) {
       let manager = APIManager()
       manager.callAPISpecialClassList(
        user_id:user_id,from:from,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(SpecialClassListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(SpecialClassListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}


