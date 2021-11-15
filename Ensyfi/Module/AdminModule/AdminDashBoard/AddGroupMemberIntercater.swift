//
//  AddGroupMember.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 17/09/21.
//
import Foundation

protocol AddGroupMemberBusinessLogic
{
    func fetchItems(request:AddGroupMemberModel.Fetch.Request)
}
protocol AddGroupMemberDataStore
{
  
}

class AddGroupMemberInteractor:AddGroupMemberBusinessLogic, AddGroupMemberDataStore
{

    var presenter4:AddGroupMemberPresentationLogic?
    var worker:AddGroupMemberWorker?
 
    func fetchItems(request: AddGroupMemberModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter4?.presentFetchResults(resp: AddGroupMemberModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = AddGroupMemberWorker()
        worker!.fetch(user_id:request.user_id!, group_member_id:request.group_member_id!,group_user_type:request.group_user_type!, status:request.status!,group_id:request.group_id!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter4?.presentFetchResults(resp:AddGroupMemberModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter4?.presentFetchResults(resp: AddGroupMemberModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

