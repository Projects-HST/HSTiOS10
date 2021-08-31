//
//  SectionListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 25/08/21.
//

import Foundation
import UIKit

protocol SectionListBusinessLogic
{
    func fetchItems(request: SectionListModel.Fetch.Request)
}
protocol SectionListDataStore
{
  
}

class SectionListInteractor: SectionListBusinessLogic, SectionListDataStore
{
    
    var presenter1: SectionListPresentationLogic?
    var worker: SectionListWorker?
    var respData = [SectionListModels]()
    func fetchItems(request: SectionListModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter1?.presentFetchResults(resp: SectionListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = SectionListWorker()
        worker!.fetch(class_id:request.class_id!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: SectionListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: SectionListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

