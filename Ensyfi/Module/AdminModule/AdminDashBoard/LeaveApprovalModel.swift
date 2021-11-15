//
//  LeaveApprovalModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 20/09/21.
//

import Foundation
import UIKit

struct LeaveApprovalModel{
    struct Fetch {
        
        struct Request
        {
            var status : String?
            var leave_id : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: LeaveApprovalModels?
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
