//
//  AddOnDutyInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 18/11/21.
//

import Foundation

protocol AddONDutyBusinessLogic
{
    func fetchItems(request:AddONDutyModel.Fetch.Request)
}
protocol AddONDutyDataStore
{
  
}

class AddONDutyInteractor:AddONDutyBusinessLogic,AddONDutyDataStore
{
    var presenter:AddONDutyPresentationLogic?
    var worker:AddONDutyWorker?
 
    func fetchItems(request: AddONDutyModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter?.presentFetchResults(resp:AddONDutyModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = AddONDutyWorker()
        worker!.fetch(user_id:request.user_id!, dynamic_db:request.dynamic_db!,user_type:request.user_type!, od_for:request.od_for!, from_date:request.from_date!,to_date:request.to_date!, created_by:request.created_by!, created_at:request.created_at!, status:request.status!,notes:request.notes!,onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: AddONDutyModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: AddONDutyModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
