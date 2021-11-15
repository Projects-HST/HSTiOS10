//
//  TeacherGroupListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import Foundation
import UIKit

struct TeacherGroupListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var user_type : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [TeacherGroupListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedTeacherGroupListData
           {
               var group_title_id : String?
               var id : String?
               var notes : String?
               var created_at : String?
               var group_title : String?
            
            }
              var displayedTeacherGroupListData: [DisplayedTeacherGroupListData]

        }
    }
}
