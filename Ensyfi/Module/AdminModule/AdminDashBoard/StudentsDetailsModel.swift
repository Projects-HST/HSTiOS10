//
//  StudentsDetailsModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/08/21.
//

import Foundation
import UIKit

struct StudentDetailsModel{
    struct Fetch {
        
        struct Request
        {
            var student_id : String?
            
        }
        
        struct Response
        {
            var testObj: [StudentDetailsModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedStudentDetailsData
           {
            var admisn_no : String?
            var parnt_guardn_id : String?
            var emsi_num : String?
            var created_at : String?
            var parnt_guardn : String?
            var community : String?
            var created_by : String?
            var community_class : String?
            var parents_status : String?
            var last_studied : String?
            var sec_mobile : String?
            var transfer_certificate : String?
            var admisn_date : String?
            var nationality : String?
            var sex : String?
            var updated_by : String?
            var updated_at : String?
            var last_sch_name : String?
            var status : String?
            var enrollment : String?
            var admission_id : String?
            var dob : String?
            var email : String?
            var mother_tongue : String?
            var tccopy : String?
            var blood_group : String?
            var sec_email : String?
            var student_pic : String?
            var religion : String?
            var language : String?
            var name : String?
            var age : String?
            var record_sheet : String?
            var qualified_promotion : String?
            var admisn_year : String?
            var mobile : String?
            
            }
              var displayedStudentDetailsData: [DisplayedStudentDetailsData]

        }
    }
}
