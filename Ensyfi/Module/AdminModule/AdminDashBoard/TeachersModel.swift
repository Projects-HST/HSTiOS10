//
//  TeachersModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/08/21.
//

import Foundation
import UIKit

struct TeachersListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
        }
        
        struct Response
        {
            var testObj: [TeachersListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedTeachersListData
           {
            var subject : String?
            var class_name : String?
            var name : String?
            var sec_name : String?
            var teacher_id : String?
            var sex : String?
//            var subject_name : String?
            var age : String?
            var class_teacher : String?
            
            }
              var displayedTeachersListData: [DisplayedTeachersListData]

        }
    }
}
