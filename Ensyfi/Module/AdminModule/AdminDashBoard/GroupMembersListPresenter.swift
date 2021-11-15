//
//  GroupMembersListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 15/09/21.
//

import Foundation
import UIKit

struct GroupMembersListModel{
    struct Fetch {
        
        struct Request
        {
            var group_id : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [GroupMembersListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedGroupMembersListData
           {
            var name : String?
            var id : String?
            var user_type_name : String?
           
            }
              var displayedGroupMembersListData: [DisplayedGroupMembersListData]

        }
    }
}

