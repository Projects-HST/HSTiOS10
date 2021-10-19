//
//  TeachersExamsListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/10/21.
//

import Foundation
import UIKit

protocol TeachersExamsListBusinessLogic
{
    func fetchItems(request: TeachersExamsListModel.Fetch.Request)
}
protocol TeachersExamsListDataStore
{
  
}

class TeachersExamsListInteractor:TeachersExamsListBusinessLogic,TeachersExamsListDataStore
{
    
    var presenter: TeachersExamsListPresentationLogic?
    var worker:TeachersExamsListWorker?
    var respData = [TeachersExamsListModels]()
    func fetchItems(request:TeachersExamsListModel.Fetch.Request) {
        if request.teacher_id == nil {
        self.presenter?.presentFetchResults(resp: TeachersExamsListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = TeachersExamsListWorker()
        worker!.fetch(teacher_id:request.teacher_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp:TeachersExamsListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp:TeachersExamsListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
