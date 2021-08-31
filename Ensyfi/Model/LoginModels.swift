//
//  LoginModels.swift
//  Ensyfi
//
//  Created by HappysanziMac on 19/08/21.
//

import Foundation
import UIKit

class LoginModels {
    
    var msg : String?
    var status : String?
    var institute_id: String?
    var institute_logo : String?
    var institute_code: String?
    var institute_name: String?
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["msg"] as? String {
            self.msg = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["institute_id"] as? String {
            self.institute_id = data
        }
        if let data = dict["institute_logo"] as? String {
            self.institute_logo = data
        }
        if let data = dict["institute_code"] as? String {
            self.institute_code = data
        }
        if let data = dict["institute_name"] as? String {
            self.institute_name = data
        }
    }
}

class InstituteLoginModels {
    
    var name : String?
    var status : String?
    var user_id: String?
    var user_name : String?
    var user_pic: String?
    var user_type: String?
    var year_id : String?
    var msg: String?
    var user_type_name: String?
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["name"] as? String {
            self.name = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["user_id"] as? String {
            self.user_id = data
        }
        if let data = dict["user_name"] as? String {
            self.user_name = data
        }
        if let data = dict["user_pic"] as? String {
            self.user_pic = data
        }
        if let data = dict["user_type"] as? String {
            self.user_type = data
        }
        if let data = dict["user_type_name"] as? String {
            self.user_type_name = data
        }
        if let data = dict["year_id"] as? String {
            self.year_id = data
        }
        if let data = dict["msg"] as? String {
            self.msg = data
        }
    }
}
