//
//  ForgotPswdInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 23/08/21.


import Foundation

protocol ForgotPasswordBusinessLogic
{
    func fetchItems(request: ForgotPasswordModel.Fetch.Request)
}
protocol ForgotPasswordDataStore
{
  
}

class ForgotPasswordInteractor: ForgotPasswordBusinessLogic, ForgotPasswordDataStore
{

    var presenter: ForgotPasswordPresentationLogic?
    var worker: ForgotPasswordWorker?
 
    func fetchItems(request: ForgotPasswordModel.Fetch.Request) {
        if request.userName == nil {
           self.presenter?.presentFetchResults(resp: ForgotPasswordModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = ForgotPasswordWorker()
        worker!.fetch(userName:request.userName!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: ForgotPasswordModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: ForgotPasswordModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

