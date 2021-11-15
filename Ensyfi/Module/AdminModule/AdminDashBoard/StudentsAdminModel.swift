//
//  StudentsAdminModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 24/08/21.
//

import Foundation
import UIKit

struct ClassViewModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var dynamic_db : String?
            
        }
        
        struct Response
        {
            var testObj: [ClassViewModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedClassViewData
           {
            var class_id : String?
            var class_name : String?
            
            }
              var displayedClassViewData: [DisplayedClassViewData]

        }
    }
}
