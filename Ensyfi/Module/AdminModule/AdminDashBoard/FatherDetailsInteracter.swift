//
//  ParentDetailsInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//


import Foundation

protocol FatherDeatilsBusinessLogic
{
    func fetchItems(request: FatherDeatilsModel.Fetch.Request)
}
protocol FatherDeatilsDataStore
{
  
}

class FatherDeatilsInteractor: FatherDeatilsBusinessLogic, FatherDeatilsDataStore
{
    
    var presenter: FatherDeatilsPresentationLogic?
    var worker: FatherDeatilsWorker?
 
    func fetchItems(request: FatherDeatilsModel.Fetch.Request) {
        if request.admission_id == nil {
           self.presenter?.presentFetchResults(resp: FatherDeatilsModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = FatherDeatilsWorker()
        worker!.fetch(admission_id:request.admission_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: FatherDeatilsModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: FatherDeatilsModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}




