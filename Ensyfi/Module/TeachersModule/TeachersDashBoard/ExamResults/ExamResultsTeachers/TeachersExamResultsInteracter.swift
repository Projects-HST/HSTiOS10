//
//  TeachersExamResultsInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/10/21.
//

import Foundation
import UIKit

protocol TeachersExamsResultsBusinessLogic
{
    func fetchItems(request: TeachersExamsResultsModel.Fetch.Request)
}
protocol TeachersExamsResultsDataStore
{
  
}

class TeachersExamsResultsInteractor:TeachersExamsResultsBusinessLogic,TeachersExamsResultsDataStore
{
    
    var presenter: TeachersExamsResultsPresentationLogic?
    var worker:TeachersExamsResultsWorker?
    var respData = [TeachersExamsResultsModels]()
    func fetchItems(request:TeachersExamsResultsModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter?.presentFetchResults(resp: TeachersExamsResultsModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = TeachersExamsResultsWorker()
        worker!.fetch(class_id:request.class_id!,exam_id:request.exam_id!,subject_id:request.subject_id!,is_internal_external:request.is_internal_external!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp:TeachersExamsResultsModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp:TeachersExamsResultsModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
