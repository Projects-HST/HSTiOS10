//
//  GroupUpdateModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 15/09/21.
//


import Foundation
import UIKit

struct UpdateGroupModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var group_title : String?
            var group_lead_id : String?
            var status : String?
            var group_id : String?
            
        }
        
        struct Response
        {
            var testObj: UpdateGroupModels?
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
