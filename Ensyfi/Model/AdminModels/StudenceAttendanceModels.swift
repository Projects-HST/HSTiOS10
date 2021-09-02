//
//  StudenceAttendanceModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//

import Foundation

class StudentAttendanceModels : NSObject {
    
    var abs_count : String?
    var at_id : String?
    var student_id : String?
    var abs_date : String?
    var a_status : String?
   
    
     // MARK: Instance Method
func loadFromDictionary(_ dict: [String: AnyObject])
    {
    if let data = dict["abs_count"] as? String {
        self.abs_count = data
    }
    if let data = dict["at_id"] as? String {
        self.at_id = data
    }
    if let data = dict["student_id"] as? String {
        self.student_id = data
    }
    if let data = dict["abs_date"] as? String {
        self.abs_date = data
    }
    if let data = dict["a_status"] as? String {
        self.a_status = data
    }
}
    
     // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> StudentAttendanceModels{
    let model = StudentAttendanceModels()
    model.loadFromDictionary(dict)
    return model
 }
}
