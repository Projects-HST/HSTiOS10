//
//  FeesStatusListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/09/21.
//
import Foundation
import UIKit

typealias FeesStatusListresponseHandler = (_ response:FeesStatusListModel.Fetch.Response) ->()

class FeesStatusListWorker{
    
   var respData = [FeesStatusListModels]()
   func fetch(class_id:String,section_id:String,fees_id:String,dynamic_db:String, onSuccess successCallback:(FeesStatusListresponseHandler)?,onFailure failureCallback: @escaping(FeesStatusListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIFeesStatusList(
        class_id:class_id,section_id:section_id,fees_id:fees_id,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(FeesStatusListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(FeesStatusListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}


