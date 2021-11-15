//
//  TeacherGroupAddVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import Foundation

protocol SendTecherGroupBusinessLogic
{
    func fetchItems(request:SendTecherGroupModel.Fetch.Request)
}
protocol SendTecherGroupDataStore
{
  
}

class SendTecherGroupInteractor:SendTecherGroupBusinessLogic,SendTecherGroupDataStore
{

    var presenter1:SendTecherGroupPresentationLogic?
    var worker:SendTecherGroupWorker?
 
    func fetchItems(request: SendTecherGroupModel.Fetch.Request) {
        if request.group_title_id == nil {
           self.presenter1?.presentFetchResults(resp:SendTecherGroupModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = SendTecherGroupWorker()
        worker!.fetch(group_title_id:request.group_title_id!, messagetype_sms:request.messagetype_sms!,messagetype_mail:request.messagetype_mail!, messagetype_notification:request.messagetype_notification!,message_details:request.message_details!, created_by:request.created_by!,dynamic_db:request.dynamic_db!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: SendTecherGroupModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: SendTecherGroupModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

