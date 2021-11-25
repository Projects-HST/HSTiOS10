//
//  GroupTitleListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 22/11/21.
//

import Foundation
import UIKit

struct GroupTitleListModel{
    struct Fetch {
        
        struct Request
        {
            var user_type : String?
            var dynamic_db : String?
            var user_id : String?
        }

        struct Response
        {
            var testObj: [GroupTitleListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedGroupTitleListData
           {
               var group_title : String?
               var id : String?
            }
              var displayedGroupTitleListData: [DisplayedGroupTitleListData]

        }
    }
}
