//
//  ParentDetailsModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation

class FatherDeatilsModels {
    
    var email : String?
    var id : String?
    var relationship: String?
    var office_phone : String?
    var mobile: String?
    var home_phone: String?
    var home_address : String?
    var name: String?
    var occupation: String?
    var income : String?
    var status: String?
    var msg: String?
    var user_pic: String?
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["email"] as? String {
            self.email = data
        }
        if let data = dict["id"] as? String {
            self.id = data
        }
        if let data = dict["relationship"] as? String {
            self.relationship = data
        }
        if let data = dict["office_phone"] as? String {
            self.office_phone = data
        }
        if let data = dict["mobile"] as? String {
            self.mobile = data
        }
        if let data = dict["home_phone"] as? String {
            self.home_phone = data
        }
        if let data = dict["home_address"] as? String {
            self.home_address = data
        }
        if let data = dict["name"] as? String {
            self.name = data
        }
        if let data = dict["income"] as? String {
            self.income = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["msg"] as? String {
            self.msg = data
        }
        if let data = dict["user_pic"] as? String {
            self.user_pic = data
        }
    }
}

class MotherDetailsModels {
    
    var email : String?
    var id : String?
    var relationship: String?
    var office_phone : String?
    var mobile: String?
    var home_phone: String?
    var home_address : String?
    var name: String?
    var occupation: String?
    var income : String?
    var status: String?
    var msg: String?
    var user_pic: String?
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["email"] as? String {
            self.email = data
        }
        if let data = dict["id"] as? String {
            self.id = data
        }
        if let data = dict["relationship"] as? String {
            self.relationship = data
        }
        if let data = dict["office_phone"] as? String {
            self.office_phone = data
        }
        if let data = dict["mobile"] as? String {
            self.mobile = data
        }
        if let data = dict["home_phone"] as? String {
            self.home_phone = data
        }
        if let data = dict["home_address"] as? String {
            self.home_address = data
        }
        if let data = dict["name"] as? String {
            self.name = data
        }
        if let data = dict["income"] as? String {
            self.income = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["msg"] as? String {
            self.msg = data
        }
        if let data = dict["user_pic"] as? String {
            self.user_pic = data
        }
    }
}

class GuardianDetailsModels {
    
    var email : String?
    var id : String?
    var relationship: String?
    var office_phone : String?
    var mobile: String?
    var home_phone: String?
    var home_address : String?
    var name: String?
    var occupation: String?
    var income : String?
    var status: String?
    var msg: String?
    var user_pic: String?
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["email"] as? String {
            self.email = data
        }
        if let data = dict["id"] as? String {
            self.id = data
        }
        if let data = dict["relationship"] as? String {
            self.relationship = data
        }
        if let data = dict["office_phone"] as? String {
            self.office_phone = data
        }
        if let data = dict["mobile"] as? String {
            self.mobile = data
        }
        if let data = dict["home_phone"] as? String {
            self.home_phone = data
        }
        if let data = dict["home_address"] as? String {
            self.home_address = data
        }
        if let data = dict["name"] as? String {
            self.name = data
        }
        if let data = dict["income"] as? String {
            self.income = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["msg"] as? String {
            self.msg = data
        }
        if let data = dict["user_pic"] as? String {
            self.user_pic = data
        }
    }
}
