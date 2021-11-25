//
//  SendGrpNoticationInteracter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 22/11/21.
//

import Foundation

protocol SendGroupNotificationBusinessLogic
{
    func fetchItems(request:SendGroupNotificationModel.Fetch.Request)
}
protocol SendGroupNotificationDataStore
{
  
}

class SendGroupNotificationInteractor:SendGroupNotificationBusinessLogic,SendGroupNotificationDataStore
{

    var presenter1:SendGroupNotificationPresentationLogic?
    var worker:SendGroupNotificationWorker?
 
    func fetchItems(request: SendGroupNotificationModel.Fetch.Request) {
        if request.group_id == nil {
           self.presenter1?.presentFetchResults(resp:SendGroupNotificationModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = SendGroupNotificationWorker()
        worker!.fetch(group_id:request.group_id!,notification_type:request.notification_type!,notes:request.notes!, user_id:request.user_id!,  dynamic_db:request.dynamic_db!,onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: SendGroupNotificationModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: SendGroupNotificationModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
