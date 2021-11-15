//
//  FeesSectionListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.

import Foundation
import UIKit

protocol FeesSectionListBusinessLogic
{
    func fetchItems(request: FeesSectionListModel.Fetch.Request)
}
protocol FeesSectionListDataStore
{
  
}

class FeesSectionListInteractor: FeesSectionListBusinessLogic, FeesSectionListDataStore
{
    
    var presenter1: FeesSectionListPresentationLogic?
    var worker: FeesSectionListWorker?
    var respData = [FeesSectionListModels]()
    func fetchItems(request: FeesSectionListModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter1?.presentFetchResults(resp: FeesSectionListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = FeesSectionListWorker()
        worker!.fetch(class_id:request.class_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: FeesSectionListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: FeesSectionListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}


