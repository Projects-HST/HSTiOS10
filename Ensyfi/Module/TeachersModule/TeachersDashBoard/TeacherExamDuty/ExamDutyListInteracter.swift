//
//  ExamDutyListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/11/21.
//

import Foundation
import UIKit

protocol ExamDutyListBusinessLogic
{
    func fetchItems(request: ExamDutyListModel.Fetch.Request)
}
protocol ExamDutyListDataStore
{
  
}

class ExamDutyListInteractor: ExamDutyListBusinessLogic,ExamDutyListDataStore
{
    
    var presenter: ExamDutyListPresentationLogic?
    var worker:ExamDutyListWorker?
    var respData = [ExamDutyListModels]()
    func fetchItems(request:ExamDutyListModel.Fetch.Request) {
        if request.teacher_id == nil {
        self.presenter?.presentFetchResults(resp:ExamDutyListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = ExamDutyListWorker()
        worker!.fetch(teacher_id:request.teacher_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp:ExamDutyListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp:ExamDutyListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}


