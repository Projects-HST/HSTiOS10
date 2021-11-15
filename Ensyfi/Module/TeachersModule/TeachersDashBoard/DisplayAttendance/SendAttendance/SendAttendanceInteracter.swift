//
//  SendAttendanceInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 18/10/21.
//

import Foundation

protocol SendAttendanceBusinessLogic
{
    func fetchItems(request:SendAttendanceModel.Fetch.Request)
}
protocol SendAttendanceDataStore
{
  
}

class SendAttendanceInteractor:SendAttendanceBusinessLogic,SendAttendanceDataStore
{

    var presenter:SendAttendancePresentationLogic?
    var worker:SendAttendanceWorker?
 
    func fetchItems(request: SendAttendanceModel.Fetch.Request) {
        if request.attend_id == nil {
           self.presenter?.presentFetchResults(resp: SendAttendanceModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = SendAttendanceWorker()
        worker!.fetch(attend_id:request.attend_id!, msg_type:request.msg_type!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: SendAttendanceModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: SendAttendanceModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

