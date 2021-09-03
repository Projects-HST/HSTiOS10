//
//  ClassForTeacherListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation
import UIKit

struct ClassForTeacherListModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var section_id : String?
        }
        
        struct Response
        {
            var testObj: [ClassForTeacherListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedClassForTeacherListData
           {
            var teacher_id : String?
            var subject_name : String?
            var subject_id : String?
            var name : String?
            
            }
              var displayedClassForTeacherListData: [DisplayedClassForTeacherListData]

        }
    }
}
