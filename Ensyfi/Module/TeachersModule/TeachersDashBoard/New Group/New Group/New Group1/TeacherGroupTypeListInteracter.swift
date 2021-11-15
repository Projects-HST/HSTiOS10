//
//  TeacherGroupTypeListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import Foundation
import UIKit

protocol TeacherGroupTypleListBusinessLogic
{
    func fetchItems(request: TeacherGroupTypleListModel.Fetch.Request)
}
protocol TeacherGroupTypleListDataStore
{
  
}

class TeacherGroupTypleListInteractor: TeacherGroupTypleListBusinessLogic,TeacherGroupTypleListDataStore
{
    var presenter: TeacherGroupTypleListPresentationLogic?
    var worker:TeacherGroupTypleListWorker?
    var respData = [TeacherGroupTypleListModels]()
    func fetchItems(request:TeacherGroupTypleListModel.Fetch.Request) {
        if request.user_id == nil {
        self.presenter?.presentFetchResults(resp: TeacherGroupTypleListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy"))
        }
        worker = TeacherGroupTypleListWorker()
        worker!.fetch(user_id:request.user_id!,user_type:request.user_type!,dynamic_db:request.dynamic_db!,  onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: TeacherGroupTypleListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp:TeacherGroupTypleListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}


