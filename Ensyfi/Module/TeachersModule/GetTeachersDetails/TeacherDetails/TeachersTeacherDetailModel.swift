//
//  TeachersTeacherDetailModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/09/21.
//

import Foundation
import UIKit

struct GetTeacherDetailsModel{
    struct Fetch {
        
        struct Request
        {
            var institue_code : String?
            var userName : String?
            var password : String?
            
        }
        
        struct Response
        {
            var testObj: [GetTeacherDetailsModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedGetTeacherDetailsData
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
              var displayedGetTeacherDetailsData: [DisplayedGetTeacherDetailsData]

        }
    }
}
