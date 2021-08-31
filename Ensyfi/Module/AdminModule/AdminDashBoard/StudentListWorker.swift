//
//  StudentListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 25/08/21.
//
import Foundation
import UIKit

typealias StudentsListresponseHandler = (_ response:StudentsListModel.Fetch.Response) ->()

class StudentsListWorker{
    
   var respData = [StudentsListModels]()
   func fetch(class_id:String,section_id:String, onSuccess successCallback:(StudentsListresponseHandler)?,onFailure failureCallback: @escaping(StudentsListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIStudentsList(
        class_id:class_id,section_id:section_id, onSuccess: { (resp)  in
               successCallback?(StudentsListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(StudentsListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}



