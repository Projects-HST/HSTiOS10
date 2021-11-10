//
//  SyncAssignmentsWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 10/11/21.
//

import Foundation
import UIKit

typealias SyncAssignmentresponseHandler = (_ response:SyncAssignmentModel.Fetch.Response) ->()

class SyncAssignmentWorker{

   func fetch(class_id:String,teacher_id:String,homeWork_type:String,subject_id:String,title:String,test_date:String,due_date:String,homework_details:String,created_by:String,created_at:String, onSuccess successCallback:(SyncAssignmentresponseHandler)?,onFailure failureCallback: @escaping(SyncAssignmentresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPISyncAssignment(
        class_id:class_id, teacher_id:teacher_id,homeWork_type:homeWork_type, subject_id:subject_id,title:title,test_date:test_date, due_date:due_date,homework_details:homework_details,created_by:created_by,created_at:created_at, onSuccess: { (resp)  in
               successCallback?(SyncAssignmentModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(SyncAssignmentModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}
