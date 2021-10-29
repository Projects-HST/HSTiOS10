//
//  DayListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 29/10/21.
//
//


import Foundation
import UIKit

struct DayListModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
          
        }
        
        struct Response
        {
            var testObj: [DayListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedDayListData
           {
               var day_name : String?
               var day_id : String?
               
            
            }
              var displayedDayListData: [DisplayedDayListData]
        }
    }
}
