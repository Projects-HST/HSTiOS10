//
//  TeacherGroupListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import Foundation
import UIKit

protocol TeacherGroupListBusinessLogic
{
    func fetchItems(request: TeacherGroupListModel.Fetch.Request)
}
protocol TeacherGroupListDataStore
{
  
}

class TeacherGroupListInteractor: TeacherGroupListBusinessLogic,TeacherGroupListDataStore
{
    
    var presenter: TeacherGroupListPresentationLogic?
    var worker:TeacherGroupListWorker?
    var respData = [TeacherGroupListModels]()
    func fetchItems(request:TeacherGroupListModel.Fetch.Request) {
        if request.user_id == nil {
        self.presenter?.presentFetchResults(resp: TeacherGroupListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = TeacherGroupListWorker()
        worker!.fetch(user_id:request.user_id!,user_type:request.user_type!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: TeacherGroupListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp:TeacherGroupListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

