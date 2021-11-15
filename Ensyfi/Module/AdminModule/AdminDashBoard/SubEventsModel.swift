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
            var dynamic_db : String?
            
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
            var sub_event_name : String?
            var name : String?
           
            }
              var displayedSubEventsData: [DisplayedSubEventsData]

        }
    }
}
