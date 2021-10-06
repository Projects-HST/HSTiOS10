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
        if request.user_id == nil {
           self.presenter?.presentFetchResults(resp: SyncAttendanceModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = SyncAttendanceWorker()
        worker!.fetch(user_id:request.user_id!, group_title:request.group_title!,group_lead_id:request.group_lead_id!, status:request.status!, group_id:request.group_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: SyncAttendanceModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: SyncAttendanceModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
