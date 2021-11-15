//
//  ApplyLeaveRequestInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/10/21.
//

import Foundation

protocol ApplyLeaveRequestBusinessLogic
{
    func fetchItems(request:ApplyLeaveRequestModel.Fetch.Request)
}
protocol ApplyLeaveRequestDataStore
{
  
}

class ApplyLeaveRequestInteractor:ApplyLeaveRequestBusinessLogic,ApplyLeaveRequestDataStore
{

    var presenter1:ApplyLeaveRequestPresentationLogic?
    var worker:ApplyLeaveRequestWorker?
 
    func fetchItems(request: ApplyLeaveRequestModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter1?.presentFetchResults(resp: ApplyLeaveRequestModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = ApplyLeaveRequestWorker()
        worker!.fetch(user_type:request.user_type!, user_id:request.user_id!,leave_master_id:request.leave_master_id!, leave_type:request.leave_type!, date_from:request.date_from!, date_to:request.date_to!,fromTime:request.fromTime!, toTime:request.toTime!,description:request.description!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: ApplyLeaveRequestModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: ApplyLeaveRequestModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

