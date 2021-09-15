//
//  CircularListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//
import Foundation
import UIKit

struct CircularsListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?

        }
        
        struct Response
        {
            var testObj: [CircularsListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedCircularsListData
           {
            var id : String?
            var circular_date : String?
            var circular_title : String?
            var circular_description : String?
            var circular_type : String?
            var status : String?
            
            }
              var displayedCircularsListData: [DisplayedCircularsListData]

        }
    }
}
