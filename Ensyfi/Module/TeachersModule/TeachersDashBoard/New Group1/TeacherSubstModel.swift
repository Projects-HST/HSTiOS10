//
//  TeacherSubstModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import Foundation
import UIKit

struct TeacherSubstutionListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [TeacherSubstutionListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedTeacherSubstutionListData
           {
               var class_sec_name : String?
               var class_sec_id : String?
               var sub_date : String?
               var period : String?
            }
              var displayedTeacherSubstutionListData: [DisplayedTeacherSubstutionListData]

        }
    }
}
