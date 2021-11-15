//
//  GroupListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//

import Foundation
import UIKit

struct GroupListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var user_type : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [GroupListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedGroupListData
           {
            var id : String?
            var group_title : String?
            var group_lead_id : String?
            var year_id : String?
            var status : String?
            var created_by : String?
            var updated_by : String?
            var updated_at : String?
            var lead_name : String?
           
           
            }
              var displayedGroupListData: [DisplayedGroupListData]

        }
    }
}
