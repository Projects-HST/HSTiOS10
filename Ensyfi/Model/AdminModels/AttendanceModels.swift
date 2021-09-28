//
//  AdminAttMode.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//

import Foundation
import UIKit

class Class_SectionModels : NSObject {
    
    var class_sec_id : String?
    var class_name : String?
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
         if let data = dict["class_sec_id"] as? String {
             self.class_sec_id = data
         }
        if let data = dict["class_name"] as? String {
            self.class_name = data
        }
     }
    
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> Class_SectionModels {
         let model = Class_SectionModels()
         model.loadFromDictionary(dict)
         return model
     }
}


class ClassAttendanceListModels : NSObject {
    
    var status : String?
    var class_total : String?
    var class_name : String?
    var no_of_present : String?
    var no_of_absent : String?
    var class_id : String?
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
        if let data = dict["status"] as? String {
             self.status = data
        }
        if let data = dict["class_total"] as? String {
            self.class_total = data
        }
        if let data = dict["class_name"] as? String {
             self.class_name = data
        }
        if let data = dict["no_of_present"] as? String {
            self.no_of_present = data
        }
        if let data = dict["no_of_absent"] as? String {
             self.no_of_absent = data
        }
        if let data = dict["class_id"] as? String {
            self.class_id = data
        }
     }
    
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> ClassAttendanceListModels {
         let model = ClassAttendanceListModels()
         model.loadFromDictionary(dict)
         return model
     }
}
