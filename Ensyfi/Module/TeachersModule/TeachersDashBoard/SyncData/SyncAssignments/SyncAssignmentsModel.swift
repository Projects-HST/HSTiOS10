//
//  SyncAssignmentsModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 10/11/21.
//

import Foundation
import UIKit

struct SyncAssignmentModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var teacher_id : String?
            var homeWork_type : String?
            var subject_id : String?
            var title : String?
            var test_date : String?
            var due_date : String?
            var homework_details : String?
            var created_by : String?
            var created_at : String?
        }
        
        struct Response
        {
            var testObj: SyncAssignmentModels?
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
