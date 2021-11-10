//
//  ClassTestMarksListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 09/11/21.
//

import Foundation
import UIKit

protocol ClassTestMarkListBusinessLogic
{
    func fetchItems(request: ClassTestMarkListModel.Fetch.Request)
}
protocol ClassTestMarkListDataStore
{
  
}

class ClassTestMarkListInteractor:ClassTestMarkListBusinessLogic,ClassTestMarkListDataStore
{
    var presenter: ClassTestMarkListPresentationLogic?
    var worker:ClassTestMarkListWorker?
    var respData = [ClassTestMarkListModels]()
    func fetchItems(request:ClassTestMarkListModel.Fetch.Request) {
        if request.hw_id == nil {
        self.presenter?.presentFetchResults(resp: ClassTestMarkListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy"))
        }
        worker = ClassTestMarkListWorker()
        worker!.fetch(hw_id:request.hw_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: ClassTestMarkListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp:ClassTestMarkListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

