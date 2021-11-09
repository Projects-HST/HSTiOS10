//
//  LeaveModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/09/21.
//

import Foundation

class LeavesListModels : NSObject {
    
       var leave_id : String?
       var user_id : String?
       var name : String?
       var leave_title : String?
       var leave_type : String?
       var status : String?
       var from_leave_date : String?
//       var to_leave_date : String?
       var leave_description : String?
       var frm_time : String?
       var to_time : String?
    
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
       {
        if let data = dict["leave_id"] as? String {
          self.leave_id = data
        }
        if let data = dict["user_id"] as? String {
          self.user_id = data
        }
        if let data = dict["name"] as? String {
          self.name = data
        }
        if let data = dict["leave_title"] as? String {
          self.leave_title = data
        }
        if let data = dict["leave_type"] as? String {
          self.leave_type = data
        }
        if let data = dict["status"] as? String {
          self.status = data
        }
        if let data = dict["from_leave_date"] as? String {
          self.from_leave_date = data
        }
//        if let data = dict["to_leave_date"] as? String {
//          self.to_leave_date = data
//        }
        if let data = dict["leave_description"] as? String {
          self.leave_description = data
        }
        if let data = dict["frm_time"] as? String {
          self.frm_time = data
        }
        if let data = dict["to_time"] as? String {
          self.to_time = data
        }
   }
    
      // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> LeavesListModels{
    
       let model = LeavesListModels()
       model.loadFromDictionary(dict)
       return model
   }
}


class LeaveApprovalModels {
        
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
