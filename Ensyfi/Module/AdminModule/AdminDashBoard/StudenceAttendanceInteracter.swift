//
//  StudenceAttendanceInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//
import Foundation
import UIKit

protocol StudentAttendanceBusinessLogic
{
    func fetchItems(request: StudentAttendanceModel.Fetch.Request)
}
protocol StudentAttendanceDataStore
{
  
}

class StudentAttendanceInteractor: StudentAttendanceBusinessLogic, StudentAttendanceDataStore
{
    
    var presenter: StudentAttendancePresentationLogic?
    var worker: StudentAttendanceWorker?
    var respData = [StudentAttendanceModels]()
    func fetchItems(request: StudentAttendanceModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter?.presentFetchResults(resp: StudentAttendanceModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = StudentAttendanceWorker()
        worker!.fetch(class_id:request.class_id!,stud_id:request.stud_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: StudentAttendanceModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: StudentAttendanceModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

