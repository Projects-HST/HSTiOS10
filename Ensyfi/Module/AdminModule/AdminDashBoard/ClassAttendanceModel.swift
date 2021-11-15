//
//  ClassAttendanceModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//

import Foundation
import UIKit

struct ClassAttendanceListModel{
    struct Fetch {
        
        struct Request
        {
            var date : String?
            var class_ids : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [ClassAttendanceListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedClassAttendanceListData
           {
            var status : String?
            var class_total : String?
            var class_name : String?
            var no_of_present : String?
            var no_of_absent : String?
            var class_id : String?
            }
              var displayedClassAttendanceListData: [DisplayedClassAttendanceListData]

        }
    }
}

