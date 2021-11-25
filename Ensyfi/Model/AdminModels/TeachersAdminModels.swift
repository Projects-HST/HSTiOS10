//
//  TeachersAdminModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/08/21.
//

import Foundation

class TeachersListModels : NSObject {
    
    var subject : String?
//    var class_name : String?
    var name : String?
//    var sec_name : String?
    var teacher_id : String?
    var sex : String?
//    var subject_name : String?
    var age : String?
    var class_teacher : String?
    
     // MARK: Instance Method
func loadFromDictionary(_ dict: [String: AnyObject])
    {
    if let data = dict["subject"] as? String {
        self.subject = data
    }
//    if let data = dict["class_name"] as? String {
//        self.class_name = data
//    }
    if let data = dict["name"] as? String {
        self.name = data
    }
//    if let data = dict["sec_name"] as? String {
//        self.sec_name = data
//    }
    if let data = dict["teacher_id"] as? String {
        self.teacher_id = data
    }
    if let data = dict["class_teacher"] as? String {
        self.class_teacher = data
    }
    if let data = dict["sex"] as? String {
        self.sex = data
    }
    if let data = dict["age"] as? String {
        self.age = data
    }
//    if let data = dict["subject_name"] as? String {
//        self.subject_name = data
//    }
}
   
     // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> TeachersListModels{
     let model = TeachersListModels()
        model.loadFromDictionary(dict)
        return model
    }
}

class TeacherDetailsModels : NSObject {
        
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
    var user_id : String?

         // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        
        if let data = dict["teacher_id"] as? String {
            self.teacher_id = data
        }
        if let data = dict["name"] as? String {
            self.name = data
        }
        if let data = dict["sex"] as? String {
            self.sex = data
        }
        if let data = dict["age"] as? String {
            self.age = data
        }
        if let data = dict["nationality"] as? String {
            self.nationality = data
        }
        if let data = dict["religion"] as? String {
            self.religion = data
        }
        if let data = dict["community_class"] as? String {
            self.community_class = data
        }
        if let data = dict["community"] as? String {
            self.community = data
        }
        if let data = dict["address"] as? String {
            self.address = data
        }
        if let data = dict["email"] as? String {
            self.email = data
        }
        if let data = dict["phone"] as? String {
            self.phone = data
        }
        if let data = dict["sec_email"] as? String {
            self.sec_email = data
        }
        if let data = dict["sec_phone"] as? String {
            self.sec_phone = data
        }
        if let data = dict["profile_pic"] as? String {
            self.profile_pic = data
        }
        if let data = dict["update_at"] as? String {
            self.update_at = data
        }
        if let data = dict["subject"] as? String {
            self.subject = data
        }
        if let data = dict["class_taken"] as? String {
            self.class_taken = data
        }
        if let data = dict["class_teacher"] as? String {
            self.class_teacher = data
        }
        if let data = dict["user_id"] as? String {
            self.user_id = data
        }
    }
        
         // MARK: Class Method
    class func build(_ dict: [String: AnyObject]) -> TeacherDetailsModels{
        let model = TeacherDetailsModels()
        model.loadFromDictionary(dict)
        return model
     }
}

class TeacherListIDModels : NSObject {
    
    var name : String?
    var user_id : String?
   
  
     // MARK: Instance Method
func loadFromDictionary(_ dict: [String: AnyObject])
    {
    if let data = dict["name"] as? String {
        self.name = data
    }
    if let data = dict["user_id"] as? String {
        self.user_id = data
    }
}
    
     // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> TeacherListIDModels{
    let model = TeacherListIDModels()
    model.loadFromDictionary(dict)
    return model
 }
}
