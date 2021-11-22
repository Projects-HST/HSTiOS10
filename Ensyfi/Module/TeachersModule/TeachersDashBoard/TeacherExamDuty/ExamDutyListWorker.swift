//
//  ExamDutyListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/11/21.
//

import Foundation
import UIKit

typealias ExamDutyListresponseHandler = (_ response:ExamDutyListModel.Fetch.Response) ->()

class ExamDutyListWorker{
    
   var respData = [ExamDutyListModels]()
    func fetch(teacher_id:String,dynamic_db:String,onSuccess successCallback:(ExamDutyListresponseHandler)?,onFailure failureCallback: @escaping(ExamDutyListresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPIExamDutyList(
        teacher_id:teacher_id,dynamic_db:dynamic_db,onSuccess: { (resp)  in
               successCallback?(ExamDutyListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ExamDutyListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

