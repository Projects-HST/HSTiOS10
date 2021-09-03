//
//  TeacherDetailsModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//

import Foundation
import UIKit

struct TeacherDetailsModel{
    struct Fetch {
        
        struct Request
        {
            var teacher_id : String?
            
        }
        
        struct Response
        {
            var testObj: [TeacherDetailsModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedTeacherDetailsData
           {
            var teacher_id : String?
            var name : String?
            var sex : String?
            var age : String?
            var nationality : String?
            var religion : String?
            var community_class : String?
            var community : String?
            var address : String?
            var email : String?
            var phone : String?
            var sec_email : String?
            var sec_phone : String?
            var profile_pic : String?
            var update_at : String?
            var subject : String?
            var class_taken : String?
            var class_teacher : String?
            
            }
              var displayedTeacherDetailsData: [DisplayedTeacherDetailsData]

        }
    }
}
