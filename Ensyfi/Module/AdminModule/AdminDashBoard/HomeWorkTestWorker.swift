//
//  HomeWorkTestWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 01/09/21.
//

import Foundation
import UIKit

typealias HomeWorkTestListresponseHandler = (_ response:HomeWorkTestListModel.Fetch.Response) ->()

class HomeWorkTestListWorker{
    
   var respData = [HomeWorkTestListModels]()
   func fetch(class_id:String,hw_type:String, onSuccess successCallback:(HomeWorkTestListresponseHandler)?,onFailure failureCallback: @escaping(HomeWorkTestListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIHomeWorkTestList(
        class_id:class_id,hw_type:hw_type, onSuccess: { (resp)  in
               successCallback?(HomeWorkTestListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(HomeWorkTestListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

