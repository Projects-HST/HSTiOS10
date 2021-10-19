//
//  TeachersAssignmentModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 12/10/21.
//

import Foundation

class AssignmentListModels : NSObject {
    
       var hw_date : String?
       var hw_count : String?
       var ht_count : String?
       
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
        {
        if let data = dict["hw_date"] as? String {
          self.hw_date = data
        }
        if let data = dict["hw_count"] as? String {
          self.hw_count = data
        }
        if let data = dict["ht_count"] as? String {
          self.ht_count = data
        }
   }
    
      // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> AssignmentListModels{
    
       let model = AssignmentListModels()
       model.loadFromDictionary(dict)
       return model
   }
}

class AssignmentOverViewModels : NSObject {
    
       var hw_id : String?
       var hw_type : String?
       var title : String?
       var created_at : String?
       var test_date : String?
       var due_date : String?
       var hw_details : String?
       var send_option_status : String?
       var subject_id : String?
       var subject_name : String?
       var name : String?
       
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
        {
        if let data = dict["hw_id"] as? String {
          self.hw_id = data
        }
        if let data = dict["hw_type"] as? String {
          self.hw_type = data
        }
        if let data = dict["title"] as? String {
          self.title = data
        }
        if let data = dict["created_at"] as? String {
          self.created_at = data
        }
        if let data = dict["test_date"] as? String {
          self.test_date = data
        }
        if let data = dict["due_date"] as? String {
          self.due_date = data
        }
        if let data = dict["hw_details"] as? String {
          self.hw_details = data
        }
        if let data = dict["send_option_status"] as? String {
          self.send_option_status = data
        }
        if let data = dict["subject_id"] as? String {
          self.subject_id = data
        }
        if let data = dict["subject_name"] as? String {
          self.subject_name = data
        }
        if let data = dict["name"] as? String {
          self.name = data
      }
   }
    
      // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> AssignmentOverViewModels{
    
       let model = AssignmentOverViewModels()
       model.loadFromDictionary(dict)
       return model
   }
}

class SendAssignmentModels {

    var status : String?
    var msg: String?

// MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
     {
       if let data = dict["status"] as? String {
       self.status = data
     }
       if let data = dict["msg"] as? String {
       self.msg = data
     }
   }
}
