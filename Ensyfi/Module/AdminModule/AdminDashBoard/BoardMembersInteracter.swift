//
//  BoardMembersInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//

import Foundation
import UIKit

protocol BoardMembersListBusinessLogic
{
    func fetchItems(request: BoardMembersListModel.Fetch.Request)
}
protocol BoardMembersListDataStore
{
  
}

class BoardMembersListInteractor: BoardMembersListBusinessLogic,BoardMembersListDataStore
{
    
    var presenter: BoardMembersListPresentationLogic?
    var worker: BoardMembersListWorker?
    var respData = [BoardMembersListModels]()
    func fetchItems(request: BoardMembersListModel.Fetch.Request) {
        if request.user_id == nil {
        self.presenter?.presentFetchResults(resp: BoardMembersListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = BoardMembersListWorker()
        worker!.fetch(user_id:request.user_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: BoardMembersListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: BoardMembersListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

