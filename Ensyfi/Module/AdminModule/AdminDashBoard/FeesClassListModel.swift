//
//  FeesClassListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation
import UIKit

struct FeesClassListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
        }
        
        struct Response
        {
            var testObj: [FeesClassListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedFeesClassListData
           {
            var class_id : String?
            var class_name : String?
            
            }
              var displayedFeesClassListData: [DisplayedFeesClassListData]

        }
    }
}
