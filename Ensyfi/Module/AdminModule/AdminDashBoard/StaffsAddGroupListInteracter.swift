//
//  StaffsAddGroupListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 17/09/21.
//

import Foundation
import UIKit

protocol StaffGroupAddListBusinessLogic
{
    func fetchItems(request:StaffGroupAddListModel.Fetch.Request)
}
protocol StaffGroupAddListDataStore
{
  
}

class StaffGroupAddListInteractor:StaffGroupAddListBusinessLogic,StaffGroupAddListDataStore
{
    
    var presenter3: StaffGroupAddListPresentationLogic?
    var worker: StaffGroupAddListWorker?
    var respData = [StaffGroupAddListModels]()
    func fetchItems(request: StaffGroupAddListModel.Fetch.Request) {
        if request.group_id == nil {
        self.presenter3?.presentFetchResults(resp: StaffGroupAddListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = StaffGroupAddListWorker()
        worker!.fetch(group_id:request.group_id!,group_user_type:request.group_user_type!, class_id:request.class_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter3?.presentFetchResults(resp:StaffGroupAddListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter3?.presentFetchResults(resp: StaffGroupAddListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}


