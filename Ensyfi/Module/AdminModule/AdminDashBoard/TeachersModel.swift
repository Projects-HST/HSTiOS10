//
//  TeachersModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/08/21.
//

import Foundation
import UIKit

struct TeachersListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
        }
        
        struct Response
        {
            var testObj: [TeachersListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedTeachersListData
           {
            var class_id : String?
            var class_name : String?
            
            }
              var displayedTeachersListData: [DisplayedTeachersListData]

        }
    }
}
