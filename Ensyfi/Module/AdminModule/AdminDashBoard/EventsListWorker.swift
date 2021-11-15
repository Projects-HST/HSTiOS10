//
//  EventsListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation
import UIKit

typealias EventsListresponseHandler = (_ response:EventsListModel.Fetch.Response) ->()

class EventsListWorker{
    
   var respData = [EventsListModels]()
    func fetch(class_id:String,section_id:String,dynamic_db:String, onSuccess successCallback:(EventsListresponseHandler)?,onFailure failureCallback: @escaping(EventsListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIEventsList(
        class_id:class_id,section_id:section_id,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(EventsListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(EventsListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}


