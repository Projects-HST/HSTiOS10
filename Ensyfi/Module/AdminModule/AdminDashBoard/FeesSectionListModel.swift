//
//  FeesSectionListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 08/09/21.
//

import Foundation
import UIKit

struct FeesSectionListModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [FeesSectionListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedFeesSectionListData
           {
            var sec_id : String?
            var sec_name : String?
            
            }
              var displayedFeesSectionListData: [DisplayedFeesSectionListData]

        }
    }
}
