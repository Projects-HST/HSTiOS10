//
//  SendAttendanceModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 18/10/21.
//

import Foundation
import UIKit

struct SendAttendanceModel{
    struct Fetch {
        
        struct Request
        {
            var attend_id : String?
            var msg_type : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: SendAttendanceModels?
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
