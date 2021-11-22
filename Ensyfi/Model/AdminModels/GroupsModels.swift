//
//  GroupsModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 14/09/21.
//

import Foundation

class GroupListModels : NSObject {
    
    var id : String?
    var group_title : String?
    var group_lead_id : String?
    var year_id : String?
    var status : String?
    var created_by : String?
    var updated_by : String?
    var updated_at : String?
    var lead_name : String?
   
  
     // MARK: Instance Method
func loadFromDictionary(_ dict: [String: AnyObject])
    {
    if let data = dict["id"] as? String {
        self.id = data
    }
    if let data = dict["group_title"] as? String {
        self.group_title = data
    }
    if let data = dict["group_lead_id"] as? String {
        self.group_lead_id = data
    }
    if let data = dict["year_id"] as? String {
        self.year_id = data
    }
    if let data = dict["status"] as? String {
        self.status = data
    }
    if let data = dict["created_by"] as? String {
        self.created_by = data
    }
    if let data = dict["updated_by"] as? String {
        self.updated_by = data
    }
    if let data = dict["updated_at"] as? String {
        self.updated_at = data
    }
    if let data = dict["lead_name"] as? String {
        self.lead_name = data
    }
}
    
     // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> GroupListModels{
      let model = GroupListModels()
      model.loadFromDictionary(dict)
      return model
   }
}

class CreateGroupModels {

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


class GroupMembersListModels : NSObject {
    
    var name : String?
    var id : String?
    var user_type_name : String?
   
  
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
      {
       if let data = dict["name"] as? String {
          self.name = data
      }
       if let data = dict["id"] as? String {
          self.id = data
      }
       if let data = dict["user_type_name"] as? String {
         self.user_type_name = data
      }
}
    
    // MARK: Class Method
   class func build(_ dict: [String: AnyObject]) -> GroupMembersListModels{
       let model = GroupMembersListModels()
       model.loadFromDictionary(dict)
       return model
    }
}

class UpdateGroupModels {

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


class RoleListModels : NSObject {
    
    var role_id : String?
    var staff_status : String?
    var user_type_name : String?
    var status : String?
   
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
      {
       if let data = dict["status"] as? String {
          self.status = data
      }
       if let data = dict["staff_status"] as? String {
          self.staff_status = data
      }
       if let data = dict["user_type_name"] as? String {
         self.user_type_name = data
      }
       if let data = dict["role_id"] as? String {
         self.role_id = data
   }
}
    
    // MARK: Class Method
   class func build(_ dict: [String: AnyObject]) -> RoleListModels{
       let model = RoleListModels()
       model.loadFromDictionary(dict)
       return model
    }
}


class GroupSectionListModels : NSObject {
    
    var class_sec_id : String?
    var class_section : String?
   
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
      {
       if let data = dict["class_sec_id"] as? String {
          self.class_sec_id = data
      }
       if let data = dict["class_section"] as? String {
          self.class_section = data
      }
}
   
    // MARK: Class Method
   class func build(_ dict: [String: AnyObject]) -> GroupSectionListModels{
       let model = GroupSectionListModels()
       model.loadFromDictionary(dict)
       return model
    }
}


class GroupNotificationListModels : NSObject {
    
    var notes : String?
    var name : String?
    var group_title : String?
    var group_title_id : String?
    var created_by : String?
    var created_at : String?
    var notification_type : String?
  
     // MARK: Instance Method
func loadFromDictionary(_ dict: [String: AnyObject])
    {
    if let data = dict["notes"] as? String {
        self.notes = data
    }
    if let data = dict["name"] as? String {
        self.name = data
    }
    if let data = dict["group_title"] as? String {
        self.group_title = data
    }
    if let data = dict["group_title_id"] as? String {
        self.group_title_id = data
    }
    if let data = dict["created_by"] as? String {
        self.created_by = data
    }
    if let data = dict["created_at"] as? String {
        self.created_at = data
    }
    if let data = dict["notification_type"] as? String {
        self.notification_type = data
    }
}
    
     // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> GroupNotificationListModels{
      let model = GroupNotificationListModels()
      model.loadFromDictionary(dict)
      return model
   }
}
