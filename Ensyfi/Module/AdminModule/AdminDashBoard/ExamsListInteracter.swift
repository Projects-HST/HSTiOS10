//
//  ExamsListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation
import UIKit

protocol ExamListBusinessLogic
{
    func fetchItems(request: ExamListModel.Fetch.Request)
}
protocol ExamListDataStore
{
  
}

class ExamListInteractor: ExamListBusinessLogic, ExamListDataStore
{
    
    var presenter2: ExamListPresentationLogic?
    var worker: ExamListWorker?
    var respData = [ExamListModels]()
    func fetchItems(request: ExamListModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter2?.presentFetchResults(resp: ExamListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = ExamListWorker()
        worker!.fetch(class_id:request.class_id!,section_id:request.section_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter2?.presentFetchResults(resp: ExamListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter2?.presentFetchResults(resp: ExamListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
