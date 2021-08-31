//
//  ForgotPswdModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 23/08/21.
//
import Foundation
import UIKit

struct ForgotPasswordModel{
    struct Fetch {
        
        struct Request
        {
            var userName : String?
        }
        
        struct Response
        {
            var testObj: ForgotPasswordModels?
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
