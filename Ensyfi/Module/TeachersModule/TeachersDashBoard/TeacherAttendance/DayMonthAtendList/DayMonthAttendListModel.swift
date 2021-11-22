//
//  DayMonthAttendListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 17/11/21.
//

import Foundation
import UIKit

struct DayMonthAttendanceListModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var dynamic_db : String?
            var disp_type : String?
            var disp_date : String?
            var month_year : String?
        }
        struct Response
        {
            var testObj: [DayMonthAttendanceListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedDayMonthAttendanceListData
           {
               var enroll_id : String?
               var sec_name : String?
               var at_id : String?
               var a_status : String?
               var count : String?
               var class_id : String?
               var abs_date : String?
               var name : String?
               var class_name : String?
               var attend_period : String?
            
            }
              var displayedDayMonthAttendanceListData: [DisplayedDayMonthAttendanceListData]

        }
    }
}

