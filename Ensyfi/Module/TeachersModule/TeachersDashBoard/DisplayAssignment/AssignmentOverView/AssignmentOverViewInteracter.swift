//
//  AssignmentOverViewInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 12/10/21.
//


import Foundation
import UIKit

protocol AssignmentOverViewBusinessLogic
{
    func fetchItems(request: AssignmentOverViewModel.Fetch.Request)
}
protocol AssignmentOverViewDataStore
{
  
}

class AssignmentOverViewInteractor: AssignmentOverViewBusinessLogic,AssignmentOverViewDataStore
{
    
    var presenter: AssignmentOverViewPresentationLogic?
    var worker:AssignmentOverViewWorker?
    var respData = [AssignmentOverViewModels]()
    func fetchItems(request:AssignmentOverViewModel.Fetch.Request) {
        if request.class_id == nil {
        self.presenter?.presentFetchResults(resp: AssignmentOverViewModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = AssignmentOverViewWorker()
        worker!.fetch(class_id:request.class_id!,hw_date:request.hw_date!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: AssignmentOverViewModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp:AssignmentOverViewModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
