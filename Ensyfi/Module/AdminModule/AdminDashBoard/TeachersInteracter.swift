//
//  TeachersInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/08/21.
//

import Foundation
import UIKit

protocol TeachersListBusinessLogic
{
    func fetchItems(request: TeachersListModel.Fetch.Request)
}
protocol TeachersListDataStore
{
  
}

class TeachersListInteractor: TeachersListBusinessLogic, TeachersListDataStore
{
    
    var presenter: TeachersListPresentationLogic?
    var worker: TeachersListWorker?
    var respData = [TeachersListModels]()
    func fetchItems(request: TeachersListModel.Fetch.Request) {
        if request.user_id == nil {
        self.presenter?.presentFetchResults(resp: TeachersListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = TeachersListWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: TeachersListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: TeachersListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
