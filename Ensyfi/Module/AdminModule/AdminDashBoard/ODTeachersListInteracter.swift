//
//  ODTeachersListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation
import UIKit

protocol ODTeachersListBusinessLogic
{
    func fetchItems(request: ODTeachersListModel.Fetch.Request)
}
protocol ODTeachersListDataStore
{
  
}

class ODTeachersListInteractor: ODTeachersListBusinessLogic,ODTeachersListDataStore
{
    
    var presenter1: ODTeachersListPresentationLogic?
    var worker:ODTeachersListWorker?
    var respData = [ODTeachersListModels]()
    func fetchItems(request: ODTeachersListModel.Fetch.Request) {
        if request.user_type == nil {
        self.presenter1?.presentFetchResults(resp: ODTeachersListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = ODTeachersListWorker()
        worker!.fetch(user_type:request.user_type!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: ODTeachersListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: ODTeachersListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

