//
//  StudentsONDutyInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 23/10/21.
//

import Foundation
import UIKit

protocol StudentsONDutyBusinessLogic
{
    func fetchItems(request: StudentsONDutyModel.Fetch.Request)
}
protocol StudentsONDutyDataStore
{
  
}

class StudentsONDutyInteractor: StudentsONDutyBusinessLogic, StudentsONDutyDataStore
{
    
    var presenter1: StudentsONDutyPresentationLogic?
    var worker:StudentsONDutyWorker?
    var respData = [StudentsONDutyModels]()
    func fetchItems(request: StudentsONDutyModel.Fetch.Request) {
        if request.user_id == nil {
        self.presenter1?.presentFetchResults(resp: StudentsONDutyModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = StudentsONDutyWorker()
        worker!.fetch(user_id:request.user_id!,user_type:request.user_type!,dynamic_db:request.dynamic_db!,onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: StudentsONDutyModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: StudentsONDutyModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

