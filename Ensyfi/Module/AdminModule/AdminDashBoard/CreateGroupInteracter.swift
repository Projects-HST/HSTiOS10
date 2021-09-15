//
//  CreateGroupInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//

import Foundation

protocol CreateGroupBusinessLogic
{
    func fetchItems(request:CreateGroupModel.Fetch.Request)
}
protocol CreateGroupDataStore
{
  
}

class CreateGroupInteractor:CreateGroupBusinessLogic, CreateGroupDataStore
{

    var presenter1:CreateGroupPresentationLogic?
    var worker:CreateGroupWorker?
 
    func fetchItems(request: CreateGroupModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter1?.presentFetchResults(resp: CreateGroupModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = CreateGroupWorker()
        worker!.fetch(user_id:request.user_id!, group_title:request.group_title!,group_lead_id:request.group_lead_id!, status:request.status!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: CreateGroupModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: CreateGroupModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

