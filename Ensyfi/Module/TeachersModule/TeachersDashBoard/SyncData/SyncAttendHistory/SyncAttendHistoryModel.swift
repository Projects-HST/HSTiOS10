//
//  SyncAttendHistoryModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 09/11/21.
//


import Foundation
import UIKit

struct SyncAttendanceHistoryModel{
    struct Fetch {
        
        struct Request
        {
            var attend_id : String?
            var class_id : String?
            var student_id : String?
            var abs_date : String?
            var a_status : String?
            var attend_period : String?
            var a_val : String?
            var a_taken_by : String?
            var created_at : String?
            var status : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: SyncAttendanceHistoryModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
            var status : String?
            var msg: String?
            var last_attendance_history_id: String?
            var isError: Bool
            var message: String?
        }
    }
}
