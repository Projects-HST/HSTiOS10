//
//  TeacherAttendancListsInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 11/10/21.
//


import Foundation
import UIKit

protocol DisplayAttenddanceListBusinessLogic
{
    func fetchItems(request: DisplayAttenddanceListModel.Fetch.Request)
}
protocol DisplayAttenddanceListDataStore
{
  
}

class DisplayAttenddanceListInteractor: DisplayAttenddanceListBusinessLogic,DisplayAttenddanceListDataStore
{
    
    var presenter: DisplayAttenddanceListPresentationLogic?
    var worker:DisplayAttenddanceListWorker?
    var respData = [DisplayAttenddanceListModels]()
    func fetchItems(request:DisplayAttenddanceListModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter?.presentFetchResults(resp: DisplayAttenddanceListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = DisplayAttenddanceListWorker()
        worker!.fetch(class_id:request.class_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: DisplayAttenddanceListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp:DisplayAttenddanceListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

