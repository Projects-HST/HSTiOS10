//
//  ClassViewModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation

class ClassForTeacherListModels : NSObject {
    
    var teacher_id : String?
    var subject_name : String?
    var subject_id : String?
    var name : String?
        
     // MARK: Instance Method
func loadFromDictionary(_ dict: [String: AnyObject])
 {
    if let data = dict["teacher_id"] as? String {
        self.teacher_id = data
    }
    if let data = dict["subject_name"] as? String {
        self.subject_name = data
    }
    if let data = dict["name"] as? String {
        self.name = data
    }
    if let data = dict["subject_id"] as? String {
        self.subject_id = data
    }
   
}
   
     // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> ClassForTeacherListModels{
    let model = ClassForTeacherListModels()
    model.loadFromDictionary(dict)
    return model
  }
}
