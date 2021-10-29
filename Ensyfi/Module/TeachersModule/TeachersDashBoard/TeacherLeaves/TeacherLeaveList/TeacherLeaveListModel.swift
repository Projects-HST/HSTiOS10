//
//  TeacherLeaveListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/10/21.
//


import Foundation
import UIKit

struct TeacherLeavesListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?

        }
        
        struct Response
        {
            var testObj: [TeacherLeavesListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedTeacherLeavesListData
           {
               var leave_title : String?
               var from_leave_date : String?
               var to_leave_date : String?
               var frm_time : String?
               var to_time : String?
               var leave_type : String?
               var status : String?
               var teacher_id : String?
               var name : String?
            
            }
              var displayedTeacherLeavesListData: [DisplayedTeacherLeavesListData]

        }
    }
}
