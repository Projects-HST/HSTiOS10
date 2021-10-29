//
//  SpecialClassListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/10/21.
//

import Foundation
import UIKit

struct SpecialClassListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
        }
        
        struct Response
        {
            var testObj: [SpecialClassListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedSpecialClassListData
           {
               var special_class_date : String?
               var status : String?
               var end_time : String?
               var subject_name : String?
               var class_sec_id : String?
               var start_time : String?
               var class_sec_name : String?
               var subject_topic : String?
             
            
            
            }
              var displayedSpecialClassListData: [DisplayedSpecialClassListData]
        }
    }
}
