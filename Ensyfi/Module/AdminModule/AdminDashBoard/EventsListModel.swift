//
//  EventsListModel.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import Foundation
import UIKit

struct EventsListModel{
    struct Fetch {
        
        struct Request
        {
            var class_id : String?
            var section_id : String?
            var dynamic_db : String?
            
        }
        
        struct Response
        {
            var testObj: [EventsListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedEventsListData
           {
            var event_date : String?
            var status : String?
            var sub_event_status : String?
            var year_id : String?
            var event_details : String?
            var event_name : String?
            var event_id : String?
           
            }
              var displayedEventsListData: [DisplayedEventsListData]

        }
    }
}
