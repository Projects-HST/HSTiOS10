//
//  GuardianDetailsInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//


import Foundation

protocol GuardianDetailsBusinessLogic
{
    func fetchItems(request: GuardianDetailsModel.Fetch.Request)
}
protocol GuardianDetailsDataStore
{
  
}

class GuardianDetailsInteractor: GuardianDetailsBusinessLogic, GuardianDetailsDataStore
{
    
    var presenter3: GuardianDetailsPresentationLogic?
    var worker: GuardianDetailsWorker?
 
    func fetchItems(request: GuardianDetailsModel.Fetch.Request) {
        if request.admission_id == nil {
           self.presenter3?.presentFetchResults(resp: GuardianDetailsModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = GuardianDetailsWorker()
        worker!.fetch(admission_id:request.admission_id!, onSuccess: { (resp) in
            self.presenter3?.presentFetchResults(resp: GuardianDetailsModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter3?.presentFetchResults(resp: GuardianDetailsModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

