//
//  LeaveTypeListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/10/21.
//

import Foundation
import UIKit

struct TeacherLeavesRequestModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?

        }
        
        struct Response
        {
            var testObj: [TeacherLeavesRequestModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedTeacherLeavesRequestData
           {
               var id : String?
               var leave_type : String?
               var leave_title : String?
            
            }
              var displayedTeacherLeavesRequestData: [DisplayedTeacherLeavesRequestData]
        }
    }
}
