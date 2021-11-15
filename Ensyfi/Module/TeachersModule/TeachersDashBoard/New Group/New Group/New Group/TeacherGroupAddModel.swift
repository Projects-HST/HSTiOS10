//
//  TeacherGroupAddModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import Foundation
import UIKit

struct SendTecherGroupModel{
    struct Fetch {
        
        struct Request
        {
            var group_title_id : String?
            var messagetype_sms : String?
            var messagetype_mail : String?
            var messagetype_notification : String?
            var message_details : String?
            var created_by : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: SendTecherGroupModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
            var status : String?
            var msg: String?
            var last_group_history_id: String?
            var isError: Bool
            var message: String?
        }
    }
}
