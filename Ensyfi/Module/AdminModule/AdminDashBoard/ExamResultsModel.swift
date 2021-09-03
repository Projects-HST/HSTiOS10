//
//  ExamResultsModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//

import Foundation
import UIKit

struct ExamResultsModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
           
        }
        
        struct Response
        {
            var testObj: [ExamResultsModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedExamResultsData
           {
            var exam_id : String?
        //    var classmaster_id : String?
            var exam_name : String?
            var is_internal_external : String?
            var Fromdate : String?
            var Todate : String?
            var MarkStatus : String?
            
            }
              var displayedExamResultsData: [DisplayedExamResultsData]

        }
    }
}
