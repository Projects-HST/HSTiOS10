//
//  ClassTestMarksListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 09/11/21.
//

import Foundation
import UIKit

typealias ClassTestMarkListresponseHandler = (_ response:ClassTestMarkListModel.Fetch.Response) ->()

class ClassTestMarkListWorker{
    
   var respData = [ClassTestMarkListModels]()
    func fetch(hw_id:String,onSuccess successCallback:(ClassTestMarkListresponseHandler)?,onFailure failureCallback: @escaping(ClassTestMarkListresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPIClassTestMarkList(
        hw_id:hw_id,onSuccess: { (resp)  in
               successCallback?(ClassTestMarkListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ClassTestMarkListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
