//
//  StudenceAttendanceModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//


import Foundation
import UIKit

struct StudentAttendanceModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var stud_id : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [StudentAttendanceModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedStudentAttendanceData
           {
            var abs_count : String?
            var at_id : String?
            var student_id : String?
            var abs_date : String?
            var a_status : String?
            
            }
              var displayedStudentAttendanceData: [DisplayedStudentAttendanceData]

        }
    }
}
