//
//  EventDeatilsWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation
import UIKit

typealias SubEventsresponseHandler = (_ response:SubEventsModel.Fetch.Response) ->()

class SubEventsWorker{
    
   var respData = [SubEventsModels]()
    func fetch(event_id:String, onSuccess successCallback:(SubEventsresponseHandler)?,onFailure failureCallback: @escaping(SubEventsresponseHandler)) {
       let manager = APIManager()
       manager.callAPISubEvents(
        event_id:event_id, onSuccess: { (resp)  in
               successCallback?(SubEventsModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(SubEventsModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
