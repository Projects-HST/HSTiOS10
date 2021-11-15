//
//  HomeWorkDetailsModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/09/21.
//

import Foundation
import UIKit

struct HomeWorkDetailsModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var hw_type : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [HomeWorkDetailsModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedHomeWorkDetailsData
           {
            var due_date : String?
            var hw_details : String?
            var hw_id : String?
            var hw_type : String?
            var mark_status : String?
            var subject_name : String?
            var test_date : String?
            var title : String?
            
            }
              var displayedHomeWorkDetailsData: [DisplayedHomeWorkDetailsData]

        }
    }
}
