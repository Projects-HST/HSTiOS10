//
//  OnDutyListPresenter.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//

import Foundation
import UIKit

struct ODStudentsListModel{
    struct Fetch {
        
        struct Request
        {
            var user_type : String?
            var dynamic_db : String?
        }
        
        struct Response
        {
            var testObj: [ODStudentsListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedODStudentsListData
           {
            var class_name : String?
            var from_date : String?
            var id : String?
            var name : String?
            var notes : String?
            var od_for : String?
            var sec_name : String?
            var status : String?
            var to_date : String?
            var user_id : String?
            var user_master_id : String?
            
            }
              var displayedODStudentsListData: [DisplayedODStudentsListData]

        }
    }
}
