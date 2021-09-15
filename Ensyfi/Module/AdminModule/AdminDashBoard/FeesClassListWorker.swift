//
//  FeesClassListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation
import UIKit

typealias FeesClassListresponseHandler = (_ response:FeesClassListModel.Fetch.Response) ->()

class FeesClassListWorker{
    
   var respData = [FeesClassListModels]()
   func fetch(user_id:String, onSuccess successCallback:(FeesClassListresponseHandler)?,onFailure failureCallback: @escaping(FeesClassListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIFeesClassList(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(FeesClassListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(FeesClassListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

