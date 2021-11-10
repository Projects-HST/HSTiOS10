//
//  TeacherC_TestMarksModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 09/11/21.
//

import Foundation

class ClassTestMarkListModels : NSObject {
    
    var enroll_id : String?
    var name : String?
    var marks : String?
    
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
        {
        if let data = dict["enroll_id"] as? String {
          self.enroll_id = data
        }
        if let data = dict["name"] as? String {
          self.name = data
        }
        if let data = dict["marks"] as? String {
          self.marks = data
        }
   }
    
    class func build(_ dict: [String: AnyObject]) -> ClassTestMarkListModels{
        
           let model = ClassTestMarkListModels()
           model.loadFromDictionary(dict)
           return model
       }
}
   
