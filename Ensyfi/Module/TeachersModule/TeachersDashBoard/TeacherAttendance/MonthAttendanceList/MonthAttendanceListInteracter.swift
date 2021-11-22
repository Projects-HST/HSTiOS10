//
//  MonthAttendanceListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/11/21.
//


import Foundation
import UIKit

protocol MonthAttendanceListBusinessLogic
{
    func fetchItems(request: MonthAttendanceListModel.Fetch.Request)
}
protocol MonthAttendanceListDataStore
{
  
}

class MonthAttendanceListInteractor: MonthAttendanceListBusinessLogic,MonthAttendanceListDataStore
{
    
    var presenter1: MonthAttendanceListPresentationLogic?
    var worker:MonthAttendanceListWorker?
    var respData = [MonthAttendanceListModels]()
    func fetchItems(request:MonthAttendanceListModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter1?.presentFetchResults(resp:MonthAttendanceListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = MonthAttendanceListWorker()
        worker!.fetch(class_id:request.class_id!,dynamic_db:request.dynamic_db!,disp_type:request.disp_type!,disp_date:request.disp_date!,month_year:request.month_year!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp:MonthAttendanceListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp:MonthAttendanceListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
