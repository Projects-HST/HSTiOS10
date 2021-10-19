//
//  AssignmentOverViewModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 12/10/21.
//

import Foundation
import UIKit

struct AssignmentOverViewModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var hw_date : String?
            
        }
        
        struct Response
        {
            var testObj: [AssignmentOverViewModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedAssignmentOverViewData
           {
            var hw_id : String?
            var hw_type : String?
            var title : String?
            var created_at : String?
            var test_date : String?
            var due_date : String?
            var hw_details : String?
            var send_option_status : String?
            var subject_id : String?
            var subject_name : String?
            var name : String?
            
            }
              var displayedAssignmentOverViewData: [DisplayedAssignmentOverViewData]

        }
    }
}
