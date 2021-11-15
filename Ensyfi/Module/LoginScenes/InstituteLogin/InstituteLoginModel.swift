//
//  InstituteLoginModel.swift
//  Ensyfi
//
//  Created by HappysanziMac on 19/08/21.
//

import Foundation
import UIKit

struct InstituteLoginModel{
    
    struct Fetch {
        
        struct Request
        {
            var institue_code : String?
            var userName : String?
            var password : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: InstituteLoginModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
            var name : String?
            var status : String?
            var user_id: String?
            var user_name : String?
            var user_pic: String?
            var user_type: String?
            var year_id : String?
            var msg: String?
            var user_type_name: String?
            var isError: Bool
            var message: String?
        }
    }
}
