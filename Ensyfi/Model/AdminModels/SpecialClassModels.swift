//
//  SpecialClassModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/10/21.
//

import Foundation

class SpecialClassListModels : NSObject {
    
       var special_class_date : String?
       var status : String?
       var end_time : String?
       var subject_name : String?
       var class_sec_id : String?
       var start_time : String?
       var class_sec_name : String?
       var subject_topic : String?
     
    
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
       {
        if let data = dict["special_class_date"] as? String {
          self.special_class_date = data
        }
        if let data = dict["status"] as? String {
          self.status = data
        }
        if let data = dict["end_time"] as? String {
          self.end_time = data
        }
        if let data = dict["subject_name"] as? String {
          self.subject_name = data
        }
        if let data = dict["class_sec_id"] as? String {
          self.class_sec_id = data
        }
        if let data = dict["start_time"] as? String {
          self.start_time = data
        }
        if let data = dict["class_sec_name"] as? String {
          self.class_sec_name = data
        }
        if let data = dict["subject_topic"] as? String {
          self.subject_topic = data
        }
   }
    
      // MARK: Class Method
class func build(_ dict: [String: AnyObject]) ->SpecialClassListModels{
    
       let model = SpecialClassListModels()
       model.loadFromDictionary(dict)
       return model
   }
}
