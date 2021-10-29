//
//  TimeTableListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/10/21.
//
//


import Foundation
import UIKit

struct TimeTableListModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
        }
        
        struct Response
        {
            var testObj: [TimeTableListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedTimeTableListData
           {
               var to_time : String?
               var day_id : String?
               var teacher_id : String?
               var class_name : String?
               var name : String?
               var break_name : String?
               var from_time : String?
               var subject_name : String?
               var subject_id : String?
               var is_break : String?
               var table_id : String?
               var period : String?
               var class_id : String?
               var sec_name : String?

            
            }
              var displayedTimeTableListData: [DisplayedTimeTableListData]

        }
    }
}
