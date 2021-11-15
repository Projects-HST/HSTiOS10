//
//  ClassSectionListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 27/09/21.
//

import Foundation
import UIKit

struct Class_SectionModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [Class_SectionModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedClass_SectionData
           {
            var class_sec_id : String?
            var class_name : String?
            
            }
              var displayedClass_SectionData: [DisplayedClass_SectionData]

        }
    }
}
