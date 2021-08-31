//
//  LoginModel.swift
//  Ensyfi
//
//  Created by HappysanziMac on 19/08/21.
//

import Foundation
import UIKit

struct LoginModel{
    struct Fetch {
        
        struct Request
        {
            var institue_id : String?
        }
        
        struct Response
        {
            var testObj: LoginModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
            var msg : String?
            var status : String?
            var institute_id: String?
            var institute_logo : String?
            var institute_code: String?
            var institute_name: String?
            var isError: Bool
            var message: String?
        }
    }
}
