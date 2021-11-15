//
//  HomeWorkTestInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 01/09/21.
//

import Foundation
import UIKit

protocol HomeWorkTestListBusinessLogic
{
    func fetchItems(request: HomeWorkTestListModel.Fetch.Request)
}
protocol HomeWorkTestListDataStore
{
  
}

class HomeWorkTestListInteractor: HomeWorkTestListBusinessLogic, HomeWorkTestListDataStore
{
    
    var presenter: HomeWorkTestListPresentationLogic?
    var worker: HomeWorkTestListWorker?
    var respData = [HomeWorkTestListModels]()
    func fetchItems(request: HomeWorkTestListModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter?.presentFetchResults(resp: HomeWorkTestListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = HomeWorkTestListWorker()
        worker!.fetch(class_id:request.class_id!,hw_type:request.hw_type!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: HomeWorkTestListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: HomeWorkTestListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

