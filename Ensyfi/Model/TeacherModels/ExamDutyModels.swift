//
//  ExamDutyModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 19/11/21.
//

import Foundation

class ExamDutyListModels : NSObject {
    
    var exam_name : String?
    var subject_name : String?
    var exam_datetime : String?
    var class_section : String?
       
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
        {
        if let data = dict["exam_name"] as? String {
          self.exam_name = data
        }
        if let data = dict["subject_name"] as? String {
          self.subject_name = data
        }
        if let data = dict["exam_datetime"] as? String {
          self.exam_datetime = data
        }
        if let data = dict["class_section"] as? String {
          self.class_section = data
        }
   }
    
      // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> ExamDutyListModels{
    
       let model = ExamDutyListModels()
       model.loadFromDictionary(dict)
       return model
   }
}
