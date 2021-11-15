//
//  TeachersExamsListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/10/21.
//

import Foundation
import UIKit

typealias TeachersExamsListresponseHandler = (_ response:TeachersExamsListModel.Fetch.Response) ->()

class TeachersExamsListWorker{
    
   var respData = [TeachersExamsListModels]()
    func fetch(teacher_id:String,dynamic_db:String,onSuccess successCallback:(TeachersExamsListresponseHandler)?,onFailure failureCallback: @escaping(TeachersExamsListresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPITeachersExamsList(
        teacher_id:teacher_id,dynamic_db:dynamic_db,onSuccess: { (resp)  in
               successCallback?(TeachersExamsListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(TeachersExamsListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

