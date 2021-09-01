//
//  HomeWorkTestModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 01/09/21.
//


import Foundation
import UIKit

struct HomeWorkTestListModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var hw_type : String?
        }
        
        struct Response
        {
            var testObj: [HomeWorkTestListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedHomeWorkTestListData
           {
            var due_date : String?
            var hw_details : String?
            var hw_id : String?
            var hw_type : String?
            var mark_status : String?
            var subject_name : String?
            var test_date : String?
            var title : String?
            
            }
              var displayedHomeWorkTestListData: [DisplayedHomeWorkTestListData]

        }
    }
}
