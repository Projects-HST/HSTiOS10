//
//  GroupSectionListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//

import Foundation
import UIKit

protocol GroupSectionListBusinessLogic
{
    func fetchItems(request:GroupSectionListModel.Fetch.Request)
}
protocol GroupSectionListDataStore
{
  
}

class GroupSectionListInteractor:GroupSectionListBusinessLogic,GroupSectionListDataStore
{
    
    var presenter1: GroupSectionListPresentationLogic?
    var worker: GroupSectionListWorker?
    var respData = [GroupSectionListModels]()
    func fetchItems(request: GroupSectionListModel.Fetch.Request) {
        if request.user_id == nil {
        self.presenter1?.presentFetchResults(resp: GroupSectionListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = GroupSectionListWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: GroupSectionListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: GroupSectionListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
