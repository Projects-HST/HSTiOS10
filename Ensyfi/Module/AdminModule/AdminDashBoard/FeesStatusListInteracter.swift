//
//  FeesStatusListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/09/21.
//

import Foundation
import UIKit

protocol FeesStatusListBusinessLogic
{
    func fetchItems(request: FeesStatusListModel.Fetch.Request)
}
protocol FeesStatusListDataStore
{
  
}

class FeesStatusListInteractor: FeesStatusListBusinessLogic,FeesStatusListDataStore
{
    var presenter: FeesStatusListPresentationLogic?
    var worker: FeesStatusListWorker?
    var respData = [FeesStatusListModels]()
    func fetchItems(request: FeesStatusListModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter?.presentFetchResults(resp: FeesStatusListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = FeesStatusListWorker()
        worker!.fetch(class_id:request.class_id!,section_id:request.section_id!,fees_id:request.fees_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: FeesStatusListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: FeesStatusListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

