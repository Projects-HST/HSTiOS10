//
//  StudentAddGroupListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//

import Foundation
import UIKit

protocol StudentGroupAddListBusinessLogic
{
    func fetchItems(request:StudentGroupAddListModel.Fetch.Request)
}
protocol StudentGroupAddListDataStore
{
  
}

class StudentGroupAddListInteractor:StudentGroupAddListBusinessLogic,StudentGroupAddListDataStore
{
    
    var presenter2: StudentGroupAddListPresentationLogic?
    var worker: StudentGroupAddListWorker?
    var respData = [StudentGroupAddListModels]()
    func fetchItems(request: StudentGroupAddListModel.Fetch.Request) {
        if request.group_id == nil {
        self.presenter2?.presentFetchResults(resp: StudentGroupAddListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = StudentGroupAddListWorker()
        worker!.fetch(group_id:request.group_id!,group_user_type:request.group_user_type!, class_id:request.class_id!, onSuccess: { (resp) in
            self.presenter2?.presentFetchResults(resp:StudentGroupAddListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter2?.presentFetchResults(resp: StudentGroupAddListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

