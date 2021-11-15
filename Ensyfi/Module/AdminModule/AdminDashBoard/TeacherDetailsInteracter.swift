//
//  TeacherDetailsInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//

import Foundation
import UIKit

protocol TeacherDetailsBusinessLogic
{
    func fetchItems(request: TeacherDetailsModel.Fetch.Request)
}
protocol TeacherDetailsDataStore
{
  
}

class TeacherDetailsInteractor: TeacherDetailsBusinessLogic, TeacherDetailsDataStore
{
    
    var presenter: TeacherDetailsPresentationLogic?
    var worker: TeacherDetailsWorker?
    var respData = [TeacherDetailsModels]()
    func fetchItems(request: TeacherDetailsModel.Fetch.Request) {
        if request.teacher_id == nil {
        self.presenter?.presentFetchResults(resp: TeacherDetailsModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = TeacherDetailsWorker()
        worker!.fetch(teacher_id:request.teacher_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: TeacherDetailsModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: TeacherDetailsModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

