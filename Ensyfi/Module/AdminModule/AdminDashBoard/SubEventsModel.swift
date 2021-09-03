//
//  EventDetailsModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation
import UIKit

struct SubEventsModel{
    struct Fetch {
        
        struct Request
        {
            var event_id : String?
          
           
        }
        
        struct Response
        {
            var testObj: [SubEventsModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedSubEventsData
           {
            var event_date : String?
            var status : String?
            var sub_event_status : String?
            var year_id : String?
            var event_details : String?
            var event_name : String?
            var event_id : String?
           
            }
              var displayedSubEventsData: [DisplayedSubEventsData]

        }
    }
}
