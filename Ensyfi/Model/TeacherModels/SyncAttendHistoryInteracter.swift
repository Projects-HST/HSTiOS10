//
//  SyncAttendHistoryInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 09/11/21.
//

import Foundation

protocol SyncAttendanceHistoryBusinessLogic
{
    func fetchItems(request:SyncAttendanceHistoryModel.Fetch.Request)
}
protocol SyncAttendanceHistoryDataStore
{
  
}

class SyncAttendanceHistoryInteractor:SyncAttendanceHistoryBusinessLogic,SyncAttendanceHistoryDataStore
{

    var presenter1:SyncAttendanceHistoryPresentationLogic?
    var worker:SyncAttendanceHistoryWorker?
 
    func fetchItems(request: SyncAttendanceHistoryModel.Fetch.Request) {
        if request.class_id == nil {
           self.presenter1?.presentFetchResults(resp: SyncAttendanceHistoryModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = SyncAttendanceHistoryWorker()
        worker!.fetch(attend_id:request.attend_id!, class_id:request.class_id!,student_id:request.student_id!, abs_date:request.abs_date!, a_status:request.a_status!,attend_period:request.attend_period!, a_val:request.a_val!,a_taken_by:request.a_taken_by!, created_at:request.created_at!,status:request.status!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: SyncAttendanceHistoryModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: SyncAttendanceHistoryModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
