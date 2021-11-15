//
//  SyncAttendanceModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 06/10/21.
//


import Foundation
import UIKit

struct SyncAttendanceModel{
    struct Fetch {
        
        struct Request
        {
            var ac_year : String?
            var class_id : String?
            var class_total : String?
            var no_of_present : String?
            var no_of_absent : String?
            var attendence_period : String?
            var created_by : String?
            var created_at : String?
            var status : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: SyncAttendanceModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
            var status : String?
            var msg: String?
            var attendance_id: String?
            var isError: Bool
            var message: String?
        }
    }
}
