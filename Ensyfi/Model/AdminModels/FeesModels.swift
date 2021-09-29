//
//  FeesModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation


class FeesListModels : NSObject {
    
    var fees_id : String?
    var from_year : String?
    var term_name : String?
    var to_year : String?
    var due_date_to : String?
    var due_date_from : String?
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
        if let data = dict["fees_id"] as? String {
             self.fees_id = data
        }
        if let data = dict["from_year"] as? String {
            self.from_year = data
        }
        if let data = dict["term_name"] as? String {
             self.term_name = data
        }
        if let data = dict["to_year"] as? String {
            self.to_year = data
        }
        if let data = dict["due_date_to"] as? String {
             self.due_date_to = data
        }
        if let data = dict["due_date_from"] as? String {
            self.due_date_from = data
        }
     }
    
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> FeesListModels {
         let model = FeesListModels()
         model.loadFromDictionary(dict)
         return model
     }
}


class FeesStatusListModels : NSObject {
    
    var student_id : String?
    var name : String?
    var id : String?
    var quota_name : String?
    var status : String?
    var quota_id : String?
    var updated_at : String?
    var paid_by : String?
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
        if let data = dict["student_id"] as? String {
             self.student_id = data
        }
        if let data = dict["name"] as? String {
            self.name = data
        }
        if let data = dict["id"] as? String {
             self.id = data
        }
        if let data = dict["quota_name"] as? String {
            self.quota_name = data
        }
        if let data = dict["status"] as? String {
             self.status = data
        }
        if let data = dict["quota_id"] as? String {
            self.quota_id = data
        }
        if let data = dict["updated_at"] as? String {
             self.updated_at = data
        }
        if let data = dict["paid_by"] as? String {
            self.paid_by = data
        }
     }
    
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> FeesStatusListModels {
         let model = FeesStatusListModels()
         model.loadFromDictionary(dict)
         return model
     }
}


class FeesSectionListModels : NSObject {
    
    var sec_id : String?
    var sec_name : String?
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
         if let data = dict["sec_name"] as? String {
             self.sec_name = data
         }
        if let data = dict["sec_id"] as? String {
            self.sec_id = data
        }
     }
    
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> FeesSectionListModels {
         let model = FeesSectionListModels()
         model.loadFromDictionary(dict)
         return model
     }
}
    
