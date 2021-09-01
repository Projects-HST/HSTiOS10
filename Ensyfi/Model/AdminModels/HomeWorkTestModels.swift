//
//  HomeWorkTestModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 01/09/21.
//

import Foundation

class HomeWorkTestListModels : NSObject {
    
    var due_date : String?
    var hw_details : String?
    var hw_id : String?
    var hw_type : String?
    var mark_status : String?
    var subject_name : String?
    var test_date : String?
    var title : String?
    
     // MARK: Instance Method
func loadFromDictionary(_ dict: [String: AnyObject])
    {
    if let data = dict["due_date"] as? String {
        self.due_date = data
    }
    if let data = dict["hw_details"] as? String {
        self.hw_details = data
    }
    if let data = dict["hw_id"] as? String {
        self.hw_id = data
    }
    if let data = dict["hw_type"] as? String {
        self.hw_type = data
    }
    if let data = dict["mark_status"] as? String {
        self.mark_status = data
    }
    if let data = dict["subject_name"] as? String {
        self.subject_name = data
    }
    if let data = dict["test_date"] as? String {
        self.test_date = data
    }
    if let data = dict["title"] as? String {
        self.title = data
    }
}
    
     // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> HomeWorkTestListModels{
    let model = HomeWorkTestListModels()
    model.loadFromDictionary(dict)
    return model
 }
}
