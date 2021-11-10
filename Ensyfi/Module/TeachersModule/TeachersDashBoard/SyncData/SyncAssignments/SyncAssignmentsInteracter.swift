//
//  SyncAssignmentsInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 10/11/21.
//

import Foundation

protocol SyncAssignmentBusinessLogic
{
    func fetchItems(request:SyncAssignmentModel.Fetch.Request)
}
protocol SyncAssignmentDataStore
{
  
}

class SyncAssignmentInteractor:SyncAssignmentBusinessLogic,SyncAssignmentDataStore
{

    var presenter2:SyncAssignmentPresentationLogic?
    var worker:SyncAssignmentWorker?
 
    func fetchItems(request: SyncAssignmentModel.Fetch.Request) {
        if request.class_id == nil {
           self.presenter2?.presentFetchResults(resp:SyncAssignmentModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = SyncAssignmentWorker()
        worker!.fetch(class_id:request.class_id!, teacher_id:request.teacher_id!,homeWork_type:request.homeWork_type!, subject_id:request.subject_id!, title:request.title!,test_date:request.test_date!, due_date:request.due_date!,homework_details:request.homework_details!, created_by:request.created_by!,  created_at:request.created_at!,onSuccess: { (resp) in
            self.presenter2?.presentFetchResults(resp: SyncAssignmentModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter2?.presentFetchResults(resp: SyncAssignmentModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
