//
//  TeacherSubstitutionModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import Foundation

class TeacherSubstutionListModels : NSObject {
    
    var class_sec_name : String?
    var class_sec_id : String?
    var sub_date : String?
    var period : String?
       
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
        {
        if let data = dict["class_sec_name"] as? String {
          self.class_sec_name = data
        }
        if let data = dict["class_sec_id"] as? String {
          self.class_sec_id = data
        }
        if let data = dict["sub_date"] as? String {
          self.sub_date = data
        }
        if let data = dict["period"] as? String {
          self.period = data
        }
   }
    
    class func build(_ dict: [String: AnyObject]) -> TeacherSubstutionListModels{
        
           let model = TeacherSubstutionListModels()
           model.loadFromDictionary(dict)
           return model
       }
}
   
