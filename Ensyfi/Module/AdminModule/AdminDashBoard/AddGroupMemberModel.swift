//
//  AddGroupMemberModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 17/09/21.
//

import Foundation
import UIKit

struct AddGroupMemberModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var group_member_id : String?
            var group_user_type : String?
            var status : String?
            var group_id : String?
            
        }
        
        struct Response
        {
            var testObj: AddGroupMemberModels?
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
