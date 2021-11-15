//
//  StudentListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 25/08/21.
//

import Foundation
import UIKit

struct StudentsListModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var section_id : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [StudentsListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedStudentsListData
           {
            var admisn_no : String?
            var enroll_id : String?
            var admisn_year : String?
            var class_id : String?
            var sex : String?
            var name : String?
            
            }
              var displayedStudentsListData: [DisplayedStudentsListData]

        }
    }
}

