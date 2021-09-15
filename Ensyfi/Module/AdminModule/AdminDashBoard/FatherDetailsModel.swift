//
//  ParentDetailsModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation
import UIKit

struct FatherDeatilsModel{
    
    struct Fetch {
        
        struct Request
        {
            var admission_id : String?
        }
        
        struct Response
        {
            var testObj: FatherDeatilsModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
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
            var user_pic: String?
            var msg: String?
            var isError: Bool
            var message: String?
        }
    }
}
