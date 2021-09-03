//
//  ExamsListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation
import UIKit

typealias ExamListresponseHandler = (_ response:ExamListModel.Fetch.Response) ->()

class ExamListWorker{
    
   var respData = [ExamListModels]()
    func fetch(class_id:String,section_id:String, onSuccess successCallback:(ExamListresponseHandler)?,onFailure failureCallback: @escaping(ExamListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIExamList(
        class_id:class_id,section_id:section_id, onSuccess: { (resp)  in
               successCallback?(ExamListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ExamListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

