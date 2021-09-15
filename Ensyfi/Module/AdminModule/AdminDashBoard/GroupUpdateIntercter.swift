//
//  GroupUpdateIntercter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 15/09/21.
//

import Foundation

protocol UpdateGroupBusinessLogic
{
    func fetchItems(request:UpdateGroupModel.Fetch.Request)
}
protocol UpdateGroupDataStore
{
  
}

class UpdateGroupInteractor:UpdateGroupBusinessLogic,UpdateGroupDataStore
{

    var presenter1:UpdateGroupPresentationLogic?
    var worker:UpdateGroupWorker?
 
    func fetchItems(request: UpdateGroupModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter1?.presentFetchResults(resp: UpdateGroupModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = UpdateGroupWorker()
        worker!.fetch(user_id:request.user_id!, group_title:request.group_title!,group_lead_id:request.group_lead_id!, status:request.status!, group_id:request.group_id!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: UpdateGroupModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: UpdateGroupModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
