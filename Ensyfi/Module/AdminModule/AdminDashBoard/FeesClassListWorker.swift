//
//  FeesClassListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation
import UIKit

typealias FeesListresponseHandler = (_ response:FeesListModel.Fetch.Response) ->()

class FeesListWorker{
    
   var respData = [FeesListModels]()
   func fetch(class_id:String,section_id:String, onSuccess successCallback:(FeesListresponseHandler)?,onFailure failureCallback: @escaping(FeesListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIFeesList(
        class_id:class_id,section_id:section_id, onSuccess: { (resp)  in
               successCallback?(FeesListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(FeesListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
var class_id : String?
var section_id : String?
