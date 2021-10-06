//
//  TeachersDataModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/09/21.
//

import Foundation
import UIKit
import SwiftyJSON

class TeachersDataList: Codable {
    
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

    
    init(json:JSON) {
        
        self.teacher_id = json["teacher_id"].stringValue
        self.name = json["name"].stringValue
        self.sex = json["sex"].stringValue
        self.age = json["age"].stringValue
        self.nationality = json["nationality"].stringValue
        self.religion = json["religion"].stringValue
        self.community_class = json["community_class"].stringValue
        self.community = json["community"].stringValue
        self.address = json["address"].stringValue
        self.email = json["email"].stringValue
        self.phone = json["phone"].stringValue
        self.sec_phone = json["sec_phone"].stringValue
        self.sec_email = json["sec_email"].stringValue
        self.profile_pic = json["profile_pic"].stringValue
        self.update_at = json["update_at"].stringValue
        self.subject = json["subject"].stringValue
        self.class_taken = json["class_taken"].stringValue
        self.class_teacher = json["class_teacher"].stringValue

    }
}

class ClassSubjectData: Codable {
    
    var class_master_id : String?
    var teacher_id : String?
    var class_name : String?
    var sec_name : String?
    var subject_name : String?
    var subject_id : String?
  
    
    init(json:JSON) {
        
        self.class_master_id = json["class_master_id"].stringValue
        self.teacher_id = json["teacher_id"].stringValue
        self.class_name = json["class_name"].stringValue
        self.sec_name = json["sec_name"].stringValue
        self.subject_name = json["subject_name"].stringValue
        self.subject_id = json["subject_id"].stringValue
    }
}

class StudentDetailsData: Codable {
    
    var enroll_id : String?
    var status : String?
    var admission_id : String?
    var class_id : String?
    var name : String?
    var sex : String?
    var pref_language : String?
    var class_section : String?
  
    
    init(json:JSON) {
        
        self.enroll_id = json["enroll_id"].stringValue
        self.status = json["status"].stringValue
        self.admission_id = json["admission_id"].stringValue
        self.class_id = json["class_id"].stringValue
        self.name = json["name"].stringValue
        self.sex = json["sex"].stringValue
        self.pref_language = json["pref_language"].stringValue
        self.class_section = json["class_section"].stringValue
    }
}

class ExamData: Codable {
    
    var exam_id : String?
    var exam_name : String?
    var is_internal_external : String?
    var classmaster_id : String?
    var sec_name : String?
    var class_name : String?
    var Fromdate : String?
    var Todate : String?
    var MarkStatus : String?
    
    init(json:JSON) {
        
        self.exam_id = json["exam_id"].stringValue
        self.exam_name = json["exam_name"].stringValue
        self.is_internal_external = json["is_internal_external"].stringValue
        self.classmaster_id = json["classmaster_id"].stringValue
        self.sec_name = json["sec_name"].stringValue
        self.class_name = json["class_name"].stringValue
        self.Fromdate = json["Fromdate"].stringValue
        self.Todate = json["Todate"].stringValue
        self.MarkStatus = json["MarkStatus"].stringValue
    }
}

class ExamDetailsData: Codable {
    
    var exam_id : String?
    var exam_name : String?
    var subject_name : String?
    var subject_id : String?
    var exam_date : String?
    var times : String?
    var is_internal_external : String?
    var subject_total : String?
    var internal_mark : String?
    var external_mark : String?
    var classmaster_id : String?
    var class_name : String?
    var sec_name : String?
    
    init(json:JSON) {
        
        self.exam_id = json["exam_id"].stringValue
        self.exam_name = json["exam_name"].stringValue
        self.subject_name = json["subject_name"].stringValue
        self.subject_id = json["subject_id"].stringValue
        self.exam_date = json["exam_date"].stringValue
        self.times = json["times"].stringValue
        self.is_internal_external = json["is_internal_external"].stringValue
        self.subject_total = json["subject_total"].stringValue
        self.internal_mark = json["internal_mark"].stringValue
        self.external_mark = json["external_mark"].stringValue
        self.classmaster_id = json["classmaster_id"].stringValue
        self.class_name = json["class_name"].stringValue
        self.sec_name = json["sec_name"].stringValue
       
    }
}


class HomeWorksData: Codable {
    
    var hw_id : String?
    var hw_type : String?
    var title : String?
    var test_date : String?
    var due_date : String?
    var times : String?
    var class_id : String?
    var hw_details : String?
    var mark_status : String?
    var subject_id : String?
    var subject_name : String?
    var class_name : String?
    var sec_name : String?
    
    init(json:JSON) {
        
        self.hw_id = json["hw_id"].stringValue
        self.hw_type = json["hw_type"].stringValue
        self.title = json["title"].stringValue
        self.test_date = json["test_date"].stringValue
        self.due_date = json["due_date"].stringValue
        self.times = json["times"].stringValue
        self.class_id = json["class_id"].stringValue
        self.hw_details = json["hw_details"].stringValue
        self.mark_status = json["mark_status"].stringValue
        self.subject_id = json["subject_id"].stringValue
        self.subject_name = json["subject_name"].stringValue
        self.class_name = json["class_name"].stringValue
        self.sec_name = json["sec_name"].stringValue
       
    }
}


class RemindersData: Codable {
    
    var id : String?
    var user_id : String?
    var to_do_date : String?
    var to_do_title : String?
    var to_do_description : String?
    var status : String?
    var created_by : String?
    var created_at : String?
    var updated_by : String?
    var updated_at : String?
   
    
    init(json:JSON) {
        
        self.id = json["id"].stringValue
        self.user_id = json["user_id"].stringValue
        self.to_do_date = json["to_do_date"].stringValue
        self.to_do_title = json["to_do_title"].stringValue
        self.to_do_description = json["to_do_description"].stringValue
        self.status = json["status"].stringValue
        self.created_by = json["created_by"].stringValue
        self.created_at = json["created_at"].stringValue
        self.updated_by = json["updated_by"].stringValue
        self.updated_at = json["updated_at"].stringValue
       
    }
}

class AdcademicMonthData: Codable {
    
    var academic_month : String?
  
    
    init(json:JSON) {
        
        self.academic_month = json["academic_month"].stringValue
   
    }
}
