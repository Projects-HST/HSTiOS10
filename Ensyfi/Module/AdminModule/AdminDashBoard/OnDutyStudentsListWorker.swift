//
//  OnDutyListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//

import Foundation
import UIKit

typealias ODStudentsListresponseHandler = (_ response:ODStudentsListModel.Fetch.Response) ->()

class ODStudentsListWorker{
    
   var respData = [ODStudentsListModels]()
   func fetch(user_type:String,onSuccess successCallback:(ODStudentsListresponseHandler)?,onFailure failureCallback: @escaping(ODStudentsListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIODStudentsList(
        user_type:user_type, onSuccess: { (resp)  in
               successCallback?(ODStudentsListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ODStudentsListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

