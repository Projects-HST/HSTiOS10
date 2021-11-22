//
//  AddOnDutyModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 18/11/21.
//

import Foundation
import UIKit

struct AddONDutyModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var dynamic_db : String?
            var user_type : String?
            var od_for : String?
            var from_date : String?
            var to_date : String?
            var created_at : String?
            var created_by : String?
            var status : String?
            var notes : String?
        }
        
        struct Response
        {
            var testObj: AddONDutyModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
            var status : String?
            var msg: String?
            var attendance_id: String?
            var isError: Bool
            var message: String?
        }
    }
}
