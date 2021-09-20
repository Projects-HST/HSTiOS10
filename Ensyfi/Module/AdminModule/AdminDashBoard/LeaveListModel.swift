//
//  LeaveListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/09/21.
//


import Foundation
import UIKit

struct LeavesListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?

        }
        
        struct Response
        {
            var testObj: [LeavesListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedLeavesListData
           {
            var leave_id : String?
            var user_id : String?
            var name : String?
            var leave_title : String?
            var leave_type : String?
            var status : String?
            var from_leave_date : String?
            var to_leave_date : String?
            var leave_description : String?
            var frm_time : String?
            var to_time : String?
            
            }
              var displayedLeavesListData: [DisplayedLeavesListData]

        }
    }
}
