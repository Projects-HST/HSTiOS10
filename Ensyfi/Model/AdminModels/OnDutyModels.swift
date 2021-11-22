//
//  OnDutyModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//

import Foundation

class ODStudentsListModels : NSObject {
    
    var class_name : String?
    var from_date : String?
    var id : String?
    var name : String?
    var notes : String?
    var od_for : String?
    var sec_name : String?
    var status : String?
    var to_date : String?
    var user_id : String?
    var user_master_id : String?
    
     // MARK: Instance Method
func loadFromDictionary(_ dict: [String: AnyObject])
    {
    if let data = dict["class_name"] as? String {
        self.class_name = data
    }
    if let data = dict["from_date"] as? String {
        self.from_date = data
    }
    if let data = dict["id"] as? String {
        self.id = data
    }
    if let data = dict["name"] as? String {
        self.name = data
    }
    if let data = dict["notes"] as? String {
        self.notes = data
    }
    if let data = dict["od_for"] as? String {
        self.od_for = data
    }
    if let data = dict["sec_name"] as? String {
        self.sec_name = data
    }
    if let data = dict["status"] as? String {
        self.status = data
    }
    if let data = dict["to_date"] as? String {
        self.to_date = data
    }
    if let data = dict["user_id"] as? String {
        self.user_id = data
    }
    if let data = dict["user_master_id"] as? String {
        self.user_master_id = data
    }
}
    
     // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> ODStudentsListModels{
      let model = ODStudentsListModels()
      model.loadFromDictionary(dict)
      return model
    }
}


class ODTeachersListModels : NSObject {
    
    var from_date : String?
    var id : String?
    var name : String?
    var notes : String?
    var od_for : String?
    var status : String?
    var to_date : String?
    var user_master_id : String?
    
     // MARK: Instance Method
func loadFromDictionary(_ dict: [String: AnyObject])
    {
    
    if let data = dict["from_date"] as? String {
        self.from_date = data
    }
    if let data = dict["id"] as? String {
        self.id = data
    }
    if let data = dict["name"] as? String {
        self.name = data
    }
    if let data = dict["notes"] as? String {
        self.notes = data
    }
    if let data = dict["od_for"] as? String {
        self.od_for = data
    }
    if let data = dict["status"] as? String {
        self.status = data
    }
    if let data = dict["to_date"] as? String {
        self.to_date = data
    }
    if let data = dict["user_master_id"] as? String {
        self.user_master_id = data
    }
}
    
     // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> ODTeachersListModels{
       let model = ODTeachersListModels()
       model.loadFromDictionary(dict)
       return model
   }
}
        
class ODApprovalModels {
        
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


class AddONDutyModels {

    var status : String?
    var msg: String?
    var attendance_id: String?

// MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
     {
       if let data = dict["status"] as? String {
       self.status = data
     }
       if let data = dict["msg"] as? String {
       self.msg = data
     }
       if let data = dict["attendance_id"] as? String {
        self.attendance_id = data
      }
   }
}

