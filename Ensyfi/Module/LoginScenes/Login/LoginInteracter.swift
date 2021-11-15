//
//  LoginInteracter.swift
//  Ensyfi
//
//  Created by HappysanziMac on 19/08/21.
//


import Foundation

protocol LoginBusinessLogic
{
    func fetchItems(request: LoginModel.Fetch.Request)
}
protocol LoginDataStore
{
  
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{

    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
 
    func fetchItems(request: LoginModel.Fetch.Request) {
        if request.institue_id == nil {
           self.presenter?.presentFetchResults(resp: LoginModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = LoginWorker()
        worker!.fetch(institue_id:request.institue_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: LoginModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: LoginModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

