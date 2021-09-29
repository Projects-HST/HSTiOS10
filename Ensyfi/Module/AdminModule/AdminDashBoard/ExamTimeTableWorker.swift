//
//  ExamTimeTableWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//

import Foundation
import UIKit

typealias ExamTimeTableresponseHandler = (_ response:ExamTimeTableModel.Fetch.Response) ->()

class ExamTimeTableWorker{
    
   var respData = [ExamTimeTableModels]()
    func fetch(class_id:String,exam_id:String, onSuccess successCallback:(ExamTimeTableresponseHandler)?,onFailure failureCallback: @escaping(ExamTimeTableresponseHandler)) {
       let manager = APIManager()
       manager.callAPIExamTimeTable(
        class_id:class_id,exam_id:exam_id, onSuccess: { (resp)  in
               successCallback?(ExamTimeTableModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ExamTimeTableModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
