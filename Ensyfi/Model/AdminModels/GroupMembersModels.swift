//
//  GroupMembersModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 16/09/21.
//

import Foundation

class StudentGroupAddListModels : NSObject {
    
    var Status : String?
    var user_id : String?
    var name : String?
   
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
      {
       if let data = dict["Status"] as? String {
          self.Status = data
      }
       if let data = dict["user_id"] as? String {
          self.user_id = data
      }
       if let data = dict["name"] as? String {
         self.name = data
      }
}
    
    // MARK: Class Method
   class func build(_ dict: [String: AnyObject]) -> StudentGroupAddListModels{
       let model = StudentGroupAddListModels()
       model.loadFromDictionary(dict)
       return model
    }
}


class StaffGroupAddListModels : NSObject {
    
    var Status : String?
    var user_id : String?
    var name : String?
   
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
      {
       if let data = dict["Status"] as? String {
          self.Status = data
      }
       if let data = dict["user_id"] as? String {
          self.user_id = data
      }
       if let data = dict["name"] as? String {
         self.name = data
      }
}
    
    // MARK: Class Method
   class func build(_ dict: [String: AnyObject]) -> StaffGroupAddListModels{
       let model = StaffGroupAddListModels()
       model.loadFromDictionary(dict)
       return model
    }
}


class AddGroupMemberModels {

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
