//
//  ForgotPswdModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 23/08/21.
//

import Foundation

class ForgotPasswordModels {
    
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
