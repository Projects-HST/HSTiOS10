//
//  ClassAttendanceIntercter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//

import Foundation
import UIKit

protocol ClassAttendanceListBusinessLogic
{
    func fetchItems(request: ClassAttendanceListModel.Fetch.Request)
}
protocol ClassAttendanceListDataStore
{
  
}

class ClassAttendanceListInteractor: ClassAttendanceListBusinessLogic, ClassAttendanceListDataStore
{
    var presenter: ClassAttendanceListPresentationLogic?
    var worker: ClassAttendanceListWorker?
    var respData = [ClassAttendanceListModels]()
    func fetchItems(request: ClassAttendanceListModel.Fetch.Request) {
        if request.date == nil {
        self.presenter?.presentFetchResults(resp: ClassAttendanceListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = ClassAttendanceListWorker()
        worker!.fetch(date:request.date!,class_ids:request.class_ids!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp:ClassAttendanceListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: ClassAttendanceListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

