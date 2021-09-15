//
//  GroupMembersListWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 15/09/21.
//


import Foundation
import UIKit

protocol GroupMembersListBusinessLogic
{
    func fetchItems(request:GroupMembersListModel.Fetch.Request)
}
protocol GroupMembersListDataStore
{
  
}

class GroupMembersListInteractor:GroupMembersListBusinessLogic,GroupMembersListDataStore
{
    
    var presenter: GroupMembersListPresentationLogic?
    var worker: GroupMembersListWorker?
    var respData = [GroupMembersListModels]()
    func fetchItems(request: GroupMembersListModel.Fetch.Request) {
        if request.group_id == nil {
        self.presenter?.presentFetchResults(resp: GroupMembersListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = GroupMembersListWorker()
        worker!.fetch(group_id:request.group_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: GroupMembersListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: GroupMembersListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
