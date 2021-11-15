//
//  SyncExamMarksInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 11/11/21.
//

import Foundation

protocol SyncExamMarksBusinessLogic
{
    func fetchItems(request:SyncExamMarksModel.Fetch.Request)
}
protocol SyncExamMarksDataStore
{
  
}

class SyncExamMarksInteractor:SyncExamMarksBusinessLogic,SyncExamMarksDataStore
{

    var presenter4:SyncExamMarksPresentationLogic?
    var worker:SyncExamMarksWorker?
 
    func fetchItems(request: SyncExamMarksModel.Fetch.Request) {
        if request.exam_id == nil {
           self.presenter4?.presentFetchResults(resp: SyncExamMarksModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = SyncExamMarksWorker()
        worker!.fetch(exam_id:request.exam_id!, teacher_id:request.teacher_id!,subject_id:request.subject_id!, stu_id:request.stu_id!, classmaster_id:request.classmaster_id!,internal_mark:request.internal_mark!, external_mark:request.external_mark!,marks:request.marks!, is_internal_external:request.is_internal_external!,created_by:request.created_by!,dynamic_db:request.dynamic_db!,  onSuccess: { (resp) in
            self.presenter4?.presentFetchResults(resp: SyncExamMarksModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter4?.presentFetchResults(resp: SyncExamMarksModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

