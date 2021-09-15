//
//  CircularListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//


import Foundation
import UIKit

protocol CircularsListBusinessLogic
{
    func fetchItems(request: CircularsListModel.Fetch.Request)
}
protocol CircularsListDataStore
{
  
}

class CircularsListInteractor: CircularsListBusinessLogic, CircularsListDataStore
{
    
    var presenter: CircularsListPresentationLogic?
    var worker: CircularsListWorker?
    var respData = [CircularsListModels]()
    func fetchItems(request:CircularsListModel.Fetch.Request) {
        if request.user_id == nil {
        self.presenter?.presentFetchResults(resp: CircularsListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = CircularsListWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: CircularsListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: CircularsListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
