//
//  TeacherLeaveListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/10/21.
//

import Foundation
import UIKit

protocol TeacherLeavesListBusinessLogic
{
    func fetchItems(request: TeacherLeavesListModel.Fetch.Request)
}
protocol TeacherLeavesListDataStore
{
  
}

class TeacherLeavesListInteractor: TeacherLeavesListBusinessLogic,TeacherLeavesListDataStore
{
    
    var presenter: TeacherLeavesListPresentationLogic?
    var worker: TeacherLeavesListWorker?
    var respData = [TeacherLeavesListModels]()
    func fetchItems(request:TeacherLeavesListModel.Fetch.Request) {
        if request.user_id == nil {
        self.presenter?.presentFetchResults(resp: TeacherLeavesListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = TeacherLeavesListWorker()
        worker!.fetch(user_id:request.user_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: TeacherLeavesListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: TeacherLeavesListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

