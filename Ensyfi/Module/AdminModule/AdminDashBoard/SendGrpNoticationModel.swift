//
//  SendGrpNoticationModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 22/11/21.
//


import Foundation
import UIKit

struct SendGroupNotificationModel{
    struct Fetch {
        
        struct Request
        {
            var group_id : String?
            var notification_type : String?
            var notes : String?
            var user_id : String?
            var dynamic_db : String?
        }
        struct Response
        {
            var testObj: SendGroupNotificationModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
            var status : String?
            var msg: String?
            var isError: Bool
            var message: String?
        }
    }
}
