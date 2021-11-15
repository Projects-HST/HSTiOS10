//
//  ClassTestMarksListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 09/11/21.
//

import Foundation
import UIKit

struct ClassTestMarkListModel{
    struct Fetch {
        
        struct Request
        {
            var hw_id : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [ClassTestMarkListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedClassTestMarkListData
           {
               var enroll_id : String?
               var name : String?
               var marks : String?
               
            }
              var displayedClassTestMarkListData: [DisplayedClassTestMarkListData]

        }
    }
}
