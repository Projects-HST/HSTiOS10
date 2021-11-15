//
//  AssignmentListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 12/10/21.
//

import Foundation
import UIKit

struct AssignmentListModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [AssignmentListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedAssignmentListData
           {
            var hw_date : String?
            var hw_count : String?
            var ht_count : String?
            
            }
              var displayedAssignmentListData: [DisplayedAssignmentListData]

        }
    }
}
