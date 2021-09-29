//
//  HomeWorkDetailsIntercter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//

import Foundation
import UIKit

protocol HomeWorkDetailsBusinessLogic
{
    func fetchItems(request: HomeWorkDetailsModel.Fetch.Request)
}
protocol HomeWorkDetailsDataStore
{
  
}

class HomeWorkDetailsInteractor: HomeWorkDetailsBusinessLogic, HomeWorkDetailsDataStore
{
    
    var presenter: HomeWorkDetailsPresentationLogic?
    var worker: HomeWorkDetailsWorker?
    var respData = [HomeWorkDetailsModels]()
    func fetchItems(request: HomeWorkDetailsModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter?.presentFetchResults(resp: HomeWorkDetailsModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = HomeWorkDetailsWorker()
        worker!.fetch(class_id:request.class_id!,hw_type:request.hw_type!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: HomeWorkDetailsModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: HomeWorkDetailsModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
