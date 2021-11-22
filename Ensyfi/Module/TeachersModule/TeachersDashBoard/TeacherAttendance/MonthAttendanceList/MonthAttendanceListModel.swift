//
//  MonthAttendanceListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/11/21.
//

import Foundation
import UIKit

struct MonthAttendanceListModel{
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
            var testObj: [MonthAttendanceListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedMonthAttendanceListData
           {
               var abs_date : String?
               var enroll_id : String?
               var sec_name : String?
               var a_status : String?
               var attend_period : String?
               var class_name : String?
               var class_id : String?
               var at_id : String?
               var leaves : String?
               var name : String?
            }
              var displayedMonthAttendanceListData: [DisplayedMonthAttendanceListData]

        }
    }
}

