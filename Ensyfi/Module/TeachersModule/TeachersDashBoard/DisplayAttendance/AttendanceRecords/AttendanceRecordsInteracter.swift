//
//  OverViewAttendanceInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 11/10/21.
//

import Foundation
import UIKit

protocol AttendanceRecordListBusinessLogic
{
    func fetchItems(request: AttendanceRecordListModel.Fetch.Request)
}
protocol AttendanceRecordListDataStore
{
  
}

class AttendanceRecordListInteractor: AttendanceRecordListBusinessLogic,AttendanceRecordListDataStore
{
    
    var presenter: AttendanceRecordListPresentationLogic?
    var worker:AttendanceRecordListWorker?
    var respData = [AttendanceRecordListModels]()
    func fetchItems(request:AttendanceRecordListModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter?.presentFetchResults(resp: AttendanceRecordListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = AttendanceRecordListWorker()
        worker!.fetch(class_id:request.class_id!,attend_id:request.attend_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: AttendanceRecordListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp:AttendanceRecordListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

