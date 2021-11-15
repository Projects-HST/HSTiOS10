//
//  ExamTimeTableModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//

import Foundation
import UIKit

struct ExamTimeTableModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var exam_id : String?
            var dynamic_db : String?

        }
        
        struct Response
        {
            var testObj: [ExamTimeTableModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedExamTimeTableData
           {
            var exam_name : String?
            var exam_id : String?
            var times : String?
            var subject_name : String?
            var exam_date : String?
            
            }
              var displayedExamTimeTableData: [DisplayedExamTimeTableData]

        }
    }
}




