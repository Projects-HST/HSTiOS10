//
//  RoleListIntercter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//

import Foundation
import UIKit

protocol RoleListBusinessLogic
{
    func fetchItems(request:RoleListModel.Fetch.Request)
}
protocol RoleListDataStore
{
  
}

class RoleListInteractor:RoleListBusinessLogic,RoleListDataStore
{
    
    var presenter: RoleListPresentationLogic?
    var worker: RoleListWorker?
    var respData = [RoleListModels]()
    func fetchItems(request: RoleListModel.Fetch.Request) {
        if request.user_id == nil {
        self.presenter?.presentFetchResults(resp: RoleListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = RoleListWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: RoleListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: RoleListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
