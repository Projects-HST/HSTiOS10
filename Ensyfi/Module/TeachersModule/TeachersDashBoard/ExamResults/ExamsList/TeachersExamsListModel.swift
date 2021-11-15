//
//  TeachersExamsListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/10/21.
//

import Foundation
import UIKit

struct TeachersExamsListModel{
    struct Fetch {
        
        struct Request
        {
            var teacher_id : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [TeachersExamsListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedTeachersExamsListData
           {
            var exam_id : String?
            var exam_name : String?
            var subject_name : String?
            var subject_id : String?
            var exam_date : String?
            var times : String?
            var is_internal_external : String?
            var subject_total : String?
            var internal_mark : String?
            var external_mark : String?
            var classmaster_id : String?
            var class_name : String?
            var sec_name : String?
            
            }
              var displayedTeachersExamsListData: [DisplayedTeachersExamsListData]

        }
    }
}

