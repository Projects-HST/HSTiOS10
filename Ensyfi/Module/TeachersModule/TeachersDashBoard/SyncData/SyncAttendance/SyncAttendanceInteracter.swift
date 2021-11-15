//
//  SyncAttendanceInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 06/10/21.
//

import Foundation

protocol SyncAttendanceBusinessLogic
{
    func fetchItems(request:SyncAttendanceModel.Fetch.Request)
}
protocol SyncAttendanceDataStore
{
  
}

class SyncAttendanceInteractor:SyncAttendanceBusinessLogic,SyncAttendanceDataStore
{

    var presenter:SyncAttendancePresentationLogic?
    var worker:SyncAttendanceWorker?
 
    func fetchItems(request: SyncAttendanceModel.Fetch.Request) {
        if request.class_id == nil {
           self.presenter?.presentFetchResults(resp: SyncAttendanceModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = SyncAttendanceWorker()
        worker!.fetch(ac_year:request.ac_year!, class_id:request.class_id!,class_total:request.class_total!, no_of_present:request.no_of_present!, no_of_absent:request.no_of_absent!,attendence_period:request.attendence_period!, created_by:request.created_by!,created_at:request.created_at!, status:request.status!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: SyncAttendanceModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: SyncAttendanceModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

