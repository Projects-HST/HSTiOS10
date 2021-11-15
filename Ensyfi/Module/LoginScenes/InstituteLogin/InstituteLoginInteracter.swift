//
//  InstituteLoginInteracter.swift
//  Ensyfi
//
//  Created by HappysanziMac on 19/08/21.
//

import Foundation

protocol InstituteLoginBusinessLogic
{
    func fetchItems(request: InstituteLoginModel.Fetch.Request)
}
protocol InstituteLoginDataStore
{
  
}

class InstituteLoginInteractor: InstituteLoginBusinessLogic, InstituteLoginDataStore
{
    
    var presenter: InstituteLoginPresentationLogic?
    var worker: InstituteLoginWorker?
 
    func fetchItems(request: InstituteLoginModel.Fetch.Request) {
        if request.userName == nil {
           self.presenter?.presentFetchResults(resp: InstituteLoginModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = InstituteLoginWorker()
        worker!.fetch(institue_code:request.institue_code!,userName:request.userName!,password:request.password!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: InstituteLoginModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: InstituteLoginModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

