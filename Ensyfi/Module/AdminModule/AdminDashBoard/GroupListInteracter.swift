//
//  GroupListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//

import Foundation
import UIKit

protocol GroupListBusinessLogic
{
    func fetchItems(request: GroupListModel.Fetch.Request)
}
protocol GroupListDataStore
{
  
}

class GroupListInteractor: GroupListBusinessLogic, GroupListDataStore
{
    
    var presenter: GroupListPresentationLogic?
    var worker: GroupListWorker?
    var respData = [GroupListModels]()
    func fetchItems(request: GroupListModel.Fetch.Request) {
        if request.user_id == nil {
        self.presenter?.presentFetchResults(resp: GroupListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = GroupListWorker()
        worker!.fetch(user_id:request.user_id!,user_type:request.user_type!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: GroupListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: GroupListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

