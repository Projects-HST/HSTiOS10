//
//  StudentsTimeTableModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/10/21.
//

import Foundation

class DayListModels : NSObject {
    
    var day_name : String?
    var day_id : String?
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
         if let data = dict["day_name"] as? String {
             self.day_name = data
         }
         if let data = dict["day_id"] as? String {
            self.day_id = data
         }
     }
    
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> DayListModels {
         let model = DayListModels()
         model.loadFromDictionary(dict)
         return model
     }
}


class TimeTableListModels : NSObject {
    
    var to_time : String?
    var day_id : String?
    var teacher_id : String?
    var class_name : String?
//    var name : String?
    var break_name : String?
    var from_time : String?
//    var subject_name : String?
    var subject_id : String?
    var is_break : String?
    var table_id : String?
    var period : String?
    var class_id : String?
    var sec_name : String?
    
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
         if let data = dict["to_time"] as? String {
             self.to_time = data
         }
         if let data = dict["day_id"] as? String {
            self.day_id = data
         }
         if let data = dict["teacher_id"] as? String {
             self.teacher_id = data
         }
         if let data = dict["class_name"] as? String {
            self.class_name = data
         }
//         if let data = dict["name"] as? String {
//             self.name = data
//         }
         if let data = dict["break_name"] as? String {
            self.break_name = data
         }
         if let data = dict["from_time"] as? String {
            self.from_time = data
         }
//         if let data = dict["subject_name"] as? String {
//             self.subject_name = data
//         }
         if let data = dict["subject_id"] as? String {
            self.subject_id = data
         }
         if let data = dict["is_break"] as? String {
             self.is_break = data
         }
         if let data = dict["table_id"] as? String {
            self.table_id = data
         }
         if let data = dict["period"] as? String {
             self.period = data
         }
         if let data = dict["class_id"] as? String {
            self.class_id = data
         }
         if let data = dict["sec_name"] as? String {
            self.sec_name = data
         }
     }
    
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> TimeTableListModels {
         let model = TimeTableListModels()
         model.loadFromDictionary(dict)
         return model
     }
}
    
