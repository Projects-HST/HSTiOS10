//
//  StudentListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 25/08/21.
//

import Foundation
import UIKit

protocol StudentsListBusinessLogic
{
    func fetchItems(request: StudentsListModel.Fetch.Request)
}
protocol StudentsListDataStore
{
  
}

class StudentsListInteractor: StudentsListBusinessLogic, StudentsListDataStore
{
    
    var presenter2: StudentsListPresentationLogic?
    var worker: StudentsListWorker?
    var respData = [StudentsListModels]()
    func fetchItems(request: StudentsListModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter2?.presentFetchResults(resp: StudentsListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = StudentsListWorker()
        worker!.fetch(class_id:request.class_id!,section_id:request.section_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter2?.presentFetchResults(resp: StudentsListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter2?.presentFetchResults(resp: StudentsListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

