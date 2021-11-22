//
//  GroupNotificationListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/11/21.
//

import Foundation
import UIKit

protocol GroupNotificationListBusinessLogic
{
    func fetchItems(request: GroupNotificationListModel.Fetch.Request)
}
protocol GroupNotificationListDataStore
{
  
}

class GroupNotificationListInteractor: GroupNotificationListBusinessLogic, GroupNotificationListDataStore
{
    
    var presenter: GroupNotificationListPresentationLogic?
    var worker: GroupNotificationListWorker?
    var respData = [GroupNotificationListModels]()
    func fetchItems(request: GroupNotificationListModel.Fetch.Request) {
        if request.group_id == nil {
        self.presenter?.presentFetchResults(resp: GroupNotificationListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = GroupNotificationListWorker()
        worker!.fetch(group_id:request.group_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: GroupNotificationListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: GroupNotificationListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

