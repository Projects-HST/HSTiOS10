//
//  FeesStatusListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 28/09/21.
//

import Foundation
import UIKit

struct FeesStatusListModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var section_id : String?
            var fees_id : String?
        }
        
        struct Response
        {
            var testObj: [FeesStatusListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedFeesStatusListData
           {
            var student_id : String?
            var name : String?
            var id : String?
            var quota_name : String?
            var status : String?
            var quota_id : String?
            var updated_at : String?
            var paid_by : String?
            
            }
              var displayedFeesStatusListData: [DisplayedFeesStatusListData]

        }
    }
}
