//
//  ClassSectionListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//

import Foundation
import UIKit

typealias Class_SectionresponseHandler = (_ response:Class_SectionModel.Fetch.Response) ->()

class Class_SectionWorker{
    
   var respData = [Class_SectionModels]()
   func fetch(user_id:String, onSuccess successCallback:(Class_SectionresponseHandler)?,onFailure failureCallback: @escaping(Class_SectionresponseHandler)) {
       let manager = APIManager()
       manager.callAPIClass_Section(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(Class_SectionModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(Class_SectionModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

