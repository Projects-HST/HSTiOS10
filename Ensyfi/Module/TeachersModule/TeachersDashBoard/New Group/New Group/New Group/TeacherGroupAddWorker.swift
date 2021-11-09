//
//  TeacherGroupAddWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import Foundation
import UIKit

typealias SendTecherGroupresponseHandler = (_ response:SendTecherGroupModel.Fetch.Response) ->()

class SendTecherGroupWorker{

   func fetch(group_title_id:String,messagetype_sms:String,messagetype_mail:String,messagetype_notification:String,message_details:String,created_by:String, onSuccess successCallback:(SendTecherGroupresponseHandler)?,onFailure failureCallback: @escaping(SendTecherGroupresponseHandler)) {
       let manager = TeachersAPIManager()
       manager.callAPISendTecherGroup(
        group_title_id:group_title_id, messagetype_sms:messagetype_sms,messagetype_mail:messagetype_mail, messagetype_notification:messagetype_notification,message_details:message_details, created_by:created_by,onSuccess: { (resp)  in
               successCallback?(SendTecherGroupModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(SendTecherGroupModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

var group_title_id : String?
var messagetype_sms : String?
var messagetype_mail : String?
var messagetype_notification : String?
var message_details : String?
var created_by : String?
