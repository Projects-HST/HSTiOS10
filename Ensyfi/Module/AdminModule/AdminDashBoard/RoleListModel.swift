//
//  RoleListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//
import Foundation
import UIKit

struct RoleListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [RoleListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedRoleListData
           {
            var role_id : String?
            var staff_status : String?
            var user_type_name : String?
            var status : String?
            }
              var displayedRoleListData: [DisplayedRoleListData]

        }
    }
}
