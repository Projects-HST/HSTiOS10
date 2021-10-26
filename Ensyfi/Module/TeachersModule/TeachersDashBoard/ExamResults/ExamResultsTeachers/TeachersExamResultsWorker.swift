//
//  TeachersExamResultsWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/10/21.
//

import Foundation
import UIKit

typealias TeachersExamsResultsresponseHandler = (_ response:TeachersExamsResultsModel.Fetch.Response) ->()

class TeachersExamsResultsWorker{
    
   var respData = [TeachersExamsResultsModels]()
    func fetch(class_id:String,exam_id:String,subject_id:String,is_internal_external:String,onSuccess successCallback:(TeachersExamsResultsresponseHandler)?,onFailure failureCallback: @escaping(TeachersExamsResultsresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPITeachersExamsResult(
        class_id:class_id,exam_id:exam_id,subject_id:subject_id,is_internal_external:is_internal_external,onSuccess: { (resp)  in
               successCallback?(TeachersExamsResultsModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(TeachersExamsResultsModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
