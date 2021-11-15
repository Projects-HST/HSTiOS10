//
//  SectionListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 25/08/21.
//

import Foundation
import UIKit

typealias SectionListresponseHandler = (_ response:SectionListModel.Fetch.Response) ->()

class SectionListWorker{
    
   var respData = [SectionListModels]()
   func fetch(class_id:String,dynamic_db:String,onSuccess successCallback:(SectionListresponseHandler)?,onFailure failureCallback: @escaping(SectionListresponseHandler)) {
       let manager = APIManager()
       manager.callAPISectionList(
        class_id:class_id,dynamic_db:dynamic_db,onSuccess: { (resp)  in
               successCallback?(SectionListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(SectionListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}


