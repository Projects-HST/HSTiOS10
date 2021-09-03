//
//  ExamListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//


import Foundation
import UIKit

struct ExamListModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var section_id : String?
           
        }
        
        struct Response
        {
            var testObj: [ExamListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedExamListData
           {
            var exam_id : String?
        //    var classmaster_id : String?
            var exam_name : String?
            var is_internal_external : String?
            var Fromdate : String?
            var Todate : String?
            var MarkStatus : String?
            
            }
              var displayedExamListData: [DisplayedExamListData]

        }
    }
}
