//
//  FeesSectionListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation
import UIKit

typealias FeesSectionListresponseHandler = (_ response:FeesSectionListModel.Fetch.Response) ->()

class FeesSectionListWorker{
    
   var respData = [FeesSectionListModels]()
   func fetch(class_id:String,dynamic_db:String, onSuccess successCallback:(FeesSectionListresponseHandler)?,onFailure failureCallback: @escaping(FeesSectionListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIFeesSectionList(
        class_id:class_id,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(FeesSectionListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(FeesSectionListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}


