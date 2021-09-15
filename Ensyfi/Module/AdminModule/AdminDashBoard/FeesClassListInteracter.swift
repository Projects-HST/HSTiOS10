//
//  FeesClassListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation
import UIKit

protocol FeesClassListBusinessLogic
{
    func fetchItems(request: FeesClassListModel.Fetch.Request)
}
protocol FeesClassListDataStore
{
  
}

class FeesClassListInteractor: FeesClassListBusinessLogic, FeesClassListDataStore
{
    var presenter1: FeesClassListPresentationLogic?
    var worker: FeesClassListWorker?
    var respData = [FeesClassListModels]()
    func fetchItems(request: FeesClassListModel.Fetch.Request) {
        if request.user_id == nil {
        self.presenter1?.presentFetchResults(resp: FeesClassListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = FeesClassListWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: FeesClassListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: FeesClassListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
