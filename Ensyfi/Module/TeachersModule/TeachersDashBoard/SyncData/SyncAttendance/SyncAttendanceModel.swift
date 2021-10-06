//
//  SyncAttendanceModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 06/10/21.
//


import Foundation
import UIKit

struct SyncAttendanceModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var group_title : String?
            var group_lead_id : String?
            var status : String?
            var group_id : String?
            
        }
        
        struct Response
        {
            var testObj: SyncAttendanceModels?
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
