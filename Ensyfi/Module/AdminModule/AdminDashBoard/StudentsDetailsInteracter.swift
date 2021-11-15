//
//  StudentsDetailsInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/08/21.
//

import Foundation
import UIKit

protocol StudentDetailsBusinessLogic
{
    func fetchItems(request: StudentDetailsModel.Fetch.Request)
}
protocol StudentDetailsDataStore
{
  
}

class StudentDetailsInteractor: StudentDetailsBusinessLogic, StudentDetailsDataStore
{
    
    var presenter: StudentDetailsPresentationLogic?
    var worker: StudentDetailsWorker?
    var respData = [StudentDetailsModels]()
    func fetchItems(request: StudentDetailsModel.Fetch.Request) {
        if request.student_id == nil {
        self.presenter?.presentFetchResults(resp: StudentDetailsModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = StudentDetailsWorker()
        worker!.fetch(student_id:request.student_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: StudentDetailsModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: StudentDetailsModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

