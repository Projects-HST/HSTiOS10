//
//  ODApprovallModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation
import UIKit

struct ODApprovalModel{
    struct Fetch {
        
        struct Request
        {
            var status : String?
            var od_id : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: ODApprovalModels?
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
