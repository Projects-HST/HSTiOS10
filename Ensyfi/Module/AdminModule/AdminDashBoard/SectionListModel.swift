//
//  SectionListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 25/08/21.
//

import Foundation
import UIKit

struct SectionListModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
        }
        
        struct Response
        {
            var testObj: [SectionListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedSectionListData
           {
            var sec_id : String?
            var sec_name : String?
            
            }
              var displayedSectionListData: [DisplayedSectionListData]

        }
    }
}
