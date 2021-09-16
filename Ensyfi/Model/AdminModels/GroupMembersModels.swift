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

