//
//  LeaveApprovalInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/09/21.
//

import Foundation

protocol LeaveApprovalBusinessLogic
{
    func fetchItems(request:LeaveApprovalModel.Fetch.Request)
}
protocol LeaveApprovalDataStore
{
  
}

class LeaveApprovalInteractor: LeaveApprovalBusinessLogic, LeaveApprovalDataStore
{

    var presenter:LeaveApprovalPresentationLogic?
    var worker:LeaveApprovalWorker?
 
    func fetchItems(request: LeaveApprovalModel.Fetch.Request) {
        if request.leave_id == nil {
           self.presenter?.presentFetchResults(resp:LeaveApprovalModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = LeaveApprovalWorker()
        worker!.fetch(status:request.status!, leave_id:request.leave_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: LeaveApprovalModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: LeaveApprovalModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
