//
//  OnDutyListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//

import Foundation
import UIKit

protocol ODStudentsListBusinessLogic
{
    func fetchItems(request: ODStudentsListModel.Fetch.Request)
}
protocol ODStudentsListDataStore
{
  
}

class ODStudentsListInteractor: ODStudentsListBusinessLogic,ODStudentsListDataStore
{
    
    var presenter: ODStudentsListPresentationLogic?
    var worker:ODStudentsListWorker?
    var respData = [ODStudentsListModels]()
    func fetchItems(request: ODStudentsListModel.Fetch.Request) {
        if request.user_type == nil {
        self.presenter?.presentFetchResults(resp: ODStudentsListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = ODStudentsListWorker()
        worker!.fetch(user_type:request.user_type!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: ODStudentsListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: ODStudentsListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

