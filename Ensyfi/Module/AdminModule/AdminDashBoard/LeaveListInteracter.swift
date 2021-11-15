//
//  LeaveListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/09/21.
//

import Foundation
import UIKit

protocol LeavesListBusinessLogic
{
    func fetchItems(request: LeavesListModel.Fetch.Request)
}
protocol LeavesListDataStore
{
  
}

class LeavesListInteractor: LeavesListBusinessLogic, LeavesListDataStore
{
    
    var presenter: LeavesListPresentationLogic?
    var worker: LeavesListWorker?
    var respData = [LeavesListModels]()
    func fetchItems(request:LeavesListModel.Fetch.Request) {
        if request.user_id == nil {
        self.presenter?.presentFetchResults(resp: LeavesListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = LeavesListWorker()
        worker!.fetch(user_id:request.user_id!,dynamic_db:request.dynamic_db!,  onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: LeavesListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: LeavesListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

