//
//  ChangePasswordModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/09/21.
//


import Foundation
import UIKit

struct ChangePasswordModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var old_password : String?
            var password : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj:ChangePasswordModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
            var status : String?
            var msg: String?
            var isError: Bool
            var message: String?
        }
    }
}
