//
//  AssignmentListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 12/10/21.
//


import Foundation
import UIKit

protocol AssignmentListBusinessLogic
{
    func fetchItems(request: AssignmentListModel.Fetch.Request)
}
protocol AssignmentListDataStore
{
  
}

class AssignmentListInteractor: AssignmentListBusinessLogic,AssignmentListDataStore
{
    
    var presenter: AssignmentListPresentationLogic?
    var worker:AssignmentListWorker?
    var respData = [AssignmentListModels]()
    func fetchItems(request:AssignmentListModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter?.presentFetchResults(resp: AssignmentListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = AssignmentListWorker()
        worker!.fetch(class_id:request.class_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: AssignmentListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp:AssignmentListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

