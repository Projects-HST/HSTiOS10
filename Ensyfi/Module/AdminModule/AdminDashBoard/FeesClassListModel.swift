//
//  FeesClassListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation
import UIKit

struct FeesListModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var section_id : String?
        }
        
        struct Response
        {
            var testObj: [FeesListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedFeesListData
           {
            var fees_id : String?
            var from_year : String?
            var term_name : String?
            var to_year : String?
            var due_date_to : String?
            var due_date_from : String?
            
            }
              var displayedFeesListData: [DisplayedFeesListData]

        }
    }
}
