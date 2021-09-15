//
//  GetTeachersListIDModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//

import Foundation
import UIKit

struct TeacherListIDModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var user_type : String?
        }
        
        struct Response
        {
            var testObj: [TeacherListIDModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedTeacherListIDData
           {
            var user_id : String?
            var name : String?
           
            }
              var displayedTeacherListIDData: [DisplayedTeacherListIDData]

        }
    }
}
