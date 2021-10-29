//
//  ApplyLeaveRequestModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/10/21.
//

import Foundation
import UIKit

struct ApplyLeaveRequestModel{
    struct Fetch {
        
        struct Request
        {
            var user_type : String?
            var user_id : String?
            var leave_master_id : String?
            var leave_type : String?
            var date_from : String?
            var date_to : String?
            var fromTime : String?
            var toTime : String?
            var description : String?
           
        }

        struct Response
        {
            var testObj: ApplyLeaveRequestModels?
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
