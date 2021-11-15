//
//  FeesClassListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation
import UIKit

protocol FeesListBusinessLogic
{
    func fetchItems(request: FeesListModel.Fetch.Request)
}
protocol FeesListDataStore
{
  
}

class FeesListInteractor: FeesListBusinessLogic, FeesListDataStore
{
    var presenter2: FeesListPresentationLogic?
    var worker: FeesListWorker?
    var respData = [FeesListModels]()
    func fetchItems(request: FeesListModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter2?.presentFetchResults(resp: FeesListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = FeesListWorker()
        worker!.fetch(class_id:request.class_id!,section_id:request.section_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter2?.presentFetchResults(resp: FeesListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter2?.presentFetchResults(resp: FeesListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

