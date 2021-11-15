//
//  MotherDeatilsInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//

import Foundation

protocol MotherDetailsBusinessLogic
{
    func fetchItems(request: MotherDetailsModel.Fetch.Request)
}
protocol MotherDetailsDataStore
{
  
}

class MotherDetailsInteractor: MotherDetailsBusinessLogic, FatherDeatilsDataStore
{
    
    var presenter2: MotherDetailsPresentationLogic?
    var worker: MotherDetailsWorker?
 
    func fetchItems(request: MotherDetailsModel.Fetch.Request) {
        if request.admission_id == nil {
           self.presenter2?.presentFetchResults(resp: MotherDetailsModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = MotherDetailsWorker()
        worker!.fetch(admission_id:request.admission_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter2?.presentFetchResults(resp: MotherDetailsModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter2?.presentFetchResults(resp: MotherDetailsModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}


