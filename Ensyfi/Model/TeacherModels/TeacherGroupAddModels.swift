//
//  TeacherGroupAddModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 30/10/21.
//

import Foundation


class TeacherGroupListModels : NSObject {
    
       var group_title_id : String?
       var id : String?
       var notes : String?
       var created_at : String?
       var group_title : String?
       
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
        {
        if let data = dict["group_title_id"] as? String {
          self.group_title_id = data
        }
        if let data = dict["id"] as? String {
          self.id = data
        }
        if let data = dict["notes"] as? String {
          self.notes = data
        }
        if let data = dict["created_at"] as? String {
          self.created_at = data
        }
        if let data = dict["group_title"] as? String {
          self.group_title = data
        }
   }
    
      // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> TeacherGroupListModels{
    
       let model = TeacherGroupListModels()
       model.loadFromDictionary(dict)
       return model
   }
}

class TeacherGroupTypleListModels : NSObject {
    
       var id : String?
       var group_title : String?
      
       
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
        {
        if let data = dict["id"] as? String {
          self.id = data
        }
        if let data = dict["group_title"] as? String {
          self.group_title = data
        }
        
   }
    
      // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> TeacherGroupTypleListModels{
    
       let model = TeacherGroupTypleListModels()
       model.loadFromDictionary(dict)
       return model
   }
}

class SendTecherGroupModels {

    var status : String?
    var msg: String?
    var last_group_history_id: String?

// MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
     {
       if let data = dict["status"] as? String {
       self.status = data
     }
       if let data = dict["msg"] as? String {
       self.msg = data
     }
       if let data = dict["last_group_history_id"] as? String {
       self.last_group_history_id = data
       }
   }
}
