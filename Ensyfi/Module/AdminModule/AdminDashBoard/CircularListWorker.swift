//
//  CircularListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//

import Foundation
import UIKit

typealias CircularsListresponseHandler = (_ response:CircularsListModel.Fetch.Response) ->()

class CircularsListWorker{
    
   var respData = [CircularsListModels]()
    func fetch(user_id:String, onSuccess successCallback:(CircularsListresponseHandler)?,onFailure failureCallback: @escaping(CircularsListresponseHandler)) {
       let manager = APIManager()
       manager.callAPICircularsList(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(CircularsListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(CircularsListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

