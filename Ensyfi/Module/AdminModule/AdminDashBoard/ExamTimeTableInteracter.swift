//
//  ExamTimeTableInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//


import Foundation
import UIKit

protocol ExamTimeTableBusinessLogic
{
    func fetchItems(request:ExamTimeTableModel.Fetch.Request)
}
protocol ExamTimeTableDataStore
{
  
}

class ExamTimeTableInteractor: ExamTimeTableBusinessLogic,ExamTimeTableDataStore
{
    
    var presenter: ExamTimeTablePresentationLogic?
    var worker: ExamTimeTableWorker?
    var respData = [ExamTimeTableModels]()
    func fetchItems(request:ExamTimeTableModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter?.presentFetchResults(resp: ExamTimeTableModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = ExamTimeTableWorker()
        worker!.fetch(class_id:request.class_id!,exam_id:request.exam_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: ExamTimeTableModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: ExamTimeTableModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
