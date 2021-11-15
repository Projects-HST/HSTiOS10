//
//  ODAprovalInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation

protocol ODApprovalBusinessLogic
{
    func fetchItems(request:ODApprovalModel.Fetch.Request)
}
protocol ODApprovalDataStore
{
  
}

class ODApprovalInteractor: ODApprovalBusinessLogic, ODApprovalDataStore
{

    var presenter:ODApprovalPresentationLogic?
    var worker:ODApprovalWorker?
 
    func fetchItems(request: ODApprovalModel.Fetch.Request) {
        if request.od_id == nil {
           self.presenter?.presentFetchResults(resp: ODApprovalModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = ODApprovalWorker()
        worker!.fetch(status:request.status!, od_id:request.od_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: ODApprovalModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: ODApprovalModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

