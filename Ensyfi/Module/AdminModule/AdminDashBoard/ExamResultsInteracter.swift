//
//  ExamResults.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//
import Foundation
import UIKit

protocol ExamResultsBusinessLogic
{
    func fetchItems(request: ExamResultsModel.Fetch.Request)
}
protocol ExamResultsDataStore
{
  
}

class ExamResultsInteractor: ExamResultsBusinessLogic, ExamResultsDataStore
{
    
    var presenter2: ExamResultsPresentationLogic?
    var worker: ExamResultsWorker?
    var respData = [ExamResultsModels]()
    func fetchItems(request: ExamResultsModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter2?.presentFetchResults(resp: ExamResultsModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = ExamResultsWorker()
        worker!.fetch(class_id:request.class_id!,section_id:request.section_id!, onSuccess: { (resp) in
            self.presenter2?.presentFetchResults(resp: ExamResultsModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter2?.presentFetchResults(resp: ExamResultsModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

