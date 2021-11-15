//
//  SudentsAdminInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 24/08/21.
//

import Foundation
import UIKit

protocol ClassViewBusinessLogic
{
    func fetchItems(request: ClassViewModel.Fetch.Request)
}
protocol ClassViewDataStore
{
  
}

class ClassViewInteractor: ClassViewBusinessLogic, ClassViewDataStore
{
    var presenter: ClassViewPresentationLogic?
    var worker: ClassViewWorker?
    var respData = [ClassViewModels]()
    func fetchItems(request: ClassViewModel.Fetch.Request) {
        if request.user_id == nil {
        self.presenter?.presentFetchResults(resp: ClassViewModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = ClassViewWorker()
        worker!.fetch(user_id:request.user_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: ClassViewModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: ClassViewModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

