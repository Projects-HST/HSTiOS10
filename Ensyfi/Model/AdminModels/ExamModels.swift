//
//  ExamModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//

import Foundation

class ExamResultsModels : NSObject {
    
    var exam_id : String?
//    var classmaster_id : String?
    var exam_name : String?
    var is_internal_external : String?
    var Fromdate : String?
    var Todate : String?
    var MarkStatus : String?
   
     // MARK: Instance Method
func loadFromDictionary(_ dict: [String: AnyObject])
    {
    if let data = dict["exam_id"] as? String {
        self.exam_id = data
    }
//    if let data = dict["classmaster_id"] as? String {
//        self.classmaster_id = data
//    }
    if let data = dict["exam_name"] as? String {
        self.exam_name = data
    }
    if let data = dict["is_internal_external"] as? String {
        self.is_internal_external = data
    }
    if let data = dict["Fromdate"] as? String {
        self.Fromdate = data
    }
    if let data = dict["Todate"] as? String {
        self.Todate = data
    }
    if let data = dict["MarkStatus"] as? String {
        self.MarkStatus = data
    }
}
    
     // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> ExamResultsModels{
    let model = ExamResultsModels()
    model.loadFromDictionary(dict)
    return model
 }
}


class ExamListModels : NSObject {
    
    var exam_id : String?
//    var classmaster_id : String?
    var exam_name : String?
    var is_internal_external : String?
    var Fromdate : String?
    var Todate : String?
    var MarkStatus : String?
   
     // MARK: Instance Method
func loadFromDictionary(_ dict: [String: AnyObject])
    {
    if let data = dict["exam_id"] as? String {
        self.exam_id = data
    }
//    if let data = dict["classmaster_id"] as? String {
//        self.classmaster_id = data
//    }
    if let data = dict["exam_name"] as? String {
        self.exam_name = data
    }
    if let data = dict["is_internal_external"] as? String {
        self.is_internal_external = data
    }
    if let data = dict["Fromdate"] as? String {
        self.Fromdate = data
    }
    if let data = dict["Todate"] as? String {
        self.Todate = data
    }
    if let data = dict["MarkStatus"] as? String {
        self.MarkStatus = data
    }
}
    
     // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> ExamListModels{
    let model = ExamListModels()
    model.loadFromDictionary(dict)
    return model
 }
}
