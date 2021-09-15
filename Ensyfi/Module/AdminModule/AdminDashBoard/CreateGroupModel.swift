//
//  CreateGroupModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//

import Foundation
import UIKit

struct CreateGroupModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var group_title : String?
            var group_lead_id : String?
            var status : String?
        }
        
        struct Response
        {
            var testObj: CreateGroupModels?
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
