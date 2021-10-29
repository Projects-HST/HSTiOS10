//
//  TimeTableListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/10/21.
//

import Foundation
import UIKit

protocol TimeTableListBusinessLogic
{
    func fetchItems(request: TimeTableListModel.Fetch.Request)
}
protocol TimeTableListDataStore
{
  
}

class TimeTableListInteractor:TimeTableListBusinessLogic,TimeTableListDataStore
{
    
    var presenter1: TimeTableListPresentationLogic?
    var worker:TimeTableListWorker?
    var respData = [TimeTableListModels]()
    func fetchItems(request: TimeTableListModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter1?.presentFetchResults(resp:TimeTableListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = TimeTableListWorker()
        worker!.fetch(class_id:request.class_id!,onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: TimeTableListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: TimeTableListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
