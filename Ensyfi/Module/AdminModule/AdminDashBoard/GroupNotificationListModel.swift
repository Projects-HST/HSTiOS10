//
//  GroupNotificationListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/11/21.
//

import Foundation
import UIKit

struct GroupNotificationListModel{
    struct Fetch {
        
        struct Request
        {
            var group_id : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [GroupNotificationListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedGroupNotificationListData
           {
               var notes : String?
               var name : String?
               var group_title : String?
               var group_title_id : String?
               var created_by : String?
               var created_at : String?
               var notification_type : String?
            }
              var displayedGroupNotificationListData: [DisplayedGroupNotificationListData]

        }
    }
}
