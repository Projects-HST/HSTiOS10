//
//  StaffsAddGroupListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 17/09/21.
//

import Foundation
import UIKit

struct StaffGroupAddListModel{
    struct Fetch {
        
        struct Request
        {
            var group_id : String?
            var group_user_type : String?
            var class_id : String?
        }
        
        struct Response
        {
            var testObj: [StaffGroupAddListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedStaffGroupAddListData
           {
            var Status : String?
            var user_id : String?
            var name : String?
            }
              var displayedStaffGroupAddListData: [DisplayedStaffGroupAddListData]

        }
    }
}
