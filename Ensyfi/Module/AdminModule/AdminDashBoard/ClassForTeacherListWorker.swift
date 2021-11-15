//
//  ClassForTeacherListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation
import UIKit

typealias ClassForTeacherListresponseHandler = (_ response:ClassForTeacherListModel.Fetch.Response) ->()

class ClassForTeacherListWorker{
    
   var respData = [ClassForTeacherListModels]()
   func fetch(class_id:String,section_id:String,dynamic_db:String, onSuccess successCallback:(ClassForTeacherListresponseHandler)?,onFailure failureCallback: @escaping(ClassForTeacherListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIClassForTeacherList(
        class_id:class_id,section_id:section_id,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(ClassForTeacherListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ClassForTeacherListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
