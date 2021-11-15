//
//  ClassSectionListInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//

import Foundation
import UIKit

protocol Class_SectionBusinessLogic
{
    func fetchItems(request: Class_SectionModel.Fetch.Request)
}
protocol Class_SectionDataStore
{
  
}

class Class_SectionInteractor: Class_SectionBusinessLogic, Class_SectionDataStore
{
    var presenter: Class_SectionPresentationLogic?
    var worker: Class_SectionWorker?
    var respData = [Class_SectionModels]()
    func fetchItems(request: Class_SectionModel.Fetch.Request) {
        if request.user_id == nil {
        self.presenter?.presentFetchResults(resp: Class_SectionModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = Class_SectionWorker()
        worker!.fetch(user_id:request.user_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: Class_SectionModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: Class_SectionModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
