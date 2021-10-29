//
//  StudentsDatasModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 22/10/21.
//

import Foundation
import UIKit
import SwiftyJSON

class StudentsRegDetails: Codable {
    
    var registered_id : String?
    var admission_id : String?
    var admission_no : String?
    var class_id : String?
    var name : String?
    var class_name : String?
    var sec_name : String?
    
    init(json:JSON) {
        
        self.registered_id = json["registered_id"].stringValue
        self.admission_id = json["admission_id"].stringValue
        self.admission_no = json["admission_no"].stringValue
        self.class_id = json["class_id"].stringValue
        self.name = json["name"].stringValue
        self.class_name = json["class_name"].stringValue
        self.sec_name = json["sec_name"].stringValue
    }
}


class StudentsProfileDetas: Codable {
    
    var admission_id : String?
    var admisn_year : String?
    var admisn_no : String?
    var emsi_num : String?
    var admisn_date : String?
    var name : String?
    var sex : String?
    var dob : String?
    var age : String?
    var nationality : String?
    var religion : String?
    var community_class : String?
    var community : String?
    var parnt_guardn : String?
    var parnt_guardn_id : String?
    var mother_tongue : String?
    var language : String?
    var mobile : String?
    var sec_mobile : String?
    var email : String?
    var sec_email : String?
    var student_pic : String?
    var last_sch_name : String?
    var last_studied : String?
    var qualified_promotion : String?
    var transfer_certificate : String?
    var tccopy : String?
    var record_sheet : String?
    var status : String?
    var parents_status : String?
    var enrollment : String?
    var blood_group : String?
    var created_by : String?
    var created_at : String?
    var updated_by : String?
    var updated_at : String?
  
    
    init(json:JSON) {
        
        self.admission_id = json["admission_id"].stringValue
        self.admisn_year = json["admisn_year"].stringValue
        self.admisn_no = json["admisn_no"].stringValue
        self.emsi_num = json["emsi_num"].stringValue
        self.admisn_date = json["admisn_date"].stringValue
        self.name = json["name"].stringValue
        self.sex = json["sex"].stringValue
        self.dob = json["dob"].stringValue
        self.age = json["age"].stringValue
        self.nationality = json["nationality"].stringValue
        self.religion = json["religion"].stringValue
        self.community_class = json["community_class"].stringValue
        self.community = json["community"].stringValue
        self.parnt_guardn = json["parnt_guardn"].stringValue
        self.parnt_guardn_id = json["parnt_guardn_id"].stringValue
        self.mother_tongue = json["mother_tongue"].stringValue
        self.language = json["language"].stringValue
        self.mobile = json["mobile"].stringValue
        self.sec_mobile = json["sec_mobile"].stringValue
        self.email = json["email"].stringValue
        self.sec_email = json["sec_email"].stringValue
        self.student_pic = json["student_pic"].stringValue
        self.last_sch_name = json["last_sch_name"].stringValue
        self.last_studied = json["last_studied"].stringValue
        self.qualified_promotion = json["qualified_promotion"].stringValue
        self.transfer_certificate = json["transfer_certificate"].stringValue
        self.tccopy = json["tccopy"].stringValue
        self.record_sheet = json["record_sheet"].stringValue
        self.status = json["status"].stringValue
        self.parents_status = json["parents_status"].stringValue
        self.enrollment = json["enrollment"].stringValue
        self.blood_group = json["blood_group"].stringValue
        self.created_by = json["created_by"].stringValue
        self.updated_by = json["updated_by"].stringValue
        self.created_at = json["created_at"].stringValue
        self.updated_at = json["updated_at"].stringValue
  
    }
}

class StudentsMotherDetails: Codable {
    
    var id : String?
    var name : String?
    var occupation : String?
    var income : String?
    var home_address : String?
    var email : String?
    var mobile : String?
    var home_phone : String?
    var office_phone : String?
    var relationship : String?
    var user_pic : String?
  
    
    init(json:JSON) {
        
        self.id = json["id"].stringValue
        self.name = json["name"].stringValue
        self.occupation = json["occupation"].stringValue
        self.income = json["income"].stringValue
        self.home_address = json["home_address"].stringValue
        self.email = json["email"].stringValue
        self.mobile = json["mobile"].stringValue
        self.home_phone = json["home_phone"].stringValue
        self.office_phone = json["office_phone"].stringValue
        self.relationship = json["relationship"].stringValue
        self.user_pic = json["user_pic"].stringValue
    }
}

class StudentsFatherDetails: Codable {
    
    var id : String?
    var name : String?
    var occupation : String?
    var income : String?
    var home_address : String?
    var email : String?
    var mobile : String?
    var home_phone : String?
    var office_phone : String?
    var relationship : String?
    var user_pic : String?
  
    
    init(json:JSON) {
        
        self.id = json["id"].stringValue
        self.name = json["name"].stringValue
        self.occupation = json["occupation"].stringValue
        self.income = json["income"].stringValue
        self.home_address = json["home_address"].stringValue
        self.email = json["email"].stringValue
        self.mobile = json["mobile"].stringValue
        self.home_phone = json["home_phone"].stringValue
        self.office_phone = json["office_phone"].stringValue
        self.relationship = json["relationship"].stringValue
        self.user_pic = json["user_pic"].stringValue
    }
}


class StudentsGuardianDetails: Codable {
    
    var id : String?
    var name : String?
    var occupation : String?
    var income : String?
    var home_address : String?
    var email : String?
    var mobile : String?
    var home_phone : String?
    var office_phone : String?
    var relationship : String?
    var user_pic : String?
  
    
    init(json:JSON) {
        
        self.id = json["id"].stringValue
        self.name = json["name"].stringValue
        self.occupation = json["occupation"].stringValue
        self.income = json["income"].stringValue
        self.home_address = json["home_address"].stringValue
        self.email = json["email"].stringValue
        self.mobile = json["mobile"].stringValue
        self.home_phone = json["home_phone"].stringValue
        self.office_phone = json["office_phone"].stringValue
        self.relationship = json["relationship"].stringValue
        self.user_pic = json["user_pic"].stringValue
    }
}



