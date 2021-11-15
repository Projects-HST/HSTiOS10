//
//  ChangePasswordInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/09/21.
//

import Foundation

protocol ChangePasswordBusinessLogic
{
    func fetchItems(request:ChangePasswordModel.Fetch.Request)
}
protocol ChangePasswordDataStore
{
  
}

class ChangePasswordInteractor:ChangePasswordBusinessLogic,ChangePasswordDataStore
{

    var presenter:ChangePasswordPresentationLogic?
    var worker:ChangePasswordWorker?
 
    func fetchItems(request:ChangePasswordModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter?.presentFetchResults(resp: ChangePasswordModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = ChangePasswordWorker()
        worker!.fetch(user_id:request.user_id!, old_password:request.old_password!,password:request.password!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: ChangePasswordModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: ChangePasswordModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

