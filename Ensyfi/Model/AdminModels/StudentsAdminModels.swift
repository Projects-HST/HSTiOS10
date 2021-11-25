//
//  StudentsAdminModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 24/08/21.
//

import Foundation
import UIKit

class ClassViewModels : NSObject {
    
    var class_id : String?
    var class_name : String?
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
         if let data = dict["class_id"] as? String {
             self.class_id = data
         }
        if let data = dict["class_name"] as? String {
            self.class_name = data
        }
     }
    
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> ClassViewModels {
         let model = ClassViewModels()
         model.loadFromDictionary(dict)
         return model
     }
}

class SectionListModels : NSObject {
    
    var sec_id : String?
    var sec_name : String?
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
         if let data = dict["sec_name"] as? String {
             self.sec_name = data
         }
        if let data = dict["sec_id"] as? String {
            self.sec_id = data
        }
     }
    
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> SectionListModels {
         let model = SectionListModels()
         model.loadFromDictionary(dict)
         return model
     }
}
    
class StudentsListModels : NSObject {
        
    var admisn_no : String?
    var enroll_id : String?
    var admisn_year : String?
    var class_id : String?
    var sex : String?
    var name : String?
        
         // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
        {
        if let data = dict["admisn_no"] as? String {
            self.admisn_no = data
        }
        if let data = dict["enroll_id"] as? String {
            self.enroll_id = data
        }
        if let data = dict["admisn_year"] as? String {
            self.admisn_year = data
        }
        if let data = dict["class_id"] as? String {
            self.class_id = data
        }
        if let data = dict["sex"] as? String {
            self.sex = data
        }
        if let data = dict["name"] as? String {
            self.name = data
        }
    }
    
        // MARK: Class Method
    class func build(_ dict: [String: AnyObject]) -> StudentsListModels{
        let model = StudentsListModels()
        model.loadFromDictionary(dict)
        return model
     }
}

class StudentDetailsModels : NSObject {
        
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
        
         // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        
        if let data = dict["admisn_no"] as? String {
            self.admisn_no = data
        }
        if let data = dict["parnt_guardn_id"] as? String {
            self.parnt_guardn_id = data
        }
        if let data = dict["emsi_num"] as? String {
            self.emsi_num = data
        }
        if let data = dict["parnt_guardn"] as? String {
            self.parnt_guardn = data
        }
        if let data = dict["community"] as? String {
            self.community = data
        }
        if let data = dict["community_class"] as? String {
            self.community_class = data
        }
        if let data = dict["parents_status"] as? String {
            self.parents_status = data
        }
        if let data = dict["last_studied"] as? String {
            self.last_studied = data
        }
        if let data = dict["sec_mobile"] as? String {
            self.sec_mobile = data
        }
        if let data = dict["transfer_certificate"] as? String {
            self.transfer_certificate = data
        }
        if let data = dict["admisn_date"] as? String {
            self.admisn_date = data
        }
        if let data = dict["name"] as? String {
            self.name = data
        }
        if let data = dict["nationality"] as? String {
            self.nationality = data
        }
        if let data = dict["sex"] as? String {
            self.sex = data
        }
        if let data = dict["admisn_year"] as? String {
            self.admisn_year = data
        }
        if let data = dict["updated_at"] as? String {
            self.updated_at = data
        }
        if let data = dict["updated_by"] as? String {
            self.updated_by = data
        }
        if let data = dict["last_sch_name"] as? String {
            self.last_sch_name = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["enrollment"] as? String {
            self.enrollment = data
        }
        if let data = dict["admission_id"] as? String {
            self.admission_id = data
        }
        if let data = dict["dob"] as? String {
            self.dob = data
        }
        if let data = dict["email"] as? String {
            self.email = data
        }
        if let data = dict["mother_tongue"] as? String {
            self.mother_tongue = data
        }
        if let data = dict["tccopy"] as? String {
            self.tccopy = data
        }
        if let data = dict["blood_group"] as? String {
            self.blood_group = data
        }
        if let data = dict["sec_email"] as? String {
            self.sec_email = data
        }
        if let data = dict["student_pic"] as? String {
            self.student_pic = data
        }
        if let data = dict["religion"] as? String {
            self.religion = data
        }
        if let data = dict["language"] as? String {
            self.language = data
        }
        if let data = dict["age"] as? String {
            self.age = data
        }
        if let data = dict["record_sheet"] as? String {
            self.record_sheet = data
        }
        if let data = dict["qualified_promotion"] as? String {
            self.qualified_promotion = data
        }
        if let data = dict["admisn_year"] as? String {
            self.admisn_year = data
        }
        if let data = dict["mobile"] as? String {
            self.mobile = data
        }
    }
        
         // MARK: Class Method
    class func build(_ dict: [String: AnyObject]) -> StudentDetailsModels{
        let model = StudentDetailsModels()
        model.loadFromDictionary(dict)
        return model
     }
}
