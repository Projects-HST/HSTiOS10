//
//  TeachersExamResultsModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/10/21.
//

import Foundation
import UIKit

struct TeachersExamsResultsModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var exam_id : String?
            var subject_id : String?
            var is_internal_external : String?
           
        }
        
        struct Response
        {
            var testObj: [TeachersExamsResultsModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedTeachersExamsResultsData
           {
            var name : String?
            var exam_name : String?
            var subject_name : String?
            var internal_mark : String?
            var internal_grade : String?
            var external_mark : String?
            var external_grade : String?
            var total_marks : String?
            var total_grade : String?
            var enroll_id : String?
            
            }
              var displayedTeachersExamsResultsData: [DisplayedTeachersExamsResultsData]

        }
    }
}
