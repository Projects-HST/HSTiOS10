//
//  OverViewAttendanceModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 11/10/21.
//

import Foundation
import UIKit

struct AttendanceRecordListModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var attend_id : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [AttendanceRecordListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedAttendanceRecordListData
           {
            var sex : String?
            var a_status : String?
            var enroll_id : String?
            var admission_id : String?
            var name : String?
            
            
            }
              var displayedAttendanceRecordListData: [DisplayedAttendanceRecordListData]

        }
    }
}
